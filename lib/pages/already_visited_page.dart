import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/providers/game_provider.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_bottom_app_bar.dart';
import 'package:app_rl/res/widgets/my_expanded.dart';
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
        int remainingEnergy = EnergyProvider.maxEnergy - match.length;  //enMax - 1 * nExhVisitati
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
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(title: const Text(MyString.cosaHaiVisitato)),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 18.0, left: 8.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            MyExpanded.sceltaPartita(context, gProvR.listOfMatch.length, false),
                            MyExpanded.miniBattery(gProvR.energyToDisplay)
                          ],
                        )),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      MyExpanded.getAlreadyVisitedField(MyString.N, 0, true),
                      MyExpanded.getAlreadyVisitedField(MyString.nome, 1, true),
                      MyExpanded.getAlreadyVisitedField(MyString.ambiente, 2, true),
                      MyExpanded.getAlreadyVisitedField(MyString.alimentazione, 3, true),
                    ]),
                    MyExpanded.alreadyVisitedList(gProvR.listToDisplay), //Animali visti
                  ],
                ),
              ),
            ),
            exProvW.nextIsWinnerExhibit() || enProvW.energy == 0
                ? MyButton.restartButton(context, true)
                : MyButton.notVisitedButton(context, true),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomAppBar.myBottomAppBar(context),
    );
  }
}
