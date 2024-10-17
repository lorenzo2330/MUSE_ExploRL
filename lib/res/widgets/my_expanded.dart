import 'package:flutter/material.dart';

import '../my_colors.dart';
import '../my_int.dart';
import '../my_text.dart';

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
            color: isTitle ? MyColors.firstRowTable : MyColors.otherRowTable,
            border: Border.all(color: MyColors.borderColor, width: 0.5)),
        child: Padding(
          padding: EdgeInsets.only(top: p, left: 2.0, right: 2.0, bottom: p),
          child: MyText.getCenterTextWithSize(text, isTitle ? 18 : 16, isTitle),
        ),
      ),
    );
  }
}
