import 'package:flutter/material.dart';

import '../my_int.dart';
import '../my_string.dart';
import 'my_expanded.dart';
import 'my_text.dart';

class MyPadding {
  static Padding getNotVisitedField(String text) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: MyText.getCenterTextWithSize(text, 28, false)));
  }

  static Padding alreadyVisitedTitle(){
    double s = MyInt.tutorialStringSize.toDouble();
    return Padding(
      padding: MyInt.allPadding,
      child: MyText.getLeftTextWithSize(MyString.cosaHaiVisitato, s, true),
    );
  }

  static Padding alreadyVisitedCombo(BuildContext context, int length, int energy){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          MyExpanded.sceltaPartita(context, length, false),
          MyExpanded.miniBattery(energy)
        ],
      ),
    );
  }
}
