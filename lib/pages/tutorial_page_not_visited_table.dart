import 'package:app_rl/res/my_int.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exhibit.dart';
import '../providers/exhibit_provider.dart';
import '../res/my_colors.dart';
import '../res/my_widgets.dart';

class TutorialPageNotVisitedTable extends StatefulWidget {
  const TutorialPageNotVisitedTable({super.key});

  @override
  State<TutorialPageNotVisitedTable> createState() =>
      _TutorialPageNotVisitedTableState();
}

class _TutorialPageNotVisitedTableState
    extends State<TutorialPageNotVisitedTable> {
  Exhibit? prossimo;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: prossimo == null
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
                    child: ListView(
                      children: [
                        Card(
                          color: MyColors.firstRowTable,
                          child: MyWidgets.getNotVisitedField("Nome", true),
                        ),
                        ...List.generate(
                            context
                                .watch<ExhibitProvider>()
                                .nextExhibit
                                .neighbors
                                .length,
                            (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      prossimo = context
                                          .read<ExhibitProvider>()
                                          .nextExhibit
                                          .neighbors[index];
                                    });
                                  },
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
                                )),
                      ],
                    ),
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
                      MyWidgets.namesOfExhibits(prossimo!),
                      MyWidgets.imageBox(context, prossimo!),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "Vai al piano ${prossimo!.nPiano}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ]));
  }
}
