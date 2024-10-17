
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/energy_provider.dart';
import '../my_colors.dart';
import '../my_int.dart';
import 'my_stack.dart';

class MyBottomAppBar {

  static BottomAppBar myBottomAppBar(BuildContext context) {
    return BottomAppBar(
        color: MyColors.backgroundYellow,
        height: MyInt.bottomBarHeight.toDouble(),
        child: MyStack.getBattery(
            charge: context.watch<EnergyProvider>().energy, batterySize: MyInt.batterySize));
  }

}