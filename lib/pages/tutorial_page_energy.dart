import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_widgets.dart';
import 'package:flutter/material.dart';

class TutorialPageEnergy extends StatefulWidget {
  const TutorialPageEnergy({super.key});

  @override
  State<TutorialPageEnergy> createState() => _TutorialPageEnergyState();
}

class _TutorialPageEnergyState extends State<TutorialPageEnergy> {

  int energy = EnergyProvider.maxEnergy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Tutorial energia",
              style: TextStyle(
                fontSize: MyInt.tutorialStringSize.toDouble(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (energy > 0) energy -= 1;
                  });
                },
                child: const Text("Simula una scansione")
            ),
            MyWidgets.getBattery(charge: energy, batterySize: MyInt.batterySize),
            Text(
                energy > 0 ? "Sei ancora in gioco" : "Hai esaurito l'energia",
                style: TextStyle(
                  fontSize: MyInt.tutorialStringSize.toDouble(),
                )
            )
          ],
        ),
      ),
    );
  }
}
