import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/providers/game_provider.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_qr.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_text.dart';
import 'package:app_rl/res/widgets/my_bottom_app_bar.dart';
import 'package:app_rl/res/widgets/my_column.dart';
import 'package:app_rl/res/widgets/my_sized_box.dart';
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
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    hasWin = context.read<ExhibitProvider>().nextIsWinnerExhibit();
    noEnergy = context.read<EnergyProvider>().energy == 0;
    endGame = hasWin || noEnergy;
    GameProvider gProvR = context.read<GameProvider>();
    ExhibitProvider exProvW = context.watch<ExhibitProvider>();
    return Scaffold(
      backgroundColor: gProvR.trovato && endGame
          ? hasWin
              ? Colors.greenAccent
              : Colors.red
          : MyColors.backgroundYellow,
      appBar: AppBar(
        automaticallyImplyLeading: !endGame,
        title: MyText.getPlainText(MyString.animale, true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyColumn.namesOfExhibits(context),
            MySizedBox.imageBox(context),
            exProvW.scansioneCorretta
                ? MySizedBox.findedExhibit(context, noEnergy, hasWin)
                : MyQr(context: context)
          ],
        ),
      ),
      /*
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

       */

      bottomNavigationBar: hasWin && context.watch<ExhibitProvider>().scansioneCorretta ? null : MyBottomAppBar.myBottomAppBar(context),
    );
  }
}
