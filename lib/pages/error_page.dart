
import 'package:app_rl/res/my_string.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MyString.getPlainText("Flutter demo app", true)),
      body: Center(
        child: Column(
          children: [
            MyString.getCenterTextWithSize("Pagina di errore", 50, true),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: MyString.getPlainText("Torna alla home page", false))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
