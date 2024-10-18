import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/exhibit.dart';
import '../../providers/exhibit_provider.dart';
import 'my_column.dart';
import 'my_text.dart';
import '../my_style.dart';

void saveData(List<Exhibit> visited, int energy) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  late int nPartite = prefs.getInt(MyString.nMatch) ?? 0; //Recupero il numero di partite

  nPartite++; //Aggiorno aggiungendo la partita appena conclusa

  prefs.setInt(
      MyString.nMatch, nPartite); //Salvo nuovamente il numero di partite che sono state fatte

  List<String> match = [];
  for (Exhibit ex in visited) {
    match.add(ex.normalName);
  }
  prefs.setStringList(MyString.gameMatch(nPartite), match);
  prefs.setInt(MyString.gameEnergy(nPartite), energy);
}

class MyButton {
  static ElevatedButton getButton(String text, double? size, void Function()? f) {
    return ElevatedButton(
      onPressed: f,
      style: MyStyle.bigButtonStyle,
      child: MyText.getButtonText(text, size),
    );
  }

  static ElevatedButton getMiniButton(Text text, IconData? icon, void Function()? f) {
    return ElevatedButton(
      onPressed: f,
      style: MyStyle.smallButtonStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[Icon(icon, color: Colors.black), text],
      ),
    );
  }

  static ElevatedButton alreadyVisitedButton(BuildContext context, bool hasToPop) {
    f() {
      if (hasToPop) Navigator.pop(context);
      Navigator.pushNamed(context, MyString.routeAlreadyVisited);
    }

    return getButton(MyString.cosaHaiVisitato, 23, f);
  }

  static ElevatedButton notVisitedButton(BuildContext context, bool fromAlreadyVisited) {
    f() {
      if (fromAlreadyVisited) Navigator.pop(context);
      Navigator.pushNamed(context, MyString.routeNotVisited);
    }

    return getButton(MyString.cosaPuoiVisitare, 23, f);
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

    return getButton(MyString.nuovoTentativo, 18, f);
  }

  static ElevatedButton homePageStartingButton(BuildContext context) {
    f() {
      Navigator.pushNamed(context, MyString.routeTutorial);
    }

    return getButton(MyString.iniziamo, 35, f);
  }

  static ElevatedButton deleteDataButton() {
    f() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Questo cancellerà tutti i dati salvati nello SharedPreferences
    }

    return getButton(MyString.cancellaDati, 25, f);
  }

  static ElevatedButton tutorialRetryScanButton(BuildContext context) {
    f() {
      context.read<ExhibitProvider>().setDaScansionare();
    }

    return getButton(MyString.riprovaScansione, 25, f);
  }

  static ElevatedButton tutorialRetryNotVisitedButton(BuildContext context) {
    f() {
      context.read<ExhibitProvider>().setProssimoForTutorial(null);
    }

    return getButton(MyString.riprova, 25, f);
  }

  static ElevatedButton tutorialDecreaseEnergy(BuildContext context) {
    f() {
      context.read<EnergyProvider>().decreaseTutorialEnergy();
    }

    return getButton(MyString.simulaScansione, 23, f);
  }

  static ElevatedButton tutorialRechargeEnergy(BuildContext context) {
    f() {
      context.read<EnergyProvider>().rechargeTutorialEnergy();
    }

    return getButton(MyString.ricaricaEnergia, 23, f);
  }

  static ElevatedButton objectiveStartingButton(BuildContext context) {
    f() {
      Navigator.pushNamed(context, MyString.routeExhibit);
    }

    return getButton(MyString.avvio, 30, f);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////

  static ElevatedButton tutorialStartingButton(BuildContext context) {
    f() {
      Navigator.pushNamed(context, MyString.routeObjective);
      context.read<ExhibitProvider>().setInTutorial(false);
    }

    Text text = MyText.getButtonText(MyString.iniziamo, 20);

    return getMiniButton(text, Icons.play_circle_outline, f);
  }

  static ElevatedButton creditsButton(BuildContext context) {

    Text text = MyText.getButtonText(MyString.credits, 20);

    Text text2 = MyText.getButtonText(MyString.chiudi, 20);

    f2() {
      Navigator.of(context).pop();
    }

    f() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.getCenterTextWithSize(MyString.creditTitle, 30, true),
                  MyColumn.creditList(),
                ],
              ),
            ),
            actions: [getMiniButton(text2, Icons.close, f2)],
          );
        },
      );
    }



    return getMiniButton(text, Icons.copyright, f);
  }
}
