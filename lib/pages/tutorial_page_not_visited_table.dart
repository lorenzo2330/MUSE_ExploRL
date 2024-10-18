import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/my_text.dart';
import 'package:app_rl/res/widgets/my_column.dart';
import 'package:app_rl/res/widgets/my_list_view.dart';
import 'package:app_rl/res/widgets/my_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/exhibit_provider.dart';
import '../providers/game_provider.dart';

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
      context.read<ExhibitProvider>().setProssimoForTutorial(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    double s = MyInt.tutorialStringSize.toDouble();
    ExhibitProvider exProvR = context.read<ExhibitProvider>();
    ExhibitProvider exProvW = context.watch<ExhibitProvider>();
    Text cosaVisitare = MyText.getCenterTextWithSize(MyString.cosaPuoiVisitare, s, true);
    ListView listOfExhibits = MyListView.getListOfNotVisitedExhibit(context, true);
    Text sceltaAnimale = MyText.getCenterTextWithSize(MyString.scegliAnimale, 20, false);

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: exProvW.prossimoForTutorial == null
            ? Column(
                children: [
                  Expanded(flex: 2, child: cosaVisitare),
                  Expanded(flex: 8, child: listOfExhibits),
                  Expanded(flex: 6, child: Center(child: sceltaAnimale))
                ],
              )
            : Column(children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      MyColumn.namesOfExhibits(exProvR.prossimoForTutorial!),
                      MySizedBox.imageBox(context, exProvR.prossimoForTutorial!),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                      child: MyText.getCenterTextWithSize(
                          MyString.nPiano(exProvR.prossimoForTutorial!.nPiano), 20, false)),
                ),
              ]));
  }
}
