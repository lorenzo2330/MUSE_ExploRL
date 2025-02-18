
import 'package:app_rl/pages/already_visited_page.dart';
import 'package:app_rl/pages/animal_page.dart';
import 'package:app_rl/pages/home_page.dart';
import 'package:app_rl/pages/not_visited_page.dart';
import 'package:app_rl/pages/objective_page.dart';
import 'package:app_rl/pages/tutorial_page.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';

import 'error_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;  //Giusto per comodità se voglio fare operazioni su argomenti in input

    switch(settings.name){
      case MyString.routeHome:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case MyString.routeTutorial:
        return MaterialPageRoute(builder: (context) => const TutorialPage());
      case MyString.routeObjective:
        return MaterialPageRoute(builder: (context) => const ObjectivePage());
      case MyString.routeExhibit:
        return MaterialPageRoute(builder: (context) => const AnimalPage());
      case MyString.routeAlreadyVisited:
        return MaterialPageRoute(builder: (context) => const AlreadyVisitedPage());
      case MyString.routeNotVisited:
        return MaterialPageRoute(builder: (context) => const NotVisitedPage());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}