import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/exhibit.dart';
import '../../providers/exhibit_provider.dart';
import 'my_text.dart';

class MyColumn {
  static Column namesOfExhibits(BuildContext context) {
    ExhibitProvider exProvR = context.read<ExhibitProvider>();
    Exhibit e;
    if(exProvR.inTutorial){ e = exProvR.prossimoForTutorial!; }
    else { e = exProvR.nextExhibit; }
    return Column(children: [
      MyText.getItalicCenterTextWithSize(e.scientificName, 22, false),
      MyText.getCenterTextWithSize(e.normalName, 22, false)
    ]);
  }

  static Column creditList() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.getCreditText(MyString.creditProgetto),
          MyText.getCreditText(MyString.creditPopmat),
          MyText.getCreditText(MyString.creditMuse),
          MyText.getCreditText(""),
          MyText.getCreditText(MyString.creditSviluppatore),
          MyText.getCreditText(MyString.creditNomeSviluppatore),
          MyText.getCreditText(""),
          MyText.getCreditText(MyString.creditFoto),
          MyText.getCreditText(MyString.creditFotografo),
        ]);
  }
}
