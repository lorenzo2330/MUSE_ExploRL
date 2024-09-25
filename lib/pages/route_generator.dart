
import 'package:app_rl/pages/already_visited_page.dart';
import 'package:app_rl/pages/exhibit_page.dart';
import 'package:app_rl/pages/home_page.dart';
import 'package:app_rl/pages/not_visited_page.dart';
import 'package:app_rl/pages/objective_page.dart';
import 'package:app_rl/pages/tutorial_page.dart';
import 'package:flutter/material.dart';

import 'error_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;  //Giusto per comodità se voglio fare operazioni su argomenti in input

    switch(settings.name){
      case "/home":
        return MaterialPageRoute(builder: (context) => const HomePage());
      case "/tutorial":
        return MaterialPageRoute(builder: (context) => const TutorialPage());
      case "/objective":
        return MaterialPageRoute(builder: (context) => const ObjectivePage());
      case "/exhibit":
        return MaterialPageRoute(builder: (context) => const ExhibitPage());
      case "/alreadyVisited":
        return MaterialPageRoute(builder: (context) => const AlreadyVisitedPage());
      case "/notVisited":
        return MaterialPageRoute(builder: (context) => const NotVisitedPage());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}