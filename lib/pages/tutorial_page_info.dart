
import 'package:app_rl/res/my_int.dart';
import 'package:flutter/material.dart';

class TutorialPageInfo extends StatelessWidget {
  const TutorialPageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
            "Spiegazione app",
          style: TextStyle(
            fontSize: MyInt.tutorialStringSize.toDouble(),
          ),
        ),
      ),
    );
  }
}
