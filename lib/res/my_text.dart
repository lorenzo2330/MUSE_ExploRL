import 'package:app_rl/res/my_colors.dart';
import 'package:flutter/material.dart';

class MyText {
  static const String font1 = "helveticaneueltstd_blk";
  static const String font55 = "HNLTStd55";
  static const String font75 = "HNLTStd75";

  static String getFont(bool title) {
    return title ? font75 : font55;
  }

  /* ---- FONT ---- */

  static Text getText(String text, TextStyle style) {
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  static Text getPlainText(String text, bool title) {
    TextStyle style = TextStyle(fontFamily: getFont(title));
    return getText(text, style);
  }

  static Text getCenterTextWithSize(String text, double size, bool title) {
    TextStyle style = TextStyle(fontSize: size, fontFamily: getFont(title));
    return getText(text, style);
  }

  static Text getItalicCenterTextWithSize(String text, double size, bool title) {
    TextStyle style =
        TextStyle(fontSize: size, fontFamily: getFont(title), fontStyle: FontStyle.italic);
    return getText(text, style);
  }

  static Text getButtonText(String text, double? size) {
    String f = getFont(false);
    Color c = MyColors.textOfButtonColor;
    TextStyle style;
    if (size != null) {
      style = TextStyle(fontSize: size, fontFamily: f, color: c);
    } else {
      style = TextStyle(fontFamily: f, color: c);
    }
    return getText(text, style);
  }
}
