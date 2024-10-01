import 'package:app_rl/res/my_int.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/exhibit_provider.dart';
import '../providers/game_provider.dart';
import '../res/my_widgets.dart';

class TutorialPageNotVisitedTable extends StatefulWidget {
  const TutorialPageNotVisitedTable({super.key});

  @override
  State<TutorialPageNotVisitedTable> createState() =>
      _TutorialPageNotVisitedTableState();
}

class _TutorialPageNotVisitedTableState
    extends State<TutorialPageNotVisitedTable> {

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
                    child: Text(
                      "Cosa puoi visitare ora",
                      style: TextStyle(
                        fontSize: MyInt.tutorialStringSize.toDouble(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: MyWidgets.getListOfNotVisitedExhibit(context, true),
                  ),
                  const Expanded(
                    flex: 6,
                    child: Center(
                        child: Text("Scegli il prossimo exhibit",
                            style: TextStyle(fontSize: 20))),
                  )
                ],
              )
            : Column(children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      MyWidgets.namesOfExhibits(context.read<ExhibitProvider>().prossimoForTutorial!),
                      MyWidgets.imageBox(context, context.read<ExhibitProvider>().prossimoForTutorial!),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "Vai al piano ${context.read<ExhibitProvider>().prossimoForTutorial!.nPiano}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ]));
  }
}
