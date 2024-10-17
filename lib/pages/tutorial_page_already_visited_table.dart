import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/my_text.dart';
import 'package:app_rl/res/widgets/my_expanded.dart';
import 'package:app_rl/res/widgets/my_stack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  String? selectedMatch;

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
                Expanded(
                  flex: 5,
                  child: DropdownButton<String>(
                    hint: MyText.getPlainText(MyString.selezionaPartita, false),
                    value: selectedMatch,
                    items: List.generate(tutorialList.length + 1, (index) {
                      final gameLabel = MyString.gameLabel(index, tutorialList.length);
                      return DropdownMenuItem<String>(
                        value: index.toString(),
                        child: MyText.getPlainText(gameLabel, false),
                      );
                    }),
                    onChanged: (String? value) {
                      setState(() {
                        selectedMatch = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: MyStack.getBattery(
                    charge: EnergyProvider.maxEnergy,
                    batterySize: const Size(100, 45)
                  ),
                )
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
