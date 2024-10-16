import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/res/my_button.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';

class TutorialPageEnergy extends StatefulWidget {
  const TutorialPageEnergy({super.key});

  @override
  State<TutorialPageEnergy> createState() => _TutorialPageEnergyState();
}

class _TutorialPageEnergyState extends State<TutorialPageEnergy> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameProvider>().addSezioniVisitate(1);
      context.read<EnergyProvider>().rechargeTutorialEnergy();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyString.getCenterTextWithSize("Tutorial energia", MyInt.tutorialStringSize.toDouble(), true),
            MyButton.tutorialDecreaseEnergy(context),
            MyWidgets.getBattery(charge: context.watch<EnergyProvider>().tutorialEnergy, batterySize: MyInt.batterySize),
            MyString.getCenterTextWithSize(context.read<EnergyProvider>().tutorialEnergy > 0 ? "Sei ancora in gioco" : "Hai esaurito l'energia", MyInt.tutorialStringSize.toDouble(), false)
          ],
        ),
      ),
    );
  }
}
