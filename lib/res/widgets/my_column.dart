import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';

import '../../models/exhibit.dart';
import 'my_text.dart';

class MyColumn {
  static Column namesOfExhibits(Exhibit e) {
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
