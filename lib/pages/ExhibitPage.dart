import 'package:app_rl/res/myButton.dart';
import 'package:app_rl/res/myColors.dart';
import 'package:app_rl/res/myInt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExhibitPage extends StatefulWidget {
  const ExhibitPage({super.key});

  @override
  State<ExhibitPage> createState() => _ExhibitPageState();
}

class _ExhibitPageState extends State<ExhibitPage> {
  bool trovato = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(
        title: const Text("Exhibit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Titolo Exhibit", style: TextStyle(fontSize: 30)),
            Image.asset("images/imgSpringbok.png", scale: 2),
            trovato
                ? SizedBox(
                  height: 250,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Column(
                          children: [
                            Text("Alimentazione: ...",
                                style: TextStyle(fontSize: 25)),
                            Text("Località geografica: ...",
                                style: TextStyle(fontSize: 25))
                          ],
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("Hai ancora ... punti energia",
                                  style: TextStyle(fontSize: 25)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
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
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all<Size>(
                                            const Size(200, 10)),
                                      ),
                                      child: const Text(
                                          "Cosa puoi visitare ora",
                                          style: TextStyle(
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
      ),
      bottomNavigationBar: BottomAppBar(
        height: MyInt.bottomBarHeight.toDouble(),
        child: const Center(
          child: Text(
            "Punti energia",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
