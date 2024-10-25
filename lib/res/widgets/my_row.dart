
import 'package:flutter/material.dart';

import 'my_column.dart';
import 'my_gesture_detector.dart';

class MyRow {
  static Row exhibitRow(BuildContext context){
    return Row(
      children: [
        Expanded(flex: 4, child: MyColumn.namesOfExhibits(context)),
        Expanded(flex: 2, child: MyGestureDetector.imageBox(context)),
      ],
    );
  }

}