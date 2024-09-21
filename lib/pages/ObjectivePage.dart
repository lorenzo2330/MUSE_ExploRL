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
            const Text(
              "**Descrizione obiettivo attività**",
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
                onPressed: (){


                  Navigator.pushNamed(context, "/exhibit");
                },
                child: const Text("Avvio")
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
