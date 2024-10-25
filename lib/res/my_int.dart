
import 'package:flutter/material.dart';

class MyInt {
  static const int titleSize = 30;
  static const int subtitleSize = 20;
  static const int tutorialStringSize = 25;
  static const int bottomBarHeight = 85;
  static const Size batterySize = Size(300, 50);
  static const double cardHeight = 110;
  static const double leftMargin = 20;
  static const EdgeInsets leftPadding = EdgeInsets.only(left: leftMargin);
  static const EdgeInsets allPadding = EdgeInsets.only(left: leftMargin, right: leftMargin, top: leftMargin, bottom: leftMargin);
  static const double textNormalButtonSize = 23;
  static const double textMiniButtonSize = 20;

  static int getFlex(int index){ return index == 0 ? 1 : index == 3 ? 4 : 3; }
}