import 'package:app_rl/providers/ExhibitProvider.dart';
import 'package:app_rl/res/myColors.dart';
import 'package:app_rl/res/myWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/EnergyProvider.dart';
import '../res/myInt.dart';

class AlreadyVisitedPage extends StatefulWidget {
  const AlreadyVisitedPage({super.key});

  @override
  State<AlreadyVisitedPage> createState() => _AlreadyVisitedPageState();
}

class _AlreadyVisitedPageState extends State<AlreadyVisitedPage> {
  List<String> headers = ["N°", "Nome", "Ambiente", "Alimentazione"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(title: const Text("Cosa hai già visitato")),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 18.0, left: 8.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Tentativo numero: ",
                            style: TextStyle(fontSize: 30))),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyWidgets.getAlreadyVisitedField("N°", 0, true),
                          MyWidgets.getAlreadyVisitedField("Nome", 1, true),
                          MyWidgets.getAlreadyVisitedField("Ambiente", 2, true),
                          MyWidgets.getAlreadyVisitedField("Alimentazione", 3, true),
                        ]),

                    //Animali visti
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                              context.watch<ExhibitProvider>().visited.length,
                              (index) => Row(
                                    children: [
                                      MyWidgets.getAlreadyVisitedField(index.toString(), 0, false),
                                      MyWidgets.getAlreadyVisitedField(context.watch<ExhibitProvider>().visited[index].normalName, 1, false),
                                      MyWidgets.getAlreadyVisitedField(
                                          context
                                              .watch<ExhibitProvider>()
                                              .visited[index]
                                              .loc,
                                          2,
                                          false),
                                      MyWidgets.getAlreadyVisitedField(
                                          context
                                              .watch<ExhibitProvider>()
                                              .visited[index]
                                              .alim,
                                          3,
                                          false),
                                    ],
                                  )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final exhibitProvider =
                      Provider.of<ExhibitProvider>(context, listen: false);
                  final energyProvider =
                      Provider.of<EnergyProvider>(context, listen: false);
                  bool endGame = exhibitProvider.nextIsWinnerExhibit() ||
                      energyProvider.energy == 0;
                  //--------------------Exhibit--------------Objective----------------Tutorial------------------Home--------------
                  if (endGame) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/notVisited");
                  }
                  //--------------Exhibit---------------------NotVisited----------------------------------------------------------
                },
                /*
                    * style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all<Size>(
                          const Size(200, 10)),
                    ),*/
                child: Text(
                    context.watch<ExhibitProvider>().nextIsWinnerExhibit() ||
                            context.watch<EnergyProvider>().energy == 0
                        ? "Nuovo tentativo"
                        : "Cosa puoi visitare ora",
                    style: const TextStyle(
                      fontSize: 15,
                    )))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: MyColors.backgroundYellow,
          height: MyInt.bottomBarHeight.toDouble(),
          child: MyWidgets.getBattery(
              charge: context.watch<EnergyProvider>().energy)),
    );
  }
}
