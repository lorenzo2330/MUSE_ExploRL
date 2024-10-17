import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_column.dart';
import 'package:flutter/material.dart';

import '../res/my_int.dart';
import '../res/my_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(
        title: MyText.getPlainText(MyString.appName, true),
        actions: [
          IconButton(
            icon: const Icon(Icons.copyright),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    content: SizedBox(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.getCenterTextWithSize(MyString.creditTitle, 30, true),
                          MyColumn.creditList(),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text(MyString.chiudi),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
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
              /*MyString.getCenterTextWithSize(
                  MyString.nomeAttivita, MyInt.titleSize.toDouble(), true),*/
              Text(
                MyString.nomeAttivita,
                style: TextStyle(
                    fontFamily: MyText.fontMuse,
                    fontWeight: MyText.fontTitle,
                    color: Colors.white,
                    fontSize: MyInt.titleSize.toDouble()),
              ),
              MyButton.homePageStartingButton(context),
              MyButton.deleteDataButton()
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        height: MyInt.bottomBarHeight.toDouble(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Image.asset(
                "images/logoTondo.png",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            ClipRect(
              child: Image.asset(
                "images/logoRettangolare.png",
                width: 100,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            ClipRect(
              child: Image.asset(
                "images/logoMuseAzzurro.jpg",
                width: 150,
                height: 50,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
