

import 'dart:math';

import 'package:flutter/material.dart';

import '../models/myList.dart';

class ExhibitProvider extends ChangeNotifier{

  final random = Random();

  late final int _winnerExhibit;

  /*  Costruttore per inizializzare _winnerExhibit
        (viene generato a inizio programma)
        (non  possibile inizializzarlo all'interno della classe)
   */
  ExhibitProvider() {
    _winnerExhibit = random.nextInt(MyList.nomiAnimali.length);
  }

  int get winnerExhibit => _winnerExhibit;    //getter

/*  Notify listeners avvisa tutti i listeners comunicando
  *   che è avvenuta una modifica (ha cambiato stato) */
}