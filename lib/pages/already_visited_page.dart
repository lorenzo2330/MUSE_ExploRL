import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/providers/game_provider.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_app_bar.dart';
import 'package:app_rl/res/widgets/my_expanded.dart';
import 'package:app_rl/res/widgets/my_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/energy_provider.dart';
import '../res/widgets/my_button.dart';

class AlreadyVisitedPage extends StatefulWidget {
  const AlreadyVisitedPage({super.key});

  @override
  State<AlreadyVisitedPage> createState() => _AlreadyVisitedPageState();
}

class _AlreadyVisitedPageState extends State<AlreadyVisitedPage> {
  List<String> headers = [MyString.N, MyString.nome, MyString.ambiente, MyString.alimentazione];

  void loadData(GameProvider gProvR, EnergyProvider enProvR, ExhibitProvider exProvR) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    gProvR.initListOfMatch();
    gProvR.initListOfEnergy();
    gProvR.setEnergyToDisplay(enProvR.energy);

    late List<String> match = [];

    setState(() {
      late int nPartite = prefs.getInt(MyString.nMatch) ?? 0; //Recupero il numero di partite
      for (int i = 1; i <= nPartite; i++) {
        //La prima partita viene salvata come Game-1
        match = prefs.getStringList(MyString.gameMatch(i)) ?? []; //se è null non prendo niente
        int remainingEnergy = EnergyProvider.maxEnergy - match.length; //enMax - 1 * nExhVisitati
        gProvR.addToListOfMatch(match);
        gProvR.addToListOfEnergy(prefs.getInt(MyString.gameEnergy(i)) ?? remainingEnergy);
      }
      gProvR.setSelectedMatch(gProvR.listOfMatch.length.toString());
      gProvR.setListOfThisRound(context.read<ExhibitProvider>().visited);
      gProvR.setListToDisplay(gProvR.listOfThisRound);
    });
  }

  @override
  void initState() {
    super.initState();
    var gProvR = context.read<GameProvider>();
    var enProvR = context.read<EnergyProvider>();
    var exProvR = context.read<ExhibitProvider>();
    loadData(gProvR, enProvR, exProvR);
  }

  @override
  Widget build(BuildContext context) {
    var gProvR = context.read<GameProvider>();
    var enProvW = context.watch<EnergyProvider>();
    var exProvW = context.watch<ExhibitProvider>();

    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: MyAppBar.myAppBar(MyString.esplorazione, [MyPadding.timerScreen(context)], null, true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyPadding.alreadyVisitedTitle(),
          MyPadding.alreadyVisitedCombo(context, gProvR.listOfMatch.length, gProvR.energyToDisplay),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    MyExpanded.getAlreadyVisitedField(MyString.N, 0, true),
                    MyExpanded.getAlreadyVisitedField(MyString.nome, 1, true),
                    MyExpanded.getAlreadyVisitedField(MyString.ambiente, 2, true),
                    MyExpanded.getAlreadyVisitedField(MyString.alimentazione, 3, true),
                  ]),
                  MyExpanded.alreadyVisitedList(gProvR.listToDisplay),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Center(child: exProvW.nextIsWinnerExhibit() || enProvW.energy == 0
                ? MyButton.restartButton(context, true)
                : MyButton.notVisitedButton(context, true),),
          )

        ],
      ),
      bottomNavigationBar: MyAppBar.myBottomAppBar(context),
    );
  }
}

/*
* body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MyInt.allPadding,
            child: MyText.getLeftTextWithSize(MyString.cosaHaiVisitato, s, true),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        MyExpanded.sceltaPartita(context, gProvR.listOfMatch.length, false),
                        MyExpanded.miniBattery(gProvR.energyToDisplay)
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        MyExpanded.getAlreadyVisitedField(MyString.N, 0, true),
                        MyExpanded.getAlreadyVisitedField(MyString.nome, 1, true),
                        MyExpanded.getAlreadyVisitedField(MyString.ambiente, 2, true),
                        MyExpanded.getAlreadyVisitedField(MyString.alimentazione, 3, true),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MyExpanded.alreadyVisitedList(gProvR.listToDisplay),
                ), //Animali visti
              ],
            ),
          ),
          exProvW.nextIsWinnerExhibit() || enProvW.energy == 0
              ? MyButton.restartButton(context, true)
              : MyButton.notVisitedButton(context, true),
        ],
      ),
* */
