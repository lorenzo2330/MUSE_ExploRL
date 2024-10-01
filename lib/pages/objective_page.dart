import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/res/my_colors.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "**Descrizione obiettivo attività**",
                style: TextStyle(fontSize: 50),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/exhibit");
                  },
                  child: const Text("Avvio")),
            ],
          ),
        ),
        bottomNavigationBar: MyWidgets.myBottomAppBar(context),
      ),
    );
  }
}
