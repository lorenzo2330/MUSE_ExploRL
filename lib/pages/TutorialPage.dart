import 'package:app_rl/pages/TutorialPageInfo.dart';
import 'package:app_rl/pages/TutorialPageQR.dart';
import 'package:app_rl/pages/TutorialPageTables.dart';
import 'package:app_rl/res/myColors.dart';
import 'package:app_rl/res/myInt.dart';
import 'package:app_rl/res/myString.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: MyColors.backgroundYellow,
          appBar: AppBar(
            title: const Text(MyString.tutorial),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.info_outline)),
              Tab(icon: Icon(Icons.qr_code_outlined)),
              Tab(icon: Icon(Icons.grid_4x4_outlined)),
            ]),
          ),
          body: const TabBarView(
            children: [
              TutorialPageInfo(),
              TutorialPageQR(),
              TutorialPageTables(),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            height: MyInt.bottomBarHeight.toDouble(),
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/objective");
                  },
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all<Size>(
                        const Size(300, 150)),
                  ),
                  child: const Text(
                      "Inizia",
                      style: TextStyle(
                        fontSize: 30,
                      )
                  )
              )
            ),
          ),
        )
    );
  }
}
