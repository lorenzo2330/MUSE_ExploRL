import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/battery.dart';
import '../models/exhibit.dart';
import '../providers/energy_provider.dart';
import '../providers/exhibit_provider.dart';
import 'my_button.dart';


class MyWidgets {
  static Stack getBattery({required int charge, required Size batterySize}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          //size: const Size(300, 75),
          painter: Battery(
              charge: charge,
              batterySize: batterySize
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              batterySize.width == MyInt.batterySize.width
                  ? "Energia rimanente: $charge   "
                  : "$charge   ",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            //const Icon(Icons.offline_bolt_outlined, color: Colors.yellow,),
            //const Icon(Icons.offline_bolt, color: Colors.yellow,),
            const Icon(Icons.offline_bolt_outlined),
            //const Icon(Icons.offline_bolt),
          ],
        )
      ],
    );
  }

  static Expanded getAlreadyVisitedField(String text, int index, bool isTitle) {
    /*  Expanded bilancia lo spazio disponibile tra le colonne,
    *   il testo sarà quindi centrato in ciascuna colonna,
    *   grazie all'attributo textAlign: TextAlign.center  */
    return Expanded(
      flex: index == 0
          ? 1
          : index == 3
          ? 4
          : 3,
      child: Container(
        height: isTitle ? 40 : 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isTitle ? MyColors.firstRowTable : MyColors.otherRowTable,
            border: Border.all(color: MyColors.borderColor, width: 0.5)),
        child: Padding(
          padding: EdgeInsets.only(
              top: isTitle ? 2.0 : 6.0,
              left: 2.0,
              right: 2.0,
              bottom: isTitle ? 2.0 : 6.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isTitle ? 18 : 16),
          ),
        ),
      ),
    );
  }

  static Padding getNotVisitedField(String text, bool isTitle) {
    /*  Expanded bilancia lo spazio disponibile tra le colonne,
    *   il testo sarà quindi centrato in ciascuna colonna,
    *   grazie all'attributo textAlign: TextAlign.center  */
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: isTitle ? 25 : 20),
        ));
  }

  static SizedBox findedExhibit(BuildContext context, bool noEnergy,
      bool hasWin) {
    var exProv = context.read<ExhibitProvider>();
    return SizedBox(
      height: MyInt.qrSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              MyWidgets.detailsOfExhibit(
                  "Alimentazione: ${exProv.nextExhibit.alim}"),
              MyWidgets.detailsOfExhibit(
                  "Località geografica: ${exProv.nextExhibit.loc}")
            ],
          ),
          SizedBox(
            height: 275,
            width: 325,
            child: Container(
              color: noEnergy || hasWin ? noEnergy
                  ? Colors.deepOrangeAccent
                  : Colors.lightGreenAccent : MyColors.backgroundYellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    noEnergy || hasWin ? noEnergy
                        ? "Hai esaurito tutti i punti energia"
                        : "Hai trovato l'exhibit vincente!" : "",
                    style: TextStyle(fontSize: noEnergy || hasWin ? 25 : 1),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: [
                      MyButton.alreadyVisitedButton(context),
                      noEnergy || hasWin
                          ? MyButton.restartButton(context, false)
                          : MyButton.notVisitedButton(context, false),
                    ],
                  ),
                  Text(hasWin ? "Punti energia finali: ${context.watch<EnergyProvider>().energy}" : "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize:  20),
                  )
                ],
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
        Text(e.normalName,
            style: const TextStyle(fontSize: 22)),
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
                        children: [ //Immagine più grande
                          MyWidgets.namesOfExhibits(e),
                          Image.asset(imgPath),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, //Chiude il popup
                              child: const Text("Chiudi")
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          },
          child: Image.asset(imgPath, scale: 2)
      ),
    );
  }

  static ListView getListOfNotVisitedExhibit(BuildContext context, bool tutorial){
    return ListView(
      children: [
        ...List.generate(
            context
                .watch<ExhibitProvider>()
                .nextExhibit
                .neighbors
                .length,
                (index) => InkWell(
              onTap: () {
                if(tutorial){
                  context.read<ExhibitProvider>().setProssimoForTutorial(context
                      .read<ExhibitProvider>()
                      .nextExhibit
                      .neighbors[index]);
                }
                else {
                  var exProv = context.read<ExhibitProvider>();
                  exProv.setExhibit(exProv.nextExhibit.neighbors[index]);
                  exProv.setDaScansionare();
                  Navigator.pop(context); // Torno a ExhibitPage
                }

              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: tutorial ? 8.0 : 20, left: 8.0, right: 8.0, bottom: 8.0),
                child: SizedBox(
                  height: 100,
                  child: Card(
                    color: MyColors.otherRowTable,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        MyWidgets.getNotVisitedField(
                            context
                                .watch<ExhibitProvider>()
                                .nextExhibit
                                .neighbors[index]
                                .normalName,
                            false),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  static BottomAppBar myBottomAppBar(BuildContext context){
    return BottomAppBar(
      color: MyColors.backgroundYellow,
      height: MyInt.bottomBarHeight.toDouble(),
      child: MyWidgets.getBattery(
        charge: context.watch<EnergyProvider>().energy,
        batterySize: MyInt.batterySize
      )
    );
  }
}
