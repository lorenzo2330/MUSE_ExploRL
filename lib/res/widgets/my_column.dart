import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';

import '../../models/exhibit.dart';
import '../my_text.dart';

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
          MyText.getCenterTextWithSize(MyString.creditDipartimento, 20, false),
          MyText.getCenterTextWithSize(MyString.creditFont, 20, false),
          MyText.getCenterTextWithSize(MyString.creditFotografo, 20, false),
          MyText.getCenterTextWithSize(MyString.creditIdeatrice, 20, false),
          MyText.getCenterTextWithSize(MyString.creditMuse, 20, false),
          MyText.getCenterTextWithSize(MyString.creditSviluppatore, 20, false),
          MyText.getCenterTextWithSize(MyString.creditAltro, 20, false)
        ]);
  }
}
