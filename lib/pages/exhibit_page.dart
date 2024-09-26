import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/providers/game_provider.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:app_rl/res/my_qr.dart';
import 'package:app_rl/res/my_widgets.dart';
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
      backgroundColor: context.watch<GameProvider>().trovato && endGame
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
            MyWidgets.namesOfExhibits(context.read<ExhibitProvider>().nextExhibit),
            MyWidgets.imageBox(context, context.read<ExhibitProvider>().nextExhibit),
            context.watch<ExhibitProvider>().scansioneCorretta
                ? MyWidgets.findedExhibit(context, noEnergy, hasWin)
                : MyQr(context: context)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Segno che ho: scansionato l'exhibit => visto l'exhibit => "consumato" un'energia,
          context.read<ExhibitProvider>().setScansioneCorretta();
          context
              .read<ExhibitProvider>()
              .visit(context.read<ExhibitProvider>().nextExhibit);
          context.read<EnergyProvider>().decreaseEnergy();
        },
        child: const Icon(Icons.qr_code_outlined),
      ),
      bottomNavigationBar: BottomAppBar(
          color: MyColors.backgroundYellow,
          height: MyInt.bottomBarHeight.toDouble(),
          child: MyWidgets.getBattery(
              charge: context.watch<EnergyProvider>().energy,
              batterySize: MyInt.batterySize
          )
      ),
    );
  }
}
