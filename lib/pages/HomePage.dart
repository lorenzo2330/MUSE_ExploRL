import 'package:app_rl/providers/EnergyProvider.dart';
import 'package:app_rl/providers/ExhibitProvider.dart';
import 'package:app_rl/res/myColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/myButton.dart';
import '../res/myInt.dart';
import '../res/myString.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(
        title: const Text(MyString.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              MyString.nomeAttivita,
              style: TextStyle(
                fontSize: MyInt.titleSize.toDouble(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                /*
                //Accedo a ExhibitProvider senza "ascoltare i cambiamenti"
                final exhibitProvider = Provider.of<ExhibitProvider>(context, listen: false);
                exhibitProvider.visit(exhibitProvider.nextExhibit);
                exhibitProvider.unlockExhibit();

                 */

                context.read<ExhibitProvider>().prepareToStart();
                context.read<EnergyProvider>().prepareToStart();

                Navigator.pushNamed(context, "/tutorial");
              },
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all<Size>(
                    const Size(250, 75)), // Larghezza: 150, Altezza: 50
              ),
              child: const Text(
                "Iniziamo",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MyInt.bottomBarHeight.toDouble(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyButton.homePageBottomButton,
            MyButton.homePageBottomButton,
            MyButton.homePageBottomButton,
          ],
        ),
      ),
    );
  }
}
