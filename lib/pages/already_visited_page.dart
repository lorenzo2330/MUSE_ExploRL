import 'package:app_rl/models/exhibit.dart';
import 'package:app_rl/models/exhibit_list.dart';
import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/my_text.dart';
import 'package:app_rl/res/widgets/my_bottom_app_bar.dart';
import 'package:app_rl/res/widgets/my_expanded.dart';
import 'package:app_rl/res/widgets/my_stack.dart';
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
  late int nPartitaAttuale = 0;

  late List<List<String>> listOfMatch = [];
  late List<int> listOfEnergy = [];
  late List<String> match = [];
  String? selectedMatch; // Variabile per tenere traccia dell'elemento selezionato

  late List<Exhibit> l = [];
  late List<Exhibit> actualList = [];
  late int energyToDisplay = EnergyProvider.maxEnergy;

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      late int nPartite = prefs.getInt(MyString.nMatch) ?? 0;  //Recupero il numero di partite
      for(int i = 1; i <= nPartite; i++){ //La prima partita viene salvata come Game-1
        match = prefs.getStringList(MyString.gameMatch(i)) ?? []; //se è null non prendo niente
        listOfEnergy.add(prefs.getInt(MyString.gameEnergy(i)) ?? EnergyProvider.maxEnergy - match.length);
        listOfMatch.add(match);
      }
      nPartitaAttuale = listOfMatch.length ;
      selectedMatch = nPartitaAttuale.toString();
      actualList = context.read<ExhibitProvider>().visited;
      l = actualList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  List<Exhibit> getRelativeListOfExhibit(List<String> l){
    List<Exhibit> retList = [];
    for(String exName in l){ retList.add(ExhibitList.getExhibitByName(exName)); }
    return retList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(title: const Text(MyString.cosaHaiVisitato)),
      body: Padding(
        //padding: const EdgeInsets.all(2.0),
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
                            Expanded(
                              flex: 5,
                              child: DropdownButton<String>(
                                hint: MyText.getPlainText(MyString.selezionaPartita, false),
                                value: selectedMatch,
                                items: List.generate(
                                    listOfMatch.length + 1,
                                        (index)
                                    {
                                      final gameLabel = MyString.gameLabel(index, listOfMatch.length);
                                      return DropdownMenuItem<String>(
                                        value: index.toString(),
                                        child: MyText.getPlainText(gameLabel, false),
                                      );
                                    }),
                                onChanged: (String? newValue){
                                  setState(() {
                                    selectedMatch = newValue;
                                    if(newValue == null || int.parse(newValue) == listOfMatch.length){
                                      l = actualList;
                                      energyToDisplay = context.read<EnergyProvider>().energy;
                                    }
                                    else{
                                      l = getRelativeListOfExhibit(listOfMatch[int.parse(newValue)]);
                                      energyToDisplay = listOfEnergy[int.parse(newValue)];
                                    }
                                  });

                                },
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: MyStack.getBattery(
                                  charge: energyToDisplay,
                                  batterySize: const Size(100, 45)
                              ),
                            )
                          ],
                        )
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyExpanded.getAlreadyVisitedField(MyString.N, 0, true),
                          MyExpanded.getAlreadyVisitedField(MyString.nome, 1, true),
                          MyExpanded.getAlreadyVisitedField(MyString.ambiente, 2, true),
                          MyExpanded.getAlreadyVisitedField(MyString.alimentazione, 3, true),
                        ]),

                    //Animali visti
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                              l.length,
                                  (index) => Row(
                                children: [
                                  MyExpanded.getAlreadyVisitedField(index.toString(), 0, false),
                                  MyExpanded.getAlreadyVisitedField(l[index].normalName, 1, false),
                                  MyExpanded.getAlreadyVisitedField(l[index].loc, 2, false),
                                  MyExpanded.getAlreadyVisitedField(l[index].alim, 3, false),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            context.watch<ExhibitProvider>().nextIsWinnerExhibit() || context.watch<EnergyProvider>().energy == 0
                ? MyButton.restartButton(context, true)
                : MyButton.notVisitedButton(context, true),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomAppBar.myBottomAppBar(context),
    );
  }
}