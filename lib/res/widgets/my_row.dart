
import 'package:flutter/material.dart';

import 'my_column.dart';
import 'my_gesture_detector.dart';

class MyRow {
  static Row exhibitRow(BuildContext context){
    return Row(
      children: [
        Expanded(flex: 16, child: MyColumn.namesOfExhibits(context)),
        Expanded(flex: 6, child: MyGestureDetector.imageBox(context)),
      ],
    );
  }

}