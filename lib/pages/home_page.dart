import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_sized_box.dart';
import 'package:flutter/material.dart';

import '../res/my_int.dart';
import '../res/widgets/my_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(
        title: MyText.getPlainText(MyString.appName, true),
        actions: [
          MyButton.creditsButton(context),
        ],
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  MyText.homePageText(MyString.titoloAttivita, MyInt.titleSize.toDouble()),
                  const Text(""),
                  MyText.homePageText(MyString.sottotitoloAttivita, MyInt.subtitleSize.toDouble()),
                ],
              ),
              MyButton.homePageStartingButton(context),
              //MyButton.deleteDataButton()
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: MyColors.bottomAppBarColor,
        height: MyInt.bottomBarHeight.toDouble(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MySizedBox.boxLogo("images/logoDISI.png"),
            MySizedBox.boxLogo("images/logoPOPMAT.jpg"),
            MySizedBox.boxLogo("images/logoMuseAzzurro.jpg"),
          ],
        ),
      ),
    );
  }
}
