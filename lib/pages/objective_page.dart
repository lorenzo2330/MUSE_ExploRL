import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/widgets/my_text.dart';
import 'package:app_rl/res/widgets/my_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ObjectivePage extends StatefulWidget {
  const ObjectivePage({super.key});

  @override
  State<ObjectivePage> createState() => _ObjectivePageState();
}

class _ObjectivePageState extends State<ObjectivePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      /*  PopScope permette di monitorare il "tornare indietro", in questo
      *   caso, tornando indietro si ritorna nella sezione tutorial, quindi
      *   sarà necessario settare nuovamente inTutorial = true  */
      onPopInvokedWithResult: (bool x, dynamic result) {
        context.read<ExhibitProvider>().setInTutorial(true);
        return;
      },
      child: Scaffold(

        backgroundColor: MyColors.backgroundYellow,
        appBar: AppBar(
          title: MyText.getPlainText(MyString.obiettivo, true),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyText.getCenterTextWithSize(MyString.descrizioneObiettivo, 20, false),
                MyButton.objectiveStartingButton(context)
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomAppBar.myBottomAppBar(context),
      ),
    );
  }
}
