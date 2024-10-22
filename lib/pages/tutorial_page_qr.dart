import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/widgets/my_text.dart';
import 'package:app_rl/res/widgets/my_column.dart';
import 'package:app_rl/res/widgets/my_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../res/my_qr.dart';

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
    String tut1 = "Località geografica: Eurasia";
    String tut2 = "Numero di dita appoggiate a terra: 4";
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyColumn.namesOfExhibits(context),
            MySizedBox.imageBox(context),
            context.watch<ExhibitProvider>().scansioneCorrettaTutorial
                ? SizedBox(
                    height: MyInt.qrSize.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyText.getCenterTextWithSize(MyString.animaleTrovato, 20, false),
                        Column(
                          children: [
                            MyText.getCenterTextWithSize(tut1, 20, false),
                            MyText.getCenterTextWithSize(tut2, 20, false),
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
