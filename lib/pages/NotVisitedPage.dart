import 'package:app_rl/res/myColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/myList.dart';
import '../providers/ExhibitProvider.dart';
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
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        // *** NOME ANIMALE ***
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Nome",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        // *** LOCATION ANIMALE ***
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Amb.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        // *** ALIMENTAZIONE ANIMALE ***
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Alim.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ))),
            ),
            ...List.generate(
                context.watch<ExhibitProvider>().notVisited.length,
                (index) => InkWell(
                      onTap: () {
                        //Accedo a ExhibitProvider senza "ascoltare i cambiamenti"
                        final exhibitProvider = Provider.of<ExhibitProvider>(
                            context,
                            listen: false);
                        exhibitProvider
                            .setExhibit(exhibitProvider.notVisited[index]);
                        Navigator.pop(context); // Torno a ExhibitPage
                        Navigator.pop(context); // Torno a ObjectivePage
                      },
                      child: Card(
                        child: SizedBox(
                            height: 100,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  // *** NOME ANIMALE ***
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    MyList.nomiAnimali[context
                                        .watch<ExhibitProvider>()
                                        .notVisited[index]],
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
                                        .notVisited[index]],
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
                                        .notVisited[index]],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ))),
                      ),
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
