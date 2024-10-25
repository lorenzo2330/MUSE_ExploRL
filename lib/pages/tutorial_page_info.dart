import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';

class TutorialPageInfo extends StatefulWidget {
  const TutorialPageInfo({super.key});

  @override
  State<TutorialPageInfo> createState() => _TutorialPageInfoState();
}

class _TutorialPageInfoState extends State<TutorialPageInfo> {
  @override
  void initState() {
    super.initState();
    // Funzione chiamata al caricamento iniziale della pagina
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameProvider>().addSezioniVisitate(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double s = MyInt.tutorialStringSize.toDouble();
    return Padding(
      padding: MyInt.allPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: MyText.getLeftTextWithSize(MyString.tutorialInfo1, s, true),),
          Expanded(flex: 6, child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyText.getLeftTextWithSize(MyString.tutorialInfo2, s, false),
              MyText.getLeftTextWithSize(MyString.tutorialInfo3, s, false),
            ],
          ))

        ],
      ),
    );
  }
}
