import 'package:app_rl/pages/tutorial_page_energy.dart';
import 'package:app_rl/pages/tutorial_page_info.dart';
import 'package:app_rl/pages/tutorial_page_qr.dart';
import 'package:app_rl/pages/tutorial_page_not_visited_table.dart';
import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/providers/game_provider.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tutorial_page_already_visited_table.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  //Metto un set così non salva più volte gli indici delle stesse pagine
  final Set<int> _sezioniVisitate = {}; //Salva le pagine di tutorial viste

  final int nTab = 5;

  @override
  void initState() {
    super.initState();
    // Funzione chiamata al caricamento iniziale della pagina
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExhibitProvider>().setInTutorial(true);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Funzione chiamata ogni volta che si ritorna a questa pagina (ad es. con Navigator.pop)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExhibitProvider>().setInTutorial(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: nTab,
        child: Scaffold(
          backgroundColor: MyColors.backgroundYellow,
          appBar: AppBar(
            title: const Text(MyString.tutorial),
            actions: [
              //Mostra il pulsante di avvio solo una volta viste tutte le tab
              if (context.watch<GameProvider>().sezioniVisitate.length == nTab)
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/objective");
                    context.read<ExhibitProvider>().setInTutorial(false);
                  },
                  child: const SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.play_circle_outline),
                        Text("Inizia", style: TextStyle(fontSize: 25),),
                      ],
                    ),
                  ),
                )
            ],
            bottom: TabBar(
              tabs: const [
                Tab(icon: Icon(Icons.info_outline)),
                Tab(icon: Icon(Icons.battery_5_bar_outlined)),
                Tab(icon: Icon(Icons.qr_code_outlined)),
                Tab(icon: Icon(Icons.playlist_add_check)),
                Tab(icon: Icon(Icons.playlist_add)),
              ],
              onTap: (index) { setState(() { _sezioniVisitate.add(index); }); },
            ),
          ),
          body: const TabBarView(
            children: [
              TutorialPageInfo(),
              TutorialPageEnergy(),
              TutorialPageQR(),
              TutorialPageAlreadyVisitedTable(),
              TutorialPageNotVisitedTable(),
            ],
          ),
          /*
          bottomNavigationBar: BottomAppBar(
            height: MyInt.bottomBarHeight.toDouble(),
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/objective");
                    context.read<ExhibitProvider>().setInTutorial(false);
                  },
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all<Size>(
                        const Size(300, 150)),
                  ),
                  child: const Text(
                      "Inizia",
                      style: TextStyle(
                        fontSize: 30,
                      )
                  )
              )
            ),
          ),

           */
        ));
  }
}
