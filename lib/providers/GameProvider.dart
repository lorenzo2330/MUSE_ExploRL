
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier{

  bool _trovato = false;

  bool get trovato => _trovato;

  void scanned(){ _trovato = true; notifyListeners(); }

  void daTrovare(){ _trovato = false; }

}
