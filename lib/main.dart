import 'package:app_rl/pages/HomePage.dart';
import 'package:app_rl/pages/RouteGenerator.dart';
import 'package:app_rl/providers/EnergyProvider.dart';
import 'package:app_rl/providers/ExhibitProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EnergyProvider()),
        ChangeNotifierProvider(create: (_) => ExhibitProvider())
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      onGenerateRoute: RouteGenerator.generateRoute,  //Delego la gestione della navigazione alla mia pagina RouteGenerator
    );
  }
}

