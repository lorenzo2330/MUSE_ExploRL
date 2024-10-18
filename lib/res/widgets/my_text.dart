import 'package:app_rl/res/my_colors.dart';
import 'package:flutter/material.dart';

class MyText {
  static const String fontMuse = "HelveticaNeue";
  static const FontWeight fontNorm = FontWeight.w400; //55 Regular
  static const FontWeight fontTitle = FontWeight.w800; //75 Bold

  static FontWeight getFontWeight(bool title) {
    return title ? fontTitle : fontNorm;
  }

  /* ---- FONT ---- */

  static Text getCreditText(String text){
    TextStyle style =
    TextStyle(fontSize: 15, fontFamily: fontMuse, fontWeight: getFontWeight(false));
    return Text(text, style: style, textAlign: TextAlign.left);
  }

  static Text getText(String text, TextStyle style) {
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  static Text getPlainText(String text, bool title) {
    TextStyle style = TextStyle(fontFamily: fontMuse, fontWeight: getFontWeight(title));
    return getText(text, style);
  }

  static Text getCenterTextWithSize(String text, double size, bool title) {
    TextStyle style =
        TextStyle(fontSize: size, fontFamily: fontMuse, fontWeight: getFontWeight(title));
    return getText(text, style);
  }

  static Text getItalicCenterTextWithSize(String text, double size, bool title) {
    TextStyle style = TextStyle(
        fontSize: size,
        fontFamily: fontMuse,
        fontWeight: getFontWeight(title),
        fontStyle: FontStyle.italic);
    return getText(text, style);
  }

  static Text getButtonText(String text, double? size) {
    FontWeight f = getFontWeight(false);
    Color c = MyColors.textOfButtonColor;
    TextStyle style;
    if (size != null) {
      style = TextStyle(fontSize: size, fontFamily: fontMuse, fontWeight: f, color: c);
    } else {
      style = TextStyle(fontFamily: fontMuse, fontWeight: f, color: c);
    }
    return getText(text, style);
  }

  static Text homePageText(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: MyText.fontMuse,
        fontWeight: MyText.fontTitle,
        color: Colors.white,
        fontSize: size,
      ),
      textAlign: TextAlign.center,
    );
  }
}
