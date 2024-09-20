
import 'package:app_rl/providers/EnergyProvider.dart';
import 'package:flutter/material.dart';

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

  Battery({ required this.charge });

  final int charge;

  //Dimensioni della batteria  (completa)
  final double batteryWidth = 300;
  final double batteryHeight = 75;

  //Bordo della batteria
  final batteryBorder = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4
    ..color = Colors.black;

  //Contenuto della batteria  ("carica")
  final batteryFillPainterFull = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.green;

  //Contenuto della batteria  ("mezza carica")
  final batteryFillPainterMid = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.yellow;

  //Contenuto della batteria  ("quasi scarica")
  final batteryFillPainterLow = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.red[400]!;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.height / 2, size.width / 2);

    final shellRect = Rect.fromCenter(
      center: center,
      width: batteryWidth,
      height: batteryHeight,
    );

    canvas.drawRect(shellRect, batteryBorder);

    //Calcola la larghezza della batteria (in base a quanta energia rimane
    final double fillWith = (batteryWidth - 4)  * (charge / EnergyProvider.maxEnergy);

    //Calcola la dimensione del rettangolo da colorare
    final fillRect  = Rect.fromLTWH(
        center.dx - (batteryWidth / 2) + 2,
        center.dy - (batteryHeight / 2) + 2,
        fillWith,
        batteryHeight - 4,
    );

    //Disegno effettivo della batteria
    //  (dimensione: fillRect, contenuto (colore): painter in base a charge)
    canvas.drawRect(fillRect, getPainter());
  }

  //Necessario per la classe CustomPainter, ma non la invoco mai
  @override
  bool shouldRepaint(Battery oldDelegate) { return oldDelegate.charge != charge; }
}