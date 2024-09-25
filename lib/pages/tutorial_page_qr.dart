import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/my_qr.dart';
import '../res/my_widgets.dart';

class TutorialPageQR extends StatefulWidget {
  const TutorialPageQR({super.key});

  @override
  State<TutorialPageQR> createState() => _TutorialPageQRState();
}

class _TutorialPageQRState extends State<TutorialPageQR> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyWidgets.namesOfExhibits(context),
            MyWidgets.imageBox(context),
            context.read<ExhibitProvider>().scansioneCorrettaTutorial
                ? SizedBox(
                    height: MyInt.qrSize.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Exhibit trovato",
                          style: TextStyle(
                            fontSize: 20
                          )
                        ),
                        const Text(
                          "Località geografica: Eurasia",
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        const Text(
                          "Numero di dita appoggiate a terra: 4",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        ElevatedButton(
                            onPressed: (){ context.read<ExhibitProvider>().setDaScansionare(); },
                            child: const Text("Riprova scansione")
                        )
                      ],
                    )
                  )//MyWidgets.findedExhibit(context, endGame)
                : MyQr(context: context),
          ],
        ),
      ),
    );
  }
}
