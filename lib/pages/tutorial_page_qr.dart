import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/res/my_button.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exhibit_list.dart';
import '../providers/game_provider.dart';
import '../res/my_qr.dart';
import '../res/my_widgets.dart';

class TutorialPageQR extends StatefulWidget {
  const TutorialPageQR({super.key});

  @override
  State<TutorialPageQR> createState() => _TutorialPageQRState();
}

class _TutorialPageQRState extends State<TutorialPageQR> {
  bool showDetails = false;

  @override
  void initState() {
    super.initState();
    // Funzione chiamata al caricamento iniziale della pagina
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameProvider>().addSezioniVisitate(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyWidgets.namesOfExhibits(ExhibitList.lupoGrigio),
            MyWidgets.imageBox(context, ExhibitList.lupoGrigio),
            context.watch<ExhibitProvider>().scansioneCorrettaTutorial
                ? SizedBox(
                    height: MyInt.qrSize.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyString.getCenterTextWithSize("Exhibit trovato", 20, false),
                        Column(
                          children: [
                            MyString.getCenterTextWithSize("Località geografica: Eurasia", 20, false),
                            MyString.getCenterTextWithSize("Numero di dita appoggiate a terra: 4", 20, false),
                          ],
                        ),
                        MyButton.tutorialRetryScanButton(context)
                      ],
                    )
                  )//MyWidgets.findedExhibit(context, endGame)
                : MyQr(context: context),
          ],
        ),
      ),
    );
  }
}
