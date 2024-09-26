import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/battery.dart';
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
        Text(
          batterySize.width == MyInt.batterySize.width ? "Energia rimanente: $charge" : "$charge",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
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

  static SizedBox findedExhibit(BuildContext context, bool endGame) {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton.alreadyVisitedButton(context),
              endGame
                ? MyButton.restartButton(context, false)
                : MyButton.notVisitedButton(context),
            ],
          )
        ],
      ),
    );
  }

  static Text detailsOfExhibit(String text) {
    return Text(text, style: const TextStyle(fontSize: 25));
  }

  static Column namesOfExhibits(BuildContext context) {
    var exProv = context.watch<ExhibitProvider>();
    return Column(
      children: [
        Text(exProv.nextExhibit.scientificName,
            style: const TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
            )),
        Text(exProv.nextExhibit.normalName,
            style: const TextStyle(fontSize: 22)),
      ],
    );
  }

  static SizedBox imageBox(BuildContext context) {
    var exProv = context.watch<ExhibitProvider>();
    var imgPath = "images/${exProv.nextExhibit.resPhoto}";
    return SizedBox(
      height: 150,
      width: 150,
      child: GestureDetector(
        onTap: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return Dialog(
                  backgroundColor: Colors.white,
                  child: SizedBox(
                    height: 400,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [       //Immagine più grande
                        MyWidgets.namesOfExhibits(context),
                        Image.asset(imgPath),
                        TextButton(
                            onPressed: () { Navigator.of(context).pop(); }, //Chiude il popup
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
}
