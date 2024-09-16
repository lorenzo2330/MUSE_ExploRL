import 'package:app_rl/res/myColors.dart';
import 'package:flutter/material.dart';

import '../res/myInt.dart';

class AlreadyVisitedPage extends StatefulWidget {
  const AlreadyVisitedPage({super.key});

  @override
  State<AlreadyVisitedPage> createState() => _AlreadyVisitedPageState();
}

class _AlreadyVisitedPageState extends State<AlreadyVisitedPage> {
  List<String> headers = ["Title1", "Title2", "Title3", "Title4"];

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Tentativo numero: ",
                style: const TextStyle(fontSize: 20),
              ),
            ),

            Container(
              color: MyColors.firstRowTable,
              child: Row(
                children: List.generate(
                  headers.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        headers[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Scroll per il corpo della tabella
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(
                      25,
                      (index) => Row(
                            children: List.generate(
                              headers.length,
                              (index2) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    headers[index2],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
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
                  onPressed: (){},
                  child: const Text("Cosa visitare")
              )
            ],
          ),
        ),
      ),
    );
  }
}
