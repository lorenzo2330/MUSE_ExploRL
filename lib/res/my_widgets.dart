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
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(painter: Battery(charge: charge, batterySize: batterySize)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isMini ? "$charge   " : "Energia rimanente: $charge   ",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.offline_bolt),
          ],
        )
      ],
    );
  }

  //FATTI

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
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isTitle ? 18 : 16),
          ),
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
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30),
          ),
        ));
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
              MyWidgets.detailsOfExhibit(MyString.getAlimentazione(nextExh.alim)),
              MyWidgets.detailsOfExhibit(MyString.getLocalitaGeografica(nextExh.loc))
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
                          MyButton.alreadyVisitedButton(context, false, false),
                          noEnergy || hasWin
                              ? MyButton.restartButton(context, false)
                              : MyButton.notVisitedButton(context, false),
                        ],
                      ),
                    ),
                    MyString.getFinalEnergyText(hasWin, energy),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  static Text detailsOfExhibit(String text) {
    return Text(text, style: const TextStyle(fontSize: 25));
  }

  static Column namesOfExhibits(Exhibit e) {
    return Column(
      children: [
        Text(e.scientificName,
            style: const TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
            )),
        Text(e.normalName, style: const TextStyle(fontSize: 22)),
      ],
    );
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
                              child: const Text("Chiudi"))
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
}
