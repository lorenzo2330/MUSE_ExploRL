import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_qr.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_text.dart';
import 'package:app_rl/res/widgets/my_column.dart';
import 'package:app_rl/res/widgets/my_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exhibit_list.dart';
import '../providers/exhibit_provider.dart';
import '../providers/game_provider.dart';
import '../res/widgets/my_gesture_detector.dart';

class TutorialPageNotVisitedTable extends StatefulWidget {
  const TutorialPageNotVisitedTable({super.key});

  @override
  State<TutorialPageNotVisitedTable> createState() => _TutorialPageNotVisitedTableState();
}

class _TutorialPageNotVisitedTableState extends State<TutorialPageNotVisitedTable> {
  @override
  void initState() {
    super.initState();
    // Funzione chiamata al caricamento iniziale della pagina
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameProvider>().addSezioniVisitate(4);
      context.read<ExhibitProvider>().setProssimoForTutorial(ExhibitList.tutorialExhibit);
    });
  }

  @override
  Widget build(BuildContext context) {
    double s = MyInt.tutorialStringSize.toDouble();
    ExhibitProvider exProvW = context.watch<ExhibitProvider>();
    Text cosaVisitare = MyText.getLeftTextWithSize(MyString.cosaPuoiVisitare, s, true);
    ListView listOfExhibits = MyListView.getListOfNotVisitedExhibit(context, true);
    Text sceltaAnimale = MyText.getLeftTextWithSize(MyString.scegliAnimale, 20, false);

    return Padding(
        padding: MyInt.allPadding,
        child: exProvW.prossimoForTutorial == ExhibitList.tutorialExhibit
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: cosaVisitare),
                  Expanded(flex: 8, child: listOfExhibits),
                  Expanded(flex: 3, child: Center(child: sceltaAnimale))
                ],
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(flex: 1, child: cosaVisitare),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(flex: 4, child: MyColumn.namesOfExhibits(context)),
                      Expanded(flex: 2, child: MyGestureDetector.imageBox(context)),
                    ],
                  ),
                ),
                Expanded(flex: 5, child: Center(child: MyQr(context: context))),
              ]));
  }
}
