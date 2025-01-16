import 'package:app_rl/providers/energy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/exhibit.dart';
import '../../models/exhibit_list.dart';
import '../../providers/game_provider.dart';
import '../my_colors.dart';
import '../my_int.dart';
import '../my_string.dart';
import 'my_text.dart';
import 'my_stack.dart';

List<Exhibit> getRelativeListOfExhibit(List<String> l) {
  List<Exhibit> retList = [];
  for (String exName in l) {
    retList.add(ExhibitList.getExhibitByName(exName));
  }
  return retList;
}

class MyExpanded {
/*  Expanded bilancia lo spazio disponibile tra le colonne,
    *   il testo sarà quindi centrato in ciascuna colonna,
    *   grazie all'attributo textAlign: TextAlign.center  */

  static Expanded getAlreadyVisitedField(String text, int index, bool isTitle) {
    double p = isTitle ? 2.0 : 6.0;

    return Expanded(
      flex: MyInt.getFlex(index),
      child: Container(
        height: isTitle ? 40 : 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: MyColors.getTableColor(isTitle),
            border: Border.all(color: MyColors.borderColor, width: 0.5)),
        child: Padding(
          padding: EdgeInsets.only(top: p, left: 2.0, right: 2.0, bottom: p),
          child: MyText.getCenterTextWithSize(text, isTitle ? 14 : 15, isTitle),
        ),
      ),
    );
  }

  static Expanded sceltaPartita(BuildContext context, int listLength, bool isTutorial) {
    var gProvR = context.read<GameProvider>();
    var enProvR = context.read<EnergyProvider>();
    var gProvW = context.watch<GameProvider>();

    return Expanded(
      flex: 5,
      child: DropdownButton<String>(
        hint: MyText.getPlainText(MyString.selezionaPartita, false),
        value: isTutorial ? gProvW.tutSelectedMatch : gProvW.selectedMatch,
        items: List.generate(listLength + 1, (index) {
          final gameLabel = MyString.gameLabel(index, listLength);
          return DropdownMenuItem<String>(
            value: index.toString(),
            child: MyText.getPlainText(gameLabel, false),
          );
        }),
        onChanged: (String? newValue) {
          if (isTutorial) {
            gProvR.setTutSelectedMatch(newValue);
          } else {
            gProvR.setSelectedMatch(newValue);
            if (newValue == null || int.parse(newValue) == gProvR.listOfMatch.length) {
              gProvR.setListToDisplay(gProvR.listOfThisRound);
              gProvR.setEnergyToDisplay(enProvR.energy);
            } else {
              gProvR.setListToDisplay(
                  getRelativeListOfExhibit(gProvR.listOfMatch[int.parse(newValue)]));
              gProvR.setEnergyToDisplay(gProvR.listOfEnergy[int.parse(newValue)]);
            }
          }
        },
      ),
    );
  }

  static Expanded miniBattery(int e) {
    return Expanded(
      flex: 2,
      child: MyStack.getBattery(charge: e, batterySize: const Size(100, 45)),
    );
  }

  static Expanded alreadyVisitedList(List<Exhibit> listToDisplay) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(
              listToDisplay.length,
              (index) => Row(
                    children: [
                      MyExpanded.getAlreadyVisitedField(index.toString(), 0, false),
                      MyExpanded.getAlreadyVisitedField(listToDisplay[index].normalName, 1, false),
                      MyExpanded.getAlreadyVisitedField(listToDisplay[index].loc, 2, false),
                      MyExpanded.getAlreadyVisitedField(listToDisplay[index].alim, 3, false),
                    ],
                  )),
        ),
      ),
    );
  }

  static Expanded boxLogo(String src, int flex) {
    return Expanded(
      flex: flex,
      child: ClipRect(child: Image.asset(src, fit: BoxFit.contain)),
    );
    /* BoxFit.contain permette di visualizzare l'intera immagine senza tagliarla */
  }
}
