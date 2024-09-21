import 'package:app_rl/providers/EnergyProvider.dart';
import 'package:app_rl/providers/ExhibitProvider.dart';
import 'package:app_rl/providers/GameProvider.dart';
import 'package:app_rl/res/myColors.dart';
import 'package:app_rl/res/myInt.dart';
import 'package:app_rl/res/myWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExhibitPage extends StatefulWidget {
  const ExhibitPage({super.key});

  @override
  State<ExhibitPage> createState() => _ExhibitPageState();
}

class _ExhibitPageState extends State<ExhibitPage> {

  late bool endGame, noEnergy, hasWin;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /*  Invocato subito dopo initState(), permette l'utilizzo di context
    *   (cosa non possibile in initState) */
    hasWin = context.watch<ExhibitProvider>().nextIsWinnerExhibit();
    noEnergy = context.watch<EnergyProvider>().energy == 0;
    endGame = hasWin || noEnergy;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: endGame
          ? hasWin
              ? Colors.greenAccent
              : Colors.red
          : MyColors.backgroundYellow,
      appBar: AppBar(
        automaticallyImplyLeading: !endGame,
        title: const Text("Exhibit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(context.watch<ExhibitProvider>().nextExhibit.scientificName,
                style: const TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                )),
            Text(context.watch<ExhibitProvider>().nextExhibit.normalName,
                style: const TextStyle(fontSize: 30)),
            Image.asset(
                "images/${context.watch<ExhibitProvider>().nextExhibit.resPhoto}",
                scale: 2),
            context.watch<GameProvider>().trovato
                ? SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            MyWidgets.detailsOfExhibit("Alimentazione: ${context.watch<ExhibitProvider>().nextExhibit.alim}"),
                            MyWidgets.detailsOfExhibit("Località geografica: ${context.watch<ExhibitProvider>().nextExhibit.loc}")
                          ],
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  "Hai ancora ${context.watch<EnergyProvider>().energy} punti energia",
                                  style: const TextStyle(fontSize: 25)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/alreadyVisited");
                                      },
                                      style: ButtonStyle(
                                        fixedSize:
                                            WidgetStateProperty.all<Size>(
                                                const Size(200, 10)),
                                      ),
                                      child: const Text("Cosa hai già visitato",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ))),
                                  ElevatedButton(
                                      onPressed: () {
                                        //--------------------Objective----------------Tutorial------------------Home
                                        if (endGame) {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        } else {
                                          Navigator.pushNamed(
                                              context, "/notVisited");
                                        }
                                      },
                                      style: ButtonStyle(
                                        fixedSize:
                                            WidgetStateProperty.all<Size>(
                                                const Size(200, 10)),
                                      ),
                                      child: Text(
                                          endGame
                                              ? "Nuovo tentativo"
                                              : "Cosa puoi visitare ora",
                                          style: const TextStyle(
                                            fontSize: 15,
                                          )))
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    height: 250,
                    width: 350,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "Vai al piano ${context.watch<ExhibitProvider>().nextExhibit.nPiano}",
                            style: const TextStyle(fontSize: 25)),
                        const Text(
                          "Scansiona il QR code per scoprire le caratteristiche",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Image.asset("images/imgScannerQR.png"),
                      ],
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Segno che ho: scansionato l'exhibit => visto l'exhibit => "consumato" un'energia,
          context.read<GameProvider>().scanned();
          context.read<ExhibitProvider>().visit(context.read<ExhibitProvider>().nextExhibit);
          context.read<EnergyProvider>().decreaseEnergy();
        },
        child: const Icon(Icons.qr_code_outlined),
      ),
      bottomNavigationBar: BottomAppBar(
          height: MyInt.bottomBarHeight.toDouble(),
          child: MyWidgets.getBattery(
              charge: context.watch<EnergyProvider>().energy)),
    );
  }
}

/*
* Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              //size: const Size(300, 75),
              painter: Battery(charge: ),
            ),
            Text(
              "Energia rimanente: ${context.watch<EnergyProvider>().energy}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),*/
