
import 'package:flutter/material.dart';

import '../models/Exhibit.dart';
import '../models/exhibit_list.dart';


class ExhibitProvider extends ChangeNotifier {

  Exhibit _nextExhibit = ExhibitList.startingExhibit;

  void setExhibit(Exhibit e) { _nextExhibit = e; notifyListeners(); }

  Exhibit get nextExhibit => _nextExhibit;

  List<Exhibit> _visited = [];

  //List<Exhibit> _notVisited = [];

  List<Exhibit> get visited => _visited;

  //List<Exhibit> get notVisited => _notVisited;

  void visit(Exhibit e) {
    _visited.add(e);
    //_notVisited.remove(e);
    //unlockNearExhibit(e);
    notifyListeners();
  }

  /*
  //Aggiunge i vicini non ancora presenti
  void unlockNearExhibit(Exhibit e) {
    _notVisited = []; //Azzero le possibili destinazioni
    for (var ex in e.neighbors) {
      print("\nExh ${ex.nName} -> ");
      if (!_notVisited.contains(ex)) {
        _notVisited.add(ex);
        print("Aggiungo\n");
      }
      else{
        print("Non aggiungo\n");
      }
    }
  }

   */

  bool nextIsWinnerExhibit() { return ExhibitList.winnerExhibit == _nextExhibit; }

  void prepareToStart() {
    _visited = [];
    //_notVisited = [];
    _nextExhibit = ExhibitList.startingExhibit;
    notifyListeners();
  }

/*  Notify listeners avvisa tutti i listeners comunicando
  *   che è avvenuta una modifica (ha cambiato stato) */
}
