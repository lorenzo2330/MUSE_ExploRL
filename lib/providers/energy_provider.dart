

import 'package:flutter/material.dart';

class EnergyProvider extends ChangeNotifier{

  static const int maxEnergy = 10;  //Modificare a piacimento

  int _energy = maxEnergy;

  int get energy => _energy;    //getter

  //void plusOne(){ _energy++; notifyListeners(); } //nel caso ci fosse un modo per incrementare energia

  void decreaseEnergy(){ if(_energy > 0) { _energy--; notifyListeners(); } }

  /*  Notify listeners avvisa tutti i listeners comunicando
  *   che è avvenuta una modifica (ha cambiato stato) */

  void prepareToStart(){ _energy = maxEnergy; }

  int _tutorialEnergy = maxEnergy;

  int get tutorialEnergy => _tutorialEnergy;

  void rechargeTutorialEnergy(){ _tutorialEnergy = maxEnergy; notifyListeners(); }

  void decreaseTutorialEnergy(){ if(_tutorialEnergy > 0) { _tutorialEnergy--; notifyListeners(); } }
}






