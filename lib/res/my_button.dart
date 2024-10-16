import 'package:app_rl/providers/energy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/exhibit.dart';
import '../providers/exhibit_provider.dart';
import 'my_string.dart';
import 'my_style.dart';

void saveData(List<Exhibit> visited, int energy) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  late int nPartite = prefs.getInt("nMatch") ?? 0; //Recupero il numero di partite

  nPartite++; //Aggiorno aggiungendo la partita appena conclusa

  prefs.setInt("nMatch", nPartite); //Salvo nuovamente il numero di partite che sono state fatte

  List<String> match = [];
  for (Exhibit ex in visited) {
    match.add(ex.normalName);
  }
  prefs.setStringList("Game-$nPartite-match", match);
  prefs.setInt("Game-$nPartite-energy", energy);
}

class MyButton {
  static ElevatedButton getButton(String text, double? size, void Function()? f) {
    return ElevatedButton(
      onPressed: f,
      style: MyStyle.buttonStyleBig,
      child: MyString.getButtonText(text, size),
    );
  }

  static ElevatedButton alreadyVisitedButton(BuildContext context, bool hasToPop) {
    f() {
      if (hasToPop) Navigator.pop(context);
      Navigator.pushNamed(context, "/alreadyVisited");
    }

    return getButton("Cosa hai già visitato", 23, f);
  }

  static ElevatedButton notVisitedButton(BuildContext context, bool fromAlreadyVisited) {
    f() {
      if (fromAlreadyVisited) Navigator.pop(context);
      Navigator.pushNamed(context, "/notVisited");
    }

    return getButton("Cosa puoi visitare ora", 23, f);
  }

  static ElevatedButton restartButton(BuildContext context, bool hasToPop) {
    f() {
      //Salvo i dati della partita
      saveData(context.read<ExhibitProvider>().visited, context.read<EnergyProvider>().energy);

      context.read<ExhibitProvider>().prepareToStart();
      context.read<EnergyProvider>().prepareToStart();

      if (hasToPop) {
        Navigator.pop(context);
      } //Se siamo in una delle due tabelle
    }

    return getButton("Nuovo tentativo", 18, f);
  }

  static ElevatedButton homePageStartingButton(BuildContext context) {
    f() {
      Navigator.pushNamed(context, "/tutorial");
    }

    return getButton("Iniziamo", 35, f);
  }

  static ElevatedButton deleteDataButton() {
    f() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Questo cancellerà tutti i dati salvati nello SharedPreferences
    }

    return getButton("Cancella dati", 25, f);
  }

  static ElevatedButton tutorialRetryScanButton(BuildContext context) {
    f() {
      context.read<ExhibitProvider>().setDaScansionare();
    }

    return getButton("Riprova scansione", 25, f);
  }

  static ElevatedButton tutorialDecreaseEnergy(BuildContext context) {
    f() {
      context.read<EnergyProvider>().decreaseTutorialEnergy();
    }

    return getButton("Simula una scansione", 23, f);
  }

  static ElevatedButton objectiveStartingButton(BuildContext context) {
    f() {
      Navigator.pushNamed(context, "/exhibit");
    }

    return getButton("Avvio", 30, f);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////

  static ElevatedButton tutorialStartingButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/objective");
        context.read<ExhibitProvider>().setInTutorial(false);
      },
      style: MyStyle.tutorialUpButtonStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Icon(Icons.play_circle_outline, color: Colors.black),
          MyString.getButtonText("Inizia", 25)
        ],
      ),
    );
  }
}
