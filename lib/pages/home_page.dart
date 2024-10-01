import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/my_int.dart';
import '../res/my_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(
        title: const Text(MyString.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              MyString.nomeAttivita,
              style: TextStyle(
                fontSize: MyInt.titleSize.toDouble(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/tutorial");
              },
              style: MyStyle.buttonStyleBig,
              child: const Text(
                "Iniziamo",
                style: TextStyle(fontSize: 35, color: Colors.black),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs
                      .clear(); // Questo cancellerà tutti i dati salvati nello SharedPreferences
                },
                style: MyStyle.tutorialUpButtonStyle,
                child: const Text("Cancella dati", style: TextStyle(color: Colors.black)))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MyInt.bottomBarHeight.toDouble(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Image.asset(
                "images/logoTondo.png",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            ClipRect(
              child: Image.asset(
                "images/logoQuadrato.png",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            ClipRect(
              child: Image.asset(
                "images/logoRettangolare.png",
                width: 100,
                height: 50,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
