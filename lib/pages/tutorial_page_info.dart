
import 'package:app_rl/res/my_int.dart';
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
