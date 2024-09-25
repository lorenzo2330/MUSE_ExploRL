
import 'package:flutter/material.dart';

import '../res/my_widgets.dart';

class TutorialPageAlreadyVisitedTable extends StatefulWidget {
  const TutorialPageAlreadyVisitedTable({super.key});

  @override
  State<TutorialPageAlreadyVisitedTable> createState() => _TutorialPageAlreadyVisitedTableState();
}

class _TutorialPageAlreadyVisitedTableState extends State<TutorialPageAlreadyVisitedTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 18.0, left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Tentativo numero: ",
                  style: TextStyle(fontSize: 30))),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyWidgets.getAlreadyVisitedField("N°", 0, true),
                MyWidgets.getAlreadyVisitedField("Nome", 1, true),
                MyWidgets.getAlreadyVisitedField("Ambiente", 2, true),
                MyWidgets.getAlreadyVisitedField("Numero dita", 3, true),
              ]),
          Row(
            children: [
              MyWidgets.getAlreadyVisitedField(0.toString(), 0, false),
              MyWidgets.getAlreadyVisitedField("Lupo (Grigio)", 1, false),
              MyWidgets.getAlreadyVisitedField("Eurasia", 2, false),
              MyWidgets.getAlreadyVisitedField("4", 3, false),
            ],
          )
        ],
      ),
    );
  }
}
