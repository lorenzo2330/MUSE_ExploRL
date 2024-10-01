
import 'package:app_rl/providers/energy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/exhibit.dart';
import '../providers/exhibit_provider.dart';
import 'my_int.dart';
import 'my_string.dart';
import 'my_style.dart';

void saveData(List<Exhibit> visited, int energy) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  late int nPartite =
      prefs.getInt("nMatch") ?? 0; //Recupero il numero di partite

  nPartite++; //Aggiorno aggiungendo la partita appena conclusa

  prefs.setInt("nMatch",
      nPartite); //Salvo nuovamente il numero di partite che sono state fatte

  List<String> match = [];
  for (Exhibit ex in visited) {
    match.add(ex.normalName);
  }
  prefs.setStringList("Game-$nPartite-match", match);
  prefs.setInt("Game-$nPartite-energy", energy);
}

class MyButton {



  static ElevatedButton homePageBottomButton = ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        fixedSize:
            WidgetStateProperty.all<Size>(MyInt.homePageBottomButtonSize),
      ),
      child: Text(MyString.placeholder,
          style: TextStyle(
            fontSize: MyInt.homePageBottomButtonTextSize.toDouble(),
          )));

  static ElevatedButton alreadyVisitedButton(BuildContext context, bool hasToPop, bool big) {
    return ElevatedButton(
        onPressed: () {
          if(hasToPop) Navigator.pop(context);
          Navigator.pushNamed(context, "/alreadyVisited");
        },
        style: MyStyle.buttonStyleBig,
        child: MyString.getBigButtonText("Cosa hai già visitato")
    );
  }

  static ElevatedButton notVisitedButton(BuildContext context, bool fromAlreadyVisited) {
    return ElevatedButton(
        onPressed: () {
          if(fromAlreadyVisited) Navigator.pop(context);
          Navigator.pushNamed(context, "/notVisited");
        },
        style: MyStyle.buttonStyleBig,
        child: MyString.getBigButtonText("Cosa puoi visitare ora"));
  }

  static ElevatedButton restartButton(BuildContext context, bool hasToPop) {
    return ElevatedButton(
        onPressed: () {
          //Salvo i dati della partita
          saveData(context.read<ExhibitProvider>().visited, context.read<EnergyProvider>().energy);

          context.read<ExhibitProvider>().prepareToStart();
          context.read<EnergyProvider>().prepareToStart();

          if(hasToPop) { Navigator.pop(context); }  //Se siamo in una delle due tabelle
        },
        style: MyStyle.buttonStyleBig,
        child: MyString.getBigButtonText("Nuovo tentativo")
    );
  }



}
