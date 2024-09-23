import 'package:app_rl/res/myInt.dart';
import 'package:flutter/material.dart';

class TutorialPageQR extends StatefulWidget {
  const TutorialPageQR({super.key});

  @override
  State<TutorialPageQR> createState() => _TutorialPageQRState();
}

class _TutorialPageQRState extends State<TutorialPageQR> {
  bool scansione = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Test QR",
              style: TextStyle(
                fontSize: MyInt.tutorialStringSize.toDouble(),
              ),
            ),
            scansione
                ? Text("QR")//MyQr(context: context)
                : SizedBox(
                    height: 275,
                    width: 275,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text("Informazione 1"),
                        const Text("Informazione 2"),
                        ElevatedButton(
                            onPressed: () { setState(() { scansione = !scansione; }); },
                            child: const Text("Riprova a scansionare")
                        )
                      ],
                    ),
                  ),
            const Text("Testo di spiegazione"),
            ElevatedButton(
              onPressed: () { setState(() { scansione = !scansione; }); },
              child: const Icon(Icons.qr_code_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
