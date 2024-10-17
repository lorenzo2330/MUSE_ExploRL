import 'package:flutter/material.dart';

import '../my_text.dart';

class MyPadding {
  static Padding getNotVisitedField(String text) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: MyText.getCenterTextWithSize(text, 30, false)));
  }
}
