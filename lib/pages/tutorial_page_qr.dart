import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/widgets/my_row.dart';
import 'package:app_rl/res/widgets/my_text.dart';
import 'package:app_rl/res/widgets/my_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exhibit_list.dart';
import '../providers/game_provider.dart';
import '../res/my_qr.dart';
import '../res/my_string.dart';

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
      context.read<ExhibitProvider>().setProssimoForTutorial(ExhibitList.tutorialExhibit);
    });
  }

  @override
  Widget build(BuildContext context) {
    String tut1 = "Località geografica: Eurasia";
    String tut2 = "Numero dita che appoggia: 4";
    double s = MyInt.tutorialStringSize.toDouble();

    return Padding(
      padding: MyInt.allPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: MyText.getLeftTextWithSize(MyString.cosaPuoiVisitare, s, true)),
          Expanded(flex: 4, child: MyRow.exhibitRow(context)),
          Expanded(
            flex: 5,
            child: context.watch<ExhibitProvider>().scansioneCorrettaTutorial
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyColumn.exhibitInfo(tut1, tut2),
                      Center(child: MyButton.tutorialRetryScanButton(context))
                    ],
                  ) //MyWidgets.findedExhibit(context, endGame)
                : Center(child: MyQr(context: context)),
          ),
        ],
      ),
    );
  }
}
