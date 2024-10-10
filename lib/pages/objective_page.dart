import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/my_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/my_widgets.dart';

class ObjectivePage extends StatefulWidget {
  const ObjectivePage({super.key});

  @override
  State<ObjectivePage> createState() => _ObjectivePageState();
}

class _ObjectivePageState extends State<ObjectivePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      /*  PopScope permette di monitorare il "tornare indietro", in questo
      *   caso, tornando indietro si ritorna nella sezione tutorial, quindi
      *   sarà necessario settare nuovamente inTutorial = true  */
      onPopInvokedWithResult: (bool x, dynamic result) {
        context.read<ExhibitProvider>().setInTutorial(true);
        return;
      },
      child: Scaffold(
        backgroundColor: MyColors.backgroundYellow,
        appBar: AppBar(
          title: const Text("Obiettivo"),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Trova un animale specifico raccogliendo indizi dalle caratteristiche degli altri animali.\n"
                  "Ogni scelta ti consuma risorse, quindi pianifica con attenzione per conservare energia.\n"
                  "Raggiungi il tuo obiettivo con il minor numero di mosse possibile!\n\n"
                  "Buona fortuna, esploratore!",
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/exhibit");
                    },
                    style: MyStyle.buttonStyleBig,
                    child: MyString.getBigButtonText("Avvio"),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyWidgets.myBottomAppBar(context),
      ),
    );
  }
}
