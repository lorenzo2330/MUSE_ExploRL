import 'package:app_rl/res/myColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Battery.dart';
import '../providers/ExhibitProvider.dart';
import 'myButton.dart';

class MyWidgets {
  static Stack getBattery({required int charge}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          //size: const Size(300, 75),
          painter: Battery(charge: charge),
        ),
        Text(
          "Energia rimanente: $charge",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  static Expanded getAlreadyVisitedField(String text, int index, bool isTitle) {
    /*  Expanded bilancia lo spazio disponibile tra le colonne,
    *   il testo sarà quindi centrato in ciascuna colonna,
    *   grazie all'attributo textAlign: TextAlign.center  */
    return Expanded(
      flex: index == 0
          ? 1
          : index == 3
              ? 4
              : 3,
      child: Container(
        height: isTitle ? 40 : 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isTitle ? MyColors.firstRowTable : MyColors.otherRowTable,
            border: Border.all(color: MyColors.borderColor, width: 0.5)),
        child: Padding(
          padding: EdgeInsets.only(
              top: isTitle ? 2.0 : 6.0,
              left: 2.0,
              right: 2.0,
              bottom: isTitle ? 2.0 : 6.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isTitle ? 18 : 16),
          ),
        ),
      ),
    );
  }

  static Expanded getNotVisitedField(String text, bool isTitle) {
    /*  Expanded bilancia lo spazio disponibile tra le colonne,
    *   il testo sarà quindi centrato in ciascuna colonna,
    *   grazie all'attributo textAlign: TextAlign.center  */
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isTitle ? 25 : 20),
          )),
    );
  }

  static SizedBox findedExhibit(BuildContext context, bool endGame) {
    var exProv = context.watch<ExhibitProvider>();
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              MyWidgets.detailsOfExhibit(
                  "Alimentazione: ${exProv.nextExhibit.alim}"),
              MyWidgets.detailsOfExhibit(
                  "Località geografica: ${exProv.nextExhibit.loc}")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton.alreadyVisitedButton(context),
              endGame
                  ? MyButton.restartButton(context)
                  : MyButton.notVisitedButton(context),
            ],
          )
        ],
      ),
    );
  }

  static Text detailsOfExhibit(String text) {
    return Text(text, style: const TextStyle(fontSize: 25));
  }

  static Column namesOfExhibits(BuildContext context) {
    var exProv = context.watch<ExhibitProvider>();
    return Column(
      children: [
        Text(exProv.nextExhibit.scientificName,
            style: const TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
            )),
        Text(exProv.nextExhibit.normalName,
            style: const TextStyle(fontSize: 22)),
      ],
    );
  }

  static SizedBox imageBox(BuildContext context) {
    var exProv = context.watch<ExhibitProvider>();
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.asset("images/${exProv.nextExhibit.resPhoto}", scale: 2),
    );
  }
}
