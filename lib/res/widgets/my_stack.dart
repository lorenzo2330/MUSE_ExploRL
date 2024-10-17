import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';

import '../../models/battery.dart';
import '../my_int.dart';
import '../my_text.dart';

class MyStack {
  static Stack getBattery({required int charge, required Size batterySize}) {
    bool isMini = batterySize.width != MyInt.batterySize.width;
    String text = MyString.energy(isMini, charge);
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(painter: Battery(charge: charge, batterySize: batterySize)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText.getCenterTextWithSize(text, 17, false),
            /*style: const TextStyle(color: Colors.black87, fontSize: 17, fontWeight: FontWeight.bold)*/
            const Icon(Icons.offline_bolt),
          ],
        )
      ],
    );
  }
}
