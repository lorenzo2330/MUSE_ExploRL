import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_text.dart';
import 'package:app_rl/res/widgets/my_stack.dart';
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
    double s = MyInt.tutorialStringSize.toDouble();
    EnergyProvider enProvR = context.read<EnergyProvider>();
    EnergyProvider enProvW = context.watch<EnergyProvider>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyText.getCenterTextWithSize(MyString.tutorialEnergia, s, true),
            MyButton.tutorialDecreaseEnergy(context),
            MyStack.getBattery(charge: enProvW.tutorialEnergy, batterySize: MyInt.batterySize),
            MyText.getCenterTextWithSize(MyString.tutEnergyInfo(enProvR.tutorialEnergy), s, false)
          ],
        ),
      ),
    );
  }
}
