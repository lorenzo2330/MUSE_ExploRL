import 'package:app_rl/providers/GameProvider.dart';
import 'package:app_rl/res/myColors.dart';
import 'package:app_rl/res/myWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              child: SizedBox(
                  height: 100,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyWidgets.getNotVisitedTitleField("Nome"),
                      MyWidgets.getNotVisitedTitleField("Amb."),
                      MyWidgets.getNotVisitedTitleField("Alim."),
                    ],
                  ))),
            ),
            ...List.generate(
                context.watch<ExhibitProvider>().nextExhibit.neighbors.length,
                (index) => InkWell(
                      onTap: () {
                        //Accedo a ExhibitProvider senza "ascoltare i cambiamenti"
                        final exhibitProvider = Provider.of<ExhibitProvider>(
                            context,
                            listen: false);
                        exhibitProvider
                            .setExhibit(exhibitProvider.nextExhibit.neighbors[index]);
                        context.read<GameProvider>().daTrovare();
                        Navigator.pop(context); // Torno a ExhibitPage
                      },
                      child: Card(
                        child: SizedBox(
                            height: 100,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyWidgets.getNotVisitedRowField(context.watch<ExhibitProvider>().nextExhibit.neighbors[index].shortName),
                                MyWidgets.getNotVisitedRowField(context.watch<ExhibitProvider>().nextExhibit.neighbors[index].loc),
                                MyWidgets.getNotVisitedRowField(context.watch<ExhibitProvider>().nextExhibit.neighbors[index].alim),
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