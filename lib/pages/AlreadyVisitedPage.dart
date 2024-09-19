import 'package:app_rl/models/myList.dart';
import 'package:app_rl/providers/ExhibitProvider.dart';
import 'package:app_rl/res/myColors.dart';
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
  List<String> headers = ["Nome", "Amb.", "Alim."];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(
        title: const Text("Cosa hai già visitato"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Tentativo numero: ",
                style: TextStyle(fontSize: 20),
              ),
            ),

            Container(
              color: MyColors.firstRowTable,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  headers.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        headers[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //Animali visti
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(
                      context.watch<ExhibitProvider>().visited.length,
                      (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                // *** NOME ANIMALE ***
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  MyList.nomiAnimali[context
                                      .watch<ExhibitProvider>()
                                      .visited[index]],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                // *** LOCATION ANIMALE ***
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  MyList.locAnimali[context
                                      .watch<ExhibitProvider>()
                                      .visited[index]],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                // *** ALIMENTAZIONE ANIMALE ***
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  MyList.alimAnimali[context
                                      .watch<ExhibitProvider>()
                                      .visited[index]],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MyInt.bottomBarHeight.toDouble(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Punti energia rimanenti",
                style: TextStyle(fontSize: 17),
              ),
              ElevatedButton(
                  onPressed: () {
                    final exhibitProvider = Provider.of<ExhibitProvider>(context, listen: false);
                    final energyProvider = Provider.of<EnergyProvider>(context, listen: false);
                    bool endGame = exhibitProvider.nextIsWinnerExhibit() || energyProvider.energy == 0;
                    //--------------------Exhibit--------------Objective----------------Tutorial------------------Home--------------
                    if(endGame){ Navigator.pop(context); Navigator.pop(context); Navigator.pop(context); Navigator.pop(context); }
                    else { Navigator.pop(context); Navigator.pushNamed(context, "/notVisited"); }
                    //--------------Exhibit---------------------NotVisited----------------------------------------------------------
                  },
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all<Size>(
                        const Size(200, 10)),
                  ),
                  child: Text(
                      context.watch<ExhibitProvider>().nextIsWinnerExhibit() || context.watch<EnergyProvider>().energy == 0 ? "Nuovo tentativo" : "Cosa puoi visitare ora",
                      style: const TextStyle(
                        fontSize: 15,
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
