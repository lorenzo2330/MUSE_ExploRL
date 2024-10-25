
import 'package:app_rl/res/my_colors.dart';
import 'package:flutter/material.dart';

import '../providers/energy_provider.dart';

class Battery extends CustomPainter {

  Paint getPainter(){
    switch(charge / EnergyProvider.maxEnergy){
      case > 0.5:
        return batteryFillPainterFull;
      case > 0.2:
        return batteryFillPainterMid;
      default:
        return batteryFillPainterLow;
    }
  }

  Battery({ required this.charge, required this.batterySize });

  final int charge;

  //Dimensioni della batteria  (completa)
  final Size batterySize;

  //Bordo della batteria
  final batteryBorder = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4
    ..color = Colors.black;

  //Contenuto della batteria  ("carica")
  final batteryFillPainterFull = Paint()
    ..style = PaintingStyle.fill
    ..color = MyColors.batteryFull;

  //Contenuto della batteria  ("mezza carica")
  final batteryFillPainterMid = Paint()
    ..style = PaintingStyle.fill
    ..color = MyColors.batteryMid;

  //Contenuto della batteria  ("quasi scarica")
  final batteryFillPainterLow = Paint()
    ..style = PaintingStyle.fill
    ..color = MyColors.batteryLow;

  // Colore di sfondo blu per la parte vuota della batteria
  final batteryBackground = Paint()
    ..style = PaintingStyle.fill
    ..color = MyColors.appBarColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.height / 2, size.width / 2);

    //Dimensioni rettangolo da colorare
    final shellRect = Rect.fromCenter(
      center: center,
      width: batterySize.width,
      height: batterySize.height,
    );

    //Sfondo blu
    canvas.drawRect(shellRect, batteryBackground);

    //Bordo nero
    canvas.drawRect(shellRect, batteryBorder);

    //Calcola la larghezza della batteria (in base a quanta energia rimane
    final double fillWith = (batterySize.width - 4)  * (charge / EnergyProvider.maxEnergy);

    //Calcola la dimensione del rettangolo da colorare
    final fillRect  = Rect.fromLTWH(
        center.dx - (batterySize.width / 2) + 2,
        center.dy - (batterySize.height / 2) + 2,
        fillWith,
      batterySize.height - 4,
    );

    //Disegno effettivo della batteria
    //  (dimensione: fillRect, contenuto (colore): painter in base a charge)
    canvas.drawRect(fillRect, getPainter());
  }

  //Necessario per la classe CustomPainter, ma non la invoco mai
  @override
  bool shouldRepaint(Battery oldDelegate) { return oldDelegate.charge != charge; }
}