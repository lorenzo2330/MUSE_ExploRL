import 'package:app_rl/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/my_button.dart';
import '../res/my_int.dart';
import '../res/my_string.dart';

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
            ElevatedButton(onPressed: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();  // Questo cancellerà tutti i dati salvati nello SharedPreferences
            }, child: const Text("Cancella dati"))
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
