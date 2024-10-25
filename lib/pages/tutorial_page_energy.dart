import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/widgets/my_text.dart';
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
      padding: MyInt.allPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: MyText.getLeftTextWithSize(MyString.tutorialEnergia, s, true)),
          Expanded(
            flex: 6,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  enProvR.tutorialEnergy == 0
                      ? MyButton.tutorialRechargeEnergy(context)
                      : MyButton.tutorialDecreaseEnergy(context),
                  MyStack.getBattery(
                      charge: enProvW.tutorialEnergy, batterySize: MyInt.batterySize),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
