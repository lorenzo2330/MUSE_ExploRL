import 'package:app_rl/res/widgets/my_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/exhibit_provider.dart';
import 'my_button.dart';
import '../my_colors.dart';
import '../my_int.dart';
import '../my_string.dart';
import 'my_text.dart';

class MySizedBox {
  static SizedBox exhibitInfo(BuildContext context) {
    var exProv = context.read<AnimalProvider>();
    var nextExh = exProv.nextExhibit;

    String al = MyString.getAlimentazione(nextExh.alimentazione);
    String loc = MyString.getLocalitaGeografica(nextExh.ambiente);

    return SizedBox(
      width: double.infinity,
      child: Padding(padding: MyInt.leftPadding, child: MyColumn.exhibitInfo(al, loc)),
    );
  }

  static SizedBox resultText(bool noEnergy, bool hasWin) {
    String resultText = MyString.result(noEnergy, hasWin);

    return SizedBox(
      width: double.infinity,
      child: Container(
        color: MyColors.getResultColor(noEnergy, hasWin),
        child: Padding(
          padding: MyInt.leftPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.getLeftTextWithSize(resultText, 22, false),
            ],
          ),
        ),
      ),
    );
  }

  static SizedBox findedExhibit(BuildContext context, bool noEnergy, bool hasWin) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        color: MyColors.getResultColor(noEnergy, hasWin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyButton.alreadyVisitedButton(context, false),
            noEnergy || hasWin
                ? MyButton.restartButton(context, false)
                : MyButton.notVisitedButton(context, false),
          ],
        ),
      ),
    );
  }


}
