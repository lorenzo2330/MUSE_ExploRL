
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/energy_provider.dart';
import '../my_colors.dart';
import '../my_int.dart';
import 'my_stack.dart';
import 'my_text.dart';

class MyAppBar {

  static BottomAppBar myBottomAppBar(BuildContext context) {
    return BottomAppBar(
        color: MyColors.appBarColor,
        height: MyInt.bottomBarHeight.toDouble(),
        child: MyStack.getBattery(
            charge: context.watch<EnergyProvider>().energy, batterySize: MyInt.batterySize));
  }

  static AppBar myAppBar(String title, List<Widget>? actions, TabBar? bottom, bool showBack){
    return AppBar(
      backgroundColor: MyColors.appBarColor,
      foregroundColor: MyColors.textOfButtonColor,
      title: MyText.getAppbarText(title),
      actions: actions,
      bottom: bottom,
    );
  }

}