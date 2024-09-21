import 'package:flutter/material.dart';

import '../models/Battery.dart';

class MyWidgets {
  static Stack getBattery({required int charge}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          //size: const Size(300, 75),
          painter: Battery(charge: charge),
        ),
        Text(
          "Energia rimanente: $charge",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  static Expanded getAlreadyVisitedRowField(String text) {
    /*  Expanded bilancia lo spazio disponibile tra le colonne,
    *   il testo sarà quindi centrato in ciascuna colonna,
    *   grazie all'attributo textAlign: TextAlign.center  */
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  static Padding getNotVisitedRowField(String text) {
    return Padding(
      // *** NOME ANIMALE ***
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  static Padding getNotVisitedTitleField(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  static Text detailsOfExhibit(String text) {
    return Text(text, style: const TextStyle(fontSize: 25));
  }
}
