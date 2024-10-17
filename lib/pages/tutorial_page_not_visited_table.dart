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
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: context.watch<ExhibitProvider>().prossimoForTutorial == null
            ? Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: MyText.getCenterTextWithSize(MyString.cosaPuoiVisitare, MyInt.tutorialStringSize.toDouble(), true),
                  ),
                  Expanded(
                    flex: 8,
                    child: MyListView.getListOfNotVisitedExhibit(context, true),
                  ),
                  Expanded(
                      flex: 6,
                      child: Center(
                        child: MyText.getCenterTextWithSize(MyString.scegliAnimale, 20, false),
                      ))
                ],
              )
            : Column(children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      MyColumn.namesOfExhibits(
                          context.read<ExhibitProvider>().prossimoForTutorial!),
                      MySizedBox.imageBox(
                          context, context.read<ExhibitProvider>().prossimoForTutorial!),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                      child: MyText.getCenterTextWithSize(
                        MyString.nPiano(context.read<ExhibitProvider>().prossimoForTutorial!.nPiano),
                        20,
                        false
                      )
                  ),
                ),
              ]));
  }
}
