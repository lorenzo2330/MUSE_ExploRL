
import 'package:app_rl/pages/AlreadyVisitedPage.dart';
import 'package:app_rl/pages/ExhibitPage.dart';
import 'package:app_rl/pages/HomePage.dart';
import 'package:app_rl/pages/NotVisitedPage.dart';
import 'package:app_rl/pages/ObjectivePage.dart';
import 'package:app_rl/pages/TutorialPage.dart';
import 'package:flutter/material.dart';

import 'ErrorPage.dart';

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