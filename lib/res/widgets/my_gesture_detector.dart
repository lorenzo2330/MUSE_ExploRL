
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/exhibit.dart';
import '../../providers/exhibit_provider.dart';
import '../my_string.dart';
import 'my_text.dart';

class MyGestureDetector {
  static GestureDetector imageBox(BuildContext context) {
    AnimalProvider exProvR = context.read<AnimalProvider>();
    Animale e;
    if (exProvR.inTutorial) {
      e = exProvR.prossimoForTutorial!;
    } else {
      e = exProvR.nextExhibit;
    }

    var imgPath = "images/${e.resPhoto}";
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Immagine più grande
                      Image.asset(imgPath),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, //Chiude il popup
                          child: MyText.getPlainText(MyString.chiudi, false))
                    ],
                  ),
                );
              });
        },
        child: Image.asset(imgPath, scale: 2));
  }
}