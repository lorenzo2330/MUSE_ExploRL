import 'package:app_rl/pages/tutorial_page_energy.dart';
import 'package:app_rl/pages/tutorial_page_info.dart';
import 'package:app_rl/pages/tutorial_page_qr.dart';
import 'package:app_rl/pages/tutorial_page_not_visited_table.dart';
import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/providers/game_provider.dart';
import 'package:app_rl/res/widgets/my_app_bar.dart';
import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tutorial_page_already_visited_table.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final int nTab = 5;

  @override
  void initState() {
    super.initState();
    // Funzione chiamata al caricamento iniziale della pagina
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnimalProvider>().setInTutorial(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget>? actions = [
      //Mostra il pulsante di avvio solo una volta viste tutte le tab
      if (context
          .watch<GameProvider>()
          .sezioniVisitate
          .length == nTab)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyButton.tutorialStartingButton(context),
        )
    ];

    TabBar bottom = TabBar(
      indicatorColor: MyColors.textOfButtonColor,
      tabs: [
        Tab(icon: Icon(Icons.info_outline, color: MyColors.textOfButtonColor)),
        Tab(icon: Icon(Icons.battery_5_bar_outlined, color: MyColors.textOfButtonColor)),
        Tab(icon: Icon(Icons.qr_code_outlined, color: MyColors.textOfButtonColor)),
        Tab(icon: Icon(Icons.playlist_add_check, color: MyColors.textOfButtonColor)),
        Tab(icon: Icon(Icons.playlist_add, color: MyColors.textOfButtonColor)),
      ],
      onTap: (index) {},
    );

    return DefaultTabController(
        length: nTab,
        child: Scaffold(
          backgroundColor: MyColors.bgColor,
          appBar: MyAppBar.myAppBar(MyString.tutorial, actions, bottom, true),
          body: const TabBarView(
            children: [
              TutorialPageInfo(),
              TutorialPageEnergy(),
              TutorialPageQR(),
              TutorialPageAlreadyVisitedTable(),
              TutorialPageNotVisitedTable(),
            ],
          ),
        ));
  }
}
