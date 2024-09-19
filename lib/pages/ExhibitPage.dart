import 'dart:math';

import 'package:app_rl/models/myList.dart';
import 'package:app_rl/providers/EnergyProvider.dart';
import 'package:app_rl/providers/ExhibitProvider.dart';
import 'package:app_rl/res/myColors.dart';
import 'package:app_rl/res/myInt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExhibitPage extends StatefulWidget {
  const ExhibitPage({super.key});

  @override
  State<ExhibitPage> createState() => _ExhibitPageState();
}

class _ExhibitPageState extends State<ExhibitPage> {
  bool trovato = false;


  late bool endGame, noEnergy, hasWin;

  final random = Random();

  //var n = 0;

  @override
  void initState() {
    super.initState();
    // Generate the random index once when the page is created
    //n = random.nextInt(MyList.nomiAnimali.length);    //utile per testare, normalmente dovrebbe essere l'utente a scegliere il prossimo
  }

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
      backgroundColor: endGame ? hasWin ? Colors.greenAccent : Colors.red : MyColors.backgroundYellow,
      appBar: AppBar(
          automaticallyImplyLeading: !endGame,
          title: const Text("Exhibit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(MyList.nomiAnimali[context.watch<ExhibitProvider>().nextExhibit], style: const TextStyle(fontSize: 30)),
            Image.asset("images/${MyList.pathAnimali[context.watch<ExhibitProvider>().nextExhibit]}", scale: 2),
            trovato
                ? SizedBox(
                  height: 250,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Alimentazione: ${MyList.alimAnimali[context.watch<ExhibitProvider>().nextExhibit]}",
                                style: const TextStyle(fontSize: 25)
                            ),
                            Text("Località geografica: ${MyList.locAnimali[context.watch<ExhibitProvider>().nextExhibit]}",
                                style: const TextStyle(fontSize: 25)
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Hai ancora ${context.watch<EnergyProvider>().energy} punti energia",
                                  style: const TextStyle(fontSize: 25)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/alreadyVisited");
                                      },
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all<Size>(
                                            const Size(200, 10)),
                                      ),
                                      child: const Text(
                                          "Cosa hai già visitato",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )
                                      )
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        //------------------Objective----------------Tutorial------------------Home
                                        if(endGame) { Navigator.pop(context); Navigator.pop(context); Navigator.pop(context); }
                                        else { Navigator.pushNamed(context, "/notVisited"); }
                                      },
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all<Size>(
                                            const Size(200, 10)),
                                      ),
                                      child: Text(
                                          endGame ? "Nuovo tentativo" : "Cosa puoi visitare ora",
                                          style: const TextStyle(
                                            fontSize: 15,
                                          )
                                      )
                                  )
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
                        const Text("Vai al piano {}",
                            style: TextStyle(fontSize: 25)),
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
        onPressed: (){
          setState(() {
            trovato = !trovato;
          });
        },
        child: const Icon(Icons.qr_code_outlined),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MyInt.bottomBarHeight.toDouble(),
        child: Center(
          child: Text(
            "Punti energia: ${context.watch<EnergyProvider>().energy}",
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
