import 'package:app_rl/providers/GameProvider.dart';
import 'package:app_rl/res/myColors.dart';
import 'package:app_rl/res/myWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/EnergyProvider.dart';
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
        padding:
            const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
        child: Column(children: [
          Expanded(
            child: ListView(
              children: [
                Card(
                  color: MyColors.firstRowTable,
                  child: SizedBox(
                      height: 50,
                      child: Center(
                          child: MyWidgets.getNotVisitedField("Nome", true))),
                ),
                ...List.generate(
                    context
                        .watch<ExhibitProvider>()
                        .nextExhibit
                        .neighbors
                        .length,
                    (index) => InkWell(
                          onTap: () {
                            //Accedo a ExhibitProvider senza "ascoltare i cambiamenti"
                            final exhibitProvider =
                                Provider.of<ExhibitProvider>(context,
                                    listen: false);
                            exhibitProvider.setExhibit(
                                exhibitProvider.nextExhibit.neighbors[index]);
                            context.read<GameProvider>().daTrovare();
                            Navigator.pop(context); // Torno a ExhibitPage
                          },
                          child: Card(
                            color: Colors.deepOrange[100]!,
                            child: SizedBox(
                                height: 75,
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    MyWidgets.getNotVisitedField(
                                        context
                                            .watch<ExhibitProvider>()
                                            .nextExhibit
                                            .neighbors[index]
                                            .normalName,
                                        false),
                                  ],
                                ))),
                          ),
                        ))
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/alreadyVisited");
              },
              child: const Text("Cosa hai già visitato")),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          color: MyColors.backgroundYellow,
          height: MyInt.bottomBarHeight.toDouble(),
          child: MyWidgets.getBattery(
              charge: context.watch<EnergyProvider>().energy)),
    );
  }
}
