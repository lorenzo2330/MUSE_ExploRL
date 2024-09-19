

import 'package:flutter/material.dart';

class EnergyProvider extends ChangeNotifier{

  static const int maxEnergy = 15;

  int _energy = maxEnergy;

  int get energy => _energy;    //getter

  //void plusOne(){ _energy++; notifyListeners(); } //nel caso ci fosse un modo per incrementare energia

  void decreaseEnergy(){ _energy--; notifyListeners(); }

  /*  Notify listeners avvisa tutti i listeners comunicando
  *   che è avvenuta una modifica (ha cambiato stato) */

  void prepareToStart(){ _energy = maxEnergy; }
}