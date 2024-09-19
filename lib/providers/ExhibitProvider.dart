
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/myList.dart';

class ExhibitProvider extends ChangeNotifier{

  final random = Random();


  bool _firstExhibit = true;

  bool get firstExhibit => _firstExhibit;

  void setFirstExhibit(){ _firstExhibit = false; notifyListeners(); }


  int _nextExhibit = -1;

  int get nextExhibit => _nextExhibit == -1 ? getRandomExhibit() : _nextExhibit;

  int getRandomExhibit(){ _nextExhibit = random.nextInt(MyList.nomiAnimali.length); return _nextExhibit; }

  void setExhibit(int n){ _nextExhibit = n; notifyListeners(); }


  List<int> _visited = [];

  List<int> _notVisited = [];

  List<int> get visited => _visited;

  List<int> get notVisited => _notVisited;

  void visit(int n) { _visited.add(n); _notVisited.remove(n); notifyListeners(); }

  void unlockExhibit(){
    for(int i = 0; i < 3; i++){ //ne sblocco x ogni volta
      int newExh = random.nextInt(MyList.nomiAnimali.length);
      while(_visited.contains(newExh)) { newExh = random.nextInt(MyList.nomiAnimali.length); }
      if(!_notVisited.contains(newExh)){ _notVisited.add(newExh); }
    }
  }



  late int _winnerExhibit;

  int get winnerExhibit => _winnerExhibit;    //getter

  bool nextIsWinnerExhibit() { return _winnerExhibit == _nextExhibit; }

  void generateRandomExhibit(){
    _winnerExhibit = random.nextInt(MyList.nomiAnimali.length); //Genero un Exhibit vincente
    notifyListeners();
  }

  void prepareToStart(){
    _visited = [];
    _notVisited = [];
    generateRandomExhibit();  //Genero un nuovo exhibit vincente
    _firstExhibit = true;
    _nextExhibit = -1;
    notifyListeners();
  }

/*  Notify listeners avvisa tutti i listeners comunicando
  *   che è avvenuta una modifica (ha cambiato stato) */
}