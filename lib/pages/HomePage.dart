import 'package:app_rl/res/myColors.dart';
import 'package:flutter/material.dart';

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
              onPressed: () {},
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
