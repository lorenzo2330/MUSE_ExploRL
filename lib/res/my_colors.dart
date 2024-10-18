import 'package:flutter/material.dart';

class MyColors {
  static Color backgroundYellow = Colors.yellow[100]!;
  static Color firstRowTable = Colors.yellow[700]!;
  static Color otherRowTable = Colors.yellow[300]!;
  static Color borderColor = Colors.black;
  static Color winColor = Colors.lightGreenAccent;
  static Color loseColor = Colors.deepOrange[300]!;
  static Color buttonColor = firstRowTable;
  static Color textOfButtonColor = Colors.black;
  static Color bottomAppBarColor = Colors.white;

  static Color getResultColor(bool noEnergy, bool hasWin) {
    if (noEnergy || hasWin) {
      return hasWin ? winColor : loseColor;
    }
    return backgroundYellow;
  }

  static Color getTableColor(bool isTitle){
    return isTitle ? MyColors.firstRowTable : MyColors.otherRowTable;
  }
}