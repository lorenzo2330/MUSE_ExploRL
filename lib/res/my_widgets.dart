import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/battery.dart';
import '../models/exhibit.dart';
import '../providers/energy_provider.dart';
import '../providers/exhibit_provider.dart';
import 'my_button.dart';

class MyWidgets {
  static Stack getBattery({required int charge, required Size batterySize}) {
    bool isMini = batterySize.width != MyInt.batterySize.width;
    String text = isMini ? "$charge   " : "Energia rimanente: $charge   ";
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(painter: Battery(charge: charge, batterySize: batterySize)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyString.getCenterTextWithSize(text, 17, false),
            /*style: const TextStyle(color: Colors.black87, fontSize: 17, fontWeight: FontWeight.bold)*/
            const Icon(Icons.offline_bolt),
          ],
        )
      ],
    );
  }

  static Expanded getAlreadyVisitedField(String text, int index, bool isTitle) {
    double p = isTitle ? 2.0 : 6.0;
    /*  Expanded bilancia lo spazio disponibile tra le colonne,
    *   il testo sarà quindi centrato in ciascuna colonna,
    *   grazie all'attributo textAlign: TextAlign.center  */
    return Expanded(
      flex: MyInt.getFlex(index),
      child: Container(
        height: isTitle ? 40 : 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isTitle ? MyColors.firstRowTable : MyColors.otherRowTable,
            border: Border.all(color: MyColors.borderColor, width: 0.5)),
        child: Padding(
          padding: EdgeInsets.only(top: p, left: 2.0, right: 2.0, bottom: p),
          child: MyString.getCenterTextWithSize(text, isTitle ? 18 : 16, isTitle),
        ),
      ),
    );
  }

  static Padding getNotVisitedField(String text) {
    /*  Expanded bilancia lo spazio disponibile tra le colonne,
    *   il testo sarà quindi centrato in ciascuna colonna,
    *   grazie all'attributo textAlign: TextAlign.center  */
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: MyString.getCenterTextWithSize(text, 30, false))
    );
  }

  static SizedBox findedExhibit(BuildContext context, bool noEnergy, bool hasWin) {
    var exProv = context.read<ExhibitProvider>();
    var nextExh = exProv.nextExhibit;
    var energy = context.read<EnergyProvider>().energy;

    return SizedBox(
      height: MyInt.qrSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              MyString.getCenterTextWithSize(MyString.getAlimentazione(nextExh.alim), 25, false),
              MyString.getCenterTextWithSize(MyString.getLocalitaGeografica(nextExh.loc), 25, false)
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
                    MyString.getResultText(noEnergy, hasWin),
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
                    MyString.getCenterTextWithSize(hasWin ? "Punti energia finali: $energy" : "", 20, false),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  static Column namesOfExhibits(Exhibit e) {
    return Column(children: [MyString.getItalicCenterTextWithSize(e.scientificName, 22, false), MyString.getCenterTextWithSize(e.normalName, 22, false)]);
  }

  static SizedBox imageBox(BuildContext context, Exhibit e) {
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
                          MyWidgets.namesOfExhibits(e),
                          Image.asset(imgPath),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, //Chiude il popup
                              child: MyString.getPlainText("Chiudi", false))
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Image.asset(imgPath, scale: 2)),
    );
  }

  static BottomAppBar myBottomAppBar(BuildContext context) {
    return BottomAppBar(
        color: MyColors.backgroundYellow,
        height: MyInt.bottomBarHeight.toDouble(),
        child: MyWidgets.getBattery(
            charge: context.watch<EnergyProvider>().energy, batterySize: MyInt.batterySize));
  }

  static ListView getListOfNotVisitedExhibit(BuildContext context, bool tutorial) {
    var exProvW = context.watch<ExhibitProvider>();
    var exProvR = context.read<ExhibitProvider>();
    var nextExhW = exProvW.nextExhibit;
    var nextExhR = exProvR.nextExhibit;
    double pTop = tutorial ? 8.0 : 20;

    return ListView(
      children: [
        ...List.generate(
            nextExhW.neighbors.length,
            (index) => InkWell(
                  onTap: () {
                    if (tutorial) {
                      exProvR.setProssimoForTutorial(nextExhR.neighbors[index]);
                    } else {
                      exProvR.setExhibit(nextExhR.neighbors[index]);
                      exProvR.setDaScansionare();
                      Navigator.pop(context); // Torno a ExhibitPage
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: pTop, left: 8.0, right: 8.0, bottom: 8.0),
                    child: SizedBox(
                      height: MyInt.cardHeight,
                      child: Card(
                        color: MyColors.otherRowTable,
                        child: MyWidgets.getNotVisitedField(nextExhW.neighbors[index].normalName),
                      ),
                    ),
                  ),
                )),
      ],
    );
  }

  static Column creditList(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MyString.getCenterTextWithSize("Credit 1: credit 1", 20, false),
        MyString.getCenterTextWithSize("Credit 2: credit 2", 20, false),
        MyString.getCenterTextWithSize("Credit 3: credit 3", 20, false),
        MyString.getCenterTextWithSize("Credit 4: credit 4", 20, false),
        MyString.getCenterTextWithSize("Credit 5: credit 5", 20, false),
        MyString.getCenterTextWithSize("Credit 6: credit 6", 20, false),
        MyString.getCenterTextWithSize("Credit 7: credit 7", 20, false),
        MyString.getCenterTextWithSize("Credit 8: credit 8", 20, false),
      ],
    );
  }
}
