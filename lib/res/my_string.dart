import 'package:app_rl/res/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class MyString {
  static const String appName = "AppRL";
  static const String scanQr = "Scansiona il codice QR";
  static const String placeholder = "TODO";
  static const String nomeAttivita = "Nome Attività";
  static const String tutorial = "Tutorial";

  static const String myFont = "helveticaneueltstd_blk";
  static const String font55 = "HNLTStd55";
  static const String font75 = "HNLTStd75";

  static String getAlimentazione(String alim) {
    return "Alimentazione: $alim";
  }

  static String getLocalitaGeografica(String locGeo) {
    return "Località geografica: $locGeo";
  }

  static Text getResultText(bool noEnergy, bool hasWin) {
    String resString = "";

    if (noEnergy) {
      resString = "Hai esaurito tutti i punti energia";
    }
    if (hasWin) {
      resString = "Hai trovato l'exhibit vincente!";
    }

    return getCenterTextWithSize(resString, noEnergy || hasWin ? 25 : 1, false);
  }

  static Text qrBottomText(Barcode? result, bool scansioneCorretta) {
    String text = (result != null)
        ? scansioneCorretta
            ? "Trovato QR corretto: ${result.code}"
            : "Trovato QR errato"
        : "Scansiona il QR code";
    double size = (result != null) ? 12 : 20;
    return getCenterTextWithSize(text, size, false);
  }

  /* ---- FONT ---- */

  static Text getText(String text, TextStyle style) {
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  static Text getPlainText(String text, bool title) {
    TextStyle style = TextStyle(fontFamily: title ? font75 : font55);
    return getText(text, style);
  }

  static Text getCenterTextWithSize(String text, double size, bool title) {
    TextStyle style = TextStyle(fontSize: size, fontFamily: title ? font75 : font55);
    return getText(text, style);
  }

  static Text getItalicCenterTextWithSize(String text, double size, bool title) {
    TextStyle style =
        TextStyle(fontSize: size, fontFamily: title ? font75 : font55, fontStyle: FontStyle.italic);
    return getText(text, style);
  }

  static Text getButtonText(String text, double? size) {
    TextStyle style;
    if (size != null) {
      style = TextStyle(fontSize: size, fontFamily: font55, color: MyColors.textOfButtonColor);
    } else {
      style = TextStyle(fontFamily: font55, color: MyColors.textOfButtonColor);
    }
    return getText(text, style);
  }
}
