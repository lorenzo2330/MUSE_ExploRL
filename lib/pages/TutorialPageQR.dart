
import 'package:app_rl/res/myInt.dart';
import 'package:flutter/material.dart';

class TutorialPageQR extends StatelessWidget {
  const TutorialPageQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                "Spiegazione QR",
              style: TextStyle(
                fontSize: MyInt.tutorialStringSize.toDouble(),
              ),
            ),
            Text(
              "Test QR",
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
