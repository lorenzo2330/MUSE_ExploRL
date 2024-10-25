import 'package:flutter/material.dart';

class MyColors {
  static Color bgColor = Colors.white;
  static Color firstRowTable = appBarColor;
  static Color otherRowTable = const Color.fromRGBO(54, 104, 255, 0.6);
  static Color borderColor = Colors.black;
  static Color winColor = Colors.lightGreenAccent;
  static Color loseColor = Colors.deepOrange[300]!;
  static Color buttonColor = const Color.fromRGBO(255, 122, 55, 1);
  static Color textOfButtonColor = Colors.white;

  static Color appBarTextColor = Colors.white;
  static Color appBarColor = const Color.fromRGBO(54, 104, 255, 1);

  static Color logoAppBar = Colors.white;
  static Color textColor = Colors.black;

  static Color batteryFull = Colors.green[800]!;
  static Color batteryMid = Colors.deepOrange[400]!;
  static Color batteryLow = Colors.red[800]!;

  static Color getResultColor(bool noEnergy, bool hasWin) {
    if (noEnergy || hasWin) {
      return hasWin ? winColor : loseColor;
    }
    return Colors.white;
  }

  static Color getTableColor(bool isTitle){
    return isTitle ? MyColors.firstRowTable : MyColors.otherRowTable;
  }
}