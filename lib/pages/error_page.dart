import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MyText.getPlainText(MyString.errorPage, true)),
      body: Center(
        child: Column(
          children: [
            MyText.getCenterTextWithSize(MyString.errorPage, 50, true),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyString.routeHome);
                },
                child: MyText.getPlainText(MyString.tornaAllaHome, false))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
