
import 'package:app_rl/res/myInt.dart';
import 'package:flutter/material.dart';

class TutorialPageEnergy extends StatelessWidget {
  const TutorialPageEnergy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                "Energia",
              style: TextStyle(
                fontSize: MyInt.tutorialStringSize.toDouble(),
              ),
            ),
            Text(
              "Ua",
              style: TextStyle(
                fontSize: MyInt.tutorialStringSize.toDouble(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
