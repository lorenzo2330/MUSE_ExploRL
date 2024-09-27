import 'package:app_rl/providers/energy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../res/my_widgets.dart';

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
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Cosa hai già visitato",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: DropdownButton<String>(
                    hint: const Text("Seleziona una partita"),
                    value: selectedMatch,
                    items: List.generate(tutorialList.length + 1, (index) {
                      final gameLabel = index == tutorialList.length
                          ? "Partita attuale"
                          : "Partita ${index + 1}";
                      return DropdownMenuItem<String>(
                        value: index.toString(),
                        child: Text(gameLabel),
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
                  child: MyWidgets.getBattery(
                    charge: EnergyProvider.maxEnergy,
                    batterySize: const Size(100, 45)
                  ),
                )
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            MyWidgets.getAlreadyVisitedField("N°", 0, true),
            MyWidgets.getAlreadyVisitedField("Nome", 1, true),
            MyWidgets.getAlreadyVisitedField("Ambiente", 2, true),
            MyWidgets.getAlreadyVisitedField("Numero dita", 3, true),
          ]),
          Row(
            children: [
              MyWidgets.getAlreadyVisitedField(0.toString(), 0, false),
              MyWidgets.getAlreadyVisitedField("Lupo (Grigio)", 1, false),
              MyWidgets.getAlreadyVisitedField("Eurasia", 2, false),
              MyWidgets.getAlreadyVisitedField("4", 3, false),
            ],
          )
        ],
      ),
    );
  }
}
