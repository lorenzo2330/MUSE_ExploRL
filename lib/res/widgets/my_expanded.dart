import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider.dart';
import '../my_colors.dart';
import '../my_int.dart';
import '../my_string.dart';
import '../my_text.dart';
import 'my_stack.dart';

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
          child: MyText.getCenterTextWithSize(text, isTitle ? 14 : 16, isTitle),
        ),
      ),
    );
  }

  static Expanded sceltaPartita(BuildContext context, int listLength) {
    var gProvR = context.read<GameProvider>();

    return Expanded(
      flex: 5,
      child: DropdownButton<String>(
        hint: MyText.getPlainText(MyString.selezionaPartita, false),
        value: gProvR.tutSelectedMatch,
        items: List.generate(listLength + 1, (index) {
          final gameLabel = MyString.gameLabel(index, listLength);
          return DropdownMenuItem<String>(
            value: index.toString(),
            child: MyText.getPlainText(gameLabel, false),
          );
        }),
        onChanged: (String? value) {
          gProvR.setTutSelectedMatch(value);
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
}
