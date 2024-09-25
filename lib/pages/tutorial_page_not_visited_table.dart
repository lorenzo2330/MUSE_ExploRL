
import 'package:app_rl/res/my_int.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/exhibit_provider.dart';
import '../res/my_colors.dart';
import '../res/my_widgets.dart';

class TutorialPageNotVisitedTable extends StatefulWidget {
  const TutorialPageNotVisitedTable({super.key});

  @override
  State<TutorialPageNotVisitedTable> createState() => _TutorialPageNotVisitedTableState();
}

class _TutorialPageNotVisitedTableState extends State<TutorialPageNotVisitedTable> {

  String prossimo = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Text(
                "Tabella \"Cosa visitare\"",
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
                          prossimo = context.read<ExhibitProvider>().nextExhibit.neighbors[index].normalName;
                        });
                      },
                      child: Card(
                        color: Colors.deepOrange[100]!,
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
          Expanded(
            flex: 6,
            child: Center(
                child: Text("Prossimo exhibit: $prossimo", style: const TextStyle(fontSize: 20))
            ),
          )
        ],
      ),
    );
  }
}
