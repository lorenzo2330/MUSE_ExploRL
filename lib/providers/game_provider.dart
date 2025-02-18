
import 'dart:async';

import 'package:flutter/material.dart';

import '../models/exhibit.dart';
import 'energy_provider.dart';

class GameProvider extends ChangeNotifier{

  int _nMinuti = 30;  //Modificare a piacimento

  int _nSecondi = 0;  //Modificare a piacimento

  int get nMinuti => _nMinuti;

  int get nSecondi => _nSecondi;

  bool alreadyStartedCountdown = false;

  bool decrease(){
    if(nMinuti == 0 && nSecondi == 0){ notifyListeners(); return false; }
    if(nSecondi == 0){ _nMinuti--; _nSecondi = 59; }
    else{ _nSecondi--; }
    notifyListeners();
    return true;
  }

  void startCountdown(){
    if(!alreadyStartedCountdown){
      Timer.periodic(const Duration(seconds: 1), (timer){
        decrease();
        notifyListeners();
      });
      alreadyStartedCountdown = true;
    }

  }


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
    //_selectedMatch ??= value; //Se è nullo => assegno la partita attuale
    _selectedMatch = value;
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

  late List<Animale> _listToDisplay = [];

  List<Animale> get listToDisplay => _listToDisplay;

  void initListToDisplay() { _listToDisplay = []; notifyListeners(); }

  void setListToDisplay(List<Animale> l){ _listToDisplay = l; notifyListeners(); }

  late List<Animale> _listOfThisRound = [];

  List<Animale> get listOfThisRound => _listOfThisRound;

  void initListOfThisRound() { _listOfThisRound = []; notifyListeners(); }

  void setListOfThisRound(List<Animale> l){ _listOfThisRound = l; notifyListeners(); }

  int _energyToDisplay = EnergyProvider.maxEnergy;

  int get energyToDisplay => _energyToDisplay;

  void setEnergyToDisplay(int e){ _energyToDisplay = e; notifyListeners(); }

}
