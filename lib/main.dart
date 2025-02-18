import 'package:app_rl/pages/home_page.dart';
import 'package:app_rl/pages/route_generator.dart';
import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/providers/game_provider.dart';
import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/exhibit_list.dart';

void main() async {
  ExhibitList.setNeighbors(); //Invoco una sola volta all'avvio, assegno i vari vicini ad ogni Exhibit
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EnergyProvider()),
        ChangeNotifierProvider(create: (_) => AnimalProvider()),
        ChangeNotifierProvider(create: (_) => GameProvider())
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyString.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const HomePage(),
      onGenerateRoute: RouteGenerator.generateRoute,  //Delego la gestione della navigazione alla mia pagina RouteGenerator
    );
  }
}

