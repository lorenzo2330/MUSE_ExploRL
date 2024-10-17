
import 'package:flutter/material.dart';

import '../models/exhibit.dart';
import 'energy_provider.dart';

class GameProvider extends ChangeNotifier{

  bool _trovato = false;

  bool get trovato => _trovato;

  void scanned(){ _trovato = true; notifyListeners(); }

  void daTrovare(){ _trovato = false; }

  final Set<int> _sezioniVisitate = { 0 };  //Metto un set così non salva più volte gli indici delle stesse pagine

  Set<int> get sezioniVisitate => _sezioniVisitate;

  void addSezioniVisitate(int index){ _sezioniVisitate.add(index); notifyListeners(); }

  String? _tutSelectedMatch;

  String? get tutSelectedMatch => _tutSelectedMatch;

  void setTutSelectedMatch(String? value){ _tutSelectedMatch = value; notifyListeners(); }

  String? _selectedMatch;

  String? get selectedMatch => _selectedMatch;

  void setSelectedMatch(String? value) {
    _selectedMatch ??= value; //Se è nullo => assegno la partita attuale
    notifyListeners();
  }

  List<List<String>> _listOfMatch = [];

  List<List<String>> get listOfMatch => _listOfMatch;

  void initListOfMatch() { _listOfMatch = []; notifyListeners(); }

  void addToListOfMatch(List<String> match){ _listOfMatch.add(match); notifyListeners(); }

  List<int> _listOfEnergy = [];

  List<int> get listOfEnergy => _listOfEnergy;

  void initListOfEnergy() { _listOfEnergy = []; notifyListeners(); }

  void addToListOfEnergy(int e){ _listOfEnergy.add(e); notifyListeners(); }

  late List<Exhibit> _listToDisplay = [];

  List<Exhibit> get listToDisplay => _listToDisplay;

  void initListToDisplay() { _listToDisplay = []; notifyListeners(); }

  void setListToDisplay(List<Exhibit> l){ _listToDisplay = l; notifyListeners(); }

  late List<Exhibit> _listOfThisRound = [];

  List<Exhibit> get listOfThisRound => _listOfThisRound;

  void initListOfThisRound() { _listOfThisRound = []; notifyListeners(); }

  void setListOfThisRound(List<Exhibit> l){ _listOfThisRound = l; notifyListeners(); }

  int _energyToDisplay = EnergyProvider.maxEnergy;

  int get energyToDisplay => _energyToDisplay;

  void setEnergyToDisplay(int e){ _energyToDisplay = e; notifyListeners(); }

}
