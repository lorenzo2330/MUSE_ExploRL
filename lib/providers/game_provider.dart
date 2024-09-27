
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier{

  bool _trovato = false;

  bool get trovato => _trovato;

  void scanned(){ _trovato = true; notifyListeners(); }

  void daTrovare(){ _trovato = false; }

  final Set<int> _sezioniVisitate = { 0 };  //Metto un set così non salva più volte gli indici delle stesse pagine

  Set<int> get sezioniVisitate => _sezioniVisitate;

  void addSezioniVisitate(int index){ _sezioniVisitate.add(index); notifyListeners(); }

}
