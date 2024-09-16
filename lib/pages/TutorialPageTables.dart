
import 'package:app_rl/res/myInt.dart';
import 'package:flutter/material.dart';

class TutorialPageTables extends StatelessWidget {
  const TutorialPageTables({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                "Spiegazione Tabelle",
              style: TextStyle(
                fontSize: MyInt.tutorialStringSize.toDouble(),
              ),
            ),
            Text(
              "Esempio tabella \"Cosa hai già visitato\"",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MyInt.tutorialStringSize.toDouble(),
              ),
            ),
            Text(
              "Esempio tabella \"Cosa puoi visitare ora\"",
              textAlign: TextAlign.center,
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
