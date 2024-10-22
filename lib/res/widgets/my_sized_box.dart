import 'package:app_rl/res/widgets/my_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/exhibit.dart';
import '../../providers/energy_provider.dart';
import '../../providers/exhibit_provider.dart';
import 'my_button.dart';
import '../my_colors.dart';
import '../my_int.dart';
import '../my_string.dart';
import 'my_text.dart';

class MySizedBox {
  static SizedBox findedExhibit(BuildContext context, bool noEnergy, bool hasWin) {
    var exProv = context.read<ExhibitProvider>();
    var nextExh = exProv.nextExhibit;
    var energy = context.read<EnergyProvider>().energy;
    double resultSize = noEnergy || hasWin ? 25 : 1;
    String resultText = MyString.result(noEnergy, hasWin);

    return SizedBox(
      height: MyInt.qrSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              MyText.getCenterTextWithSize(MyString.getAlimentazione(nextExh.alim), 25, false),
              MyText.getCenterTextWithSize(MyString.getLocalitaGeografica(nextExh.loc), 25, false)
            ],
          ),
          SizedBox(
            height: hasWin ? 275 : 275,
            width: 325,
            child: Container(
              color: MyColors.getResultColor(noEnergy, hasWin),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyText.getCenterTextWithSize(resultText, resultSize, false),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyButton.alreadyVisitedButton(context, false),
                          noEnergy || hasWin
                              ? MyButton.restartButton(context, false)
                              : MyButton.notVisitedButton(context, false),
                        ],
                      ),
                    ),
                    MyText.getCenterTextWithSize(MyString.finalEnergy(hasWin, energy), 20, false),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  static SizedBox imageBox(BuildContext context) {
    ExhibitProvider exProvR = context.read<ExhibitProvider>();
    Exhibit e;
    if(exProvR.inTutorial){ e = exProvR.prossimoForTutorial!; }
    else { e = exProvR.nextExhibit; }

    var imgPath = "images/${e.resPhoto}";
    return SizedBox(
      height: 150,
      width: 150,
      child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.white,
                    child: SizedBox(
                      height: 400,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Immagine più grande
                          MyColumn.namesOfExhibits(context),
                          Image.asset(imgPath),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, //Chiude il popup
                              child: MyText.getPlainText(MyString.chiudi, false))
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Image.asset(imgPath, scale: 2)),
    );
  }

  static SizedBox boxLogo(String src) {
    return SizedBox(
      //width: 105,
      height: 35,
      child: ClipRect(child: Image.asset(src, fit: BoxFit.contain)),
    );
    /* BoxFit.contain permette di visualizzare l'intera immagine senza tagliarla */
  }
}
