import 'package:app_rl/pages/AlreadyVisitedPage.dart';
import 'package:app_rl/pages/ExhibitPage.dart';
import 'package:app_rl/pages/HomePage.dart';
import 'package:app_rl/pages/NotVisitedPage.dart';
import 'package:app_rl/pages/ObjectivePage.dart';
import 'package:app_rl/pages/TutorialPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NotVisitedPage() //HomePage(),
    );
  }
}

