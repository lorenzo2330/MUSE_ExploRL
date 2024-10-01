
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyString {
  static const String appName = "AppRL";
  static const String scanQr = "Scansiona il codice QR";
  static const String placeholder = "TODO";
  static const String nomeAttivita = "Nome Attività";
  static const String tutorial = "Tutorial";

  static String getAlimentazione(String alim){ return "Alimentazione: $alim"; }

  static String getLocalitaGeografica(String locGeo){ return "Località geografica: $locGeo"; }

  static Text getResultText(bool noEnergy, bool hasWin){
    String resString = "";

    if(noEnergy) { resString = "Hai esaurito tutti i punti energia"; }
    if(hasWin) { resString = "Hai trovato l'exhibit vincente!"; }

    return Text(
      resString,
      style: TextStyle(fontSize: noEnergy || hasWin ? 25 : 1),
      textAlign: TextAlign.center,
    );
  }

  static Text getFinalEnergyText(bool hasWin, int energy){
    return Text(
      hasWin ? "Punti energia finali: $energy" : "",
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20),
    );
  }

  static Text getBigButtonText(String text){
    return Text(
      text,
      style: TextStyle(fontSize: 22, color: MyColors.textOfButtonColor),
      textAlign: TextAlign.center,
    );
  }
}