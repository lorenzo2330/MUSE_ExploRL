import 'package:app_rl/res/widgets/my_app_bar.dart';
import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_expanded.dart';
import 'package:flutter/material.dart';

import '../res/my_int.dart';
import '../res/widgets/my_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: MyAppBar.myAppBar(MyString.appName, [MyButton.creditsButton(context)], null, true),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 3,
                child: Padding(
                  padding: MyInt.allPadding,
                  child: MyText.homePageText(MyString.titoloAttivita, MyInt.titleSize.toDouble()),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: MyInt.leftPadding,
                  child: MyText.homePageText(
                      MyString.sottotitoloAttivita, MyInt.subtitleSize.toDouble()),
                )),
            Expanded(flex: 2, child: Center(child: MyButton.homePageStartingButton(context))),
            //MyButton.deleteDataButton()
          ],
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: MyColors.logoAppBar,
        height: MyInt.bottomBarHeight.toDouble(),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyExpanded.boxLogo("images/logoDISI.png", 3),
            MyExpanded.boxLogo("images/logoPOPMAT.jpg", 4),
            MyExpanded.boxLogo("images/logoMuseAzzurro.jpg", 2),
          ],
        ),
      ),
    );
  }
}
