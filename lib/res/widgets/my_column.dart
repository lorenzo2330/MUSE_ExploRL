import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/exhibit.dart';
import '../../providers/exhibit_provider.dart';
import '../my_int.dart';
import 'my_text.dart';

class MyColumn {
  static Column namesOfExhibits(BuildContext context) {
    ExhibitProvider exProvR = context.read<ExhibitProvider>();
    Exhibit e;
    if (exProvR.inTutorial) {
      e = exProvR.prossimoForTutorial!;
    } else {
      e = exProvR.nextExhibit;
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.getItalicLeftTextWithSize(e.scientificName, 22, false),
              MyText.getLeftTextWithSize(e.normalName, 22, false),
            ],
          ),
          MyText.getLeftTextWithSize(MyString.nPiano(exProvR.nextExhibit.nPiano), 22, false),
        ]);
  }

  static Column creditList() {
    EdgeInsets p = MyInt.leftPadding;
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyText.getLeftTextWithSize(MyString.creditTitle, 30, true),
                ],
              )),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.getCreditText(MyString.creditProgetto, true),
                  Padding(padding: p, child: MyText.getCreditText(MyString.creditPopmat, false)),
                ],
              )),
          Expanded(
            flex: 2,
            child: Padding(padding: p, child: MyText.getCreditText(MyString.creditMuse, false)),
          ),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.getCreditText(MyString.creditSviluppatore, true),
                  Padding(
                    padding: p,
                    child: MyText.getCreditText(MyString.creditNomeSviluppatore, false),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.getCreditText(MyString.creditFoto, true),
                  Padding(padding: p, child: MyText.getCreditText(MyString.creditFotografo, false))
                ],
              )),
        ]);
  }

  static Column exhibitInfo(String t1, String t2){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.getLeftTextWithSize(t1, 22, false),
        MyText.getLeftTextWithSize(t2, 22, false),
      ],
    );
  }
}
