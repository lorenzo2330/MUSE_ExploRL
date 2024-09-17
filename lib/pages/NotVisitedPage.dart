import 'package:app_rl/res/myColors.dart';
import 'package:flutter/material.dart';

import '../res/myInt.dart';

class NotVisitedPage extends StatefulWidget {
  const NotVisitedPage({super.key});

  @override
  State<NotVisitedPage> createState() => _NotVisitedPageState();
}

class _NotVisitedPageState extends State<NotVisitedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(
        title: const Text("Cosa puoi visitare"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Card(
              color: MyColors.firstRowTable,
              child: const SizedBox(
                  height: 100,
                  child: Center(
                    child: Text("Nome", style: TextStyle(fontSize: 35)),
                  )),
            ),
            ...List.generate(
                8,
                (index) => Card(
                      child: SizedBox(
                          height: 100,
                          child: Center(
                            child: Text("Animale-$index", style: const TextStyle(fontSize: 25)),
                          )),
                    ))
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
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/alreadyVisited");
                  },
                  child: const Text("Cosa hai già visitato"))
            ],
          ),
        ),
      ),
    );
  }
}
