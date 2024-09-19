import 'package:app_rl/models/myList.dart';
import 'package:app_rl/providers/ExhibitProvider.dart';
import 'package:app_rl/res/myColors.dart';
import 'package:app_rl/res/myInt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/EnergyProvider.dart';

class ObjectivePage extends StatelessWidget {
  const ObjectivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(
        title: const Text("Obiettivo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Vai a: ${MyList.nomiAnimali[context.watch<ExhibitProvider>().nextExhibit]}",
              style: const TextStyle(fontSize: 50),
            ),
            ElevatedButton(
                onPressed: (){
                  //Accedo a ExhibitProvider senza "ascoltare i cambiamenti"
                  final exhibitProvider = Provider.of<ExhibitProvider>(context, listen: false);
                  exhibitProvider.visit(exhibitProvider.nextExhibit);
                  exhibitProvider.unlockExhibit();

                  context.read<EnergyProvider>().decreaseEnergy();

                  Navigator.pushNamed(context, "/exhibit");
                },
                child: const Text("Exhibit raggiunto")
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MyInt.bottomBarHeight.toDouble(),
      ),
    );
  }
}
