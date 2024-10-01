
import 'package:app_rl/res/my_colors.dart';
import 'package:flutter/material.dart';

class MyStyle{
  static ButtonStyle buttonStyleBig = ButtonStyle(
    fixedSize: WidgetStateProperty.all<Size>(const Size(275, 70)),
    backgroundColor: WidgetStateProperty.all<Color>(MyColors.buttonColor),
  );

  static ButtonStyle tutorialUpButtonStyle = ButtonStyle(
    fixedSize: WidgetStateProperty.all<Size>(const Size(150, 50)),
    backgroundColor: WidgetStateProperty.all<Color>(MyColors.buttonColor),
  );
}