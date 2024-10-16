import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_string.dart';
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyString.getCenterTextWithSize("Questa app ti supporterà nella tua avventura", MyInt.tutorialStringSize.toDouble() - 5, false),
            MyString.getCenterTextWithSize("Prima di partire, in questo tutorial scoprirai le funzionalità che ti aiuteranno nell'esplorazione", MyInt.tutorialStringSize.toDouble() - 7, false),
            MyString.getCenterTextWithSize("Scorri la schermata per iniziare", MyInt.tutorialStringSize.toDouble(), false)
          ],
        ),
      ),
    );
  }
}
