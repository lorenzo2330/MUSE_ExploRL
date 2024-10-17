import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/my_text.dart';
import 'package:app_rl/res/widgets/my_expanded.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/energy_provider.dart';
import '../providers/game_provider.dart';

class TutorialPageAlreadyVisitedTable extends StatefulWidget {
  const TutorialPageAlreadyVisitedTable({super.key});

  @override
  State<TutorialPageAlreadyVisitedTable> createState() =>
      _TutorialPageAlreadyVisitedTableState();
}

class _TutorialPageAlreadyVisitedTableState
    extends State<TutorialPageAlreadyVisitedTable> {
  List<String> tutorialList = ["1", "2", "3"];

  @override
  void initState() {
    super.initState();
    // Funzione chiamata al caricamento iniziale della pagina
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameProvider>().addSezioniVisitate(3);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 18.0, left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyText.getCenterTextWithSize(MyString.cosaHaiVisitato, 30, true)
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                MyExpanded.sceltaPartita(context, tutorialList.length),
                MyExpanded.miniBattery(EnergyProvider.maxEnergy)
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            MyExpanded.getAlreadyVisitedField(MyString.N, 0, true),
            MyExpanded.getAlreadyVisitedField(MyString.nome, 1, true),
            MyExpanded.getAlreadyVisitedField(MyString.ambiente, 2, true),
            MyExpanded.getAlreadyVisitedField(MyString.nDita, 3, true),
          ]),
          Row(
            children: [
              MyExpanded.getAlreadyVisitedField(0.toString(), 0, false),
              MyExpanded.getAlreadyVisitedField("Lupo (Grigio)", 1, false),
              MyExpanded.getAlreadyVisitedField("Eurasia", 2, false),
              MyExpanded.getAlreadyVisitedField("4", 3, false),
            ],
          )
        ],
      ),
    );
  }
}
