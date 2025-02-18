
import 'package:flutter/material.dart';

import '../models/exhibit.dart';
import '../models/exhibit_list.dart';


class AnimalProvider extends ChangeNotifier {

  bool _inTutorial = false;

  bool get inTutorial => _inTutorial;

  void setInTutorial(bool mode) { _inTutorial = mode; notifyListeners(); }

  Animale _nextExhibit = ExhibitList.startingExhibit;

  void setExhibit(Animale e) { _nextExhibit = e; notifyListeners(); }

  Animale get nextExhibit => inTutorial ? ExhibitList.tutorialExhibit :  _nextExhibit;

  List<Animale> _visited = [];

  List<Animale> get visited => _visited;

  void visit(Animale e) {
    if(e != ExhibitList.tutorialExhibit) _visited.add(e);
    notifyListeners();
  }

  bool _scansioneCorretta = false;

  bool get scansioneCorretta => _scansioneCorretta;

  bool _scansioneCorrettaTutorial = false;

  bool get scansioneCorrettaTutorial => _scansioneCorrettaTutorial;

  void setScansioneCorretta(){
    if(inTutorial) { _scansioneCorrettaTutorial = true; }
    else { _scansioneCorretta = true; }
    notifyListeners();
  }

  void setDaScansionare(){
    if(inTutorial) { _scansioneCorrettaTutorial = false; }
    else { _scansioneCorretta = false; }
    notifyListeners(); }

  bool nextIsWinnerExhibit() { return ExhibitList.winnerExhibit == _nextExhibit; }

  void prepareToStart() {
    _visited = [];
    _nextExhibit = ExhibitList.startingExhibit;
    setDaScansionare();
    notifyListeners();
  }

  Animale? _prossimoForTutorial = ExhibitList.tutorialExhibit;

  Animale? get prossimoForTutorial => _prossimoForTutorial;

  void setProssimoForTutorial(Animale? e){ _prossimoForTutorial = e; notifyListeners(); }

/*  Notify listeners avvisa tutti i listeners comunicando
  *   che è avvenuta una modifica (ha cambiato stato) */
}
