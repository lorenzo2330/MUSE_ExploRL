import 'package:app_rl/res/myColors.dart';
import 'package:app_rl/res/myInt.dart';
import 'package:app_rl/res/myString.dart';
import 'package:flutter/material.dart';

class ObjectivePage extends StatelessWidget {
  const ObjectivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundYellow,
      appBar: AppBar(
        title: const Text("Obiettivo"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              MyString.placeholder,
              style: TextStyle(fontSize: 60),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/exhibit");
                },
                child: const Text("Vai a exhibit")
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MyInt.bottomBarHeight.toDouble(),
      ),
    );
  }
}
