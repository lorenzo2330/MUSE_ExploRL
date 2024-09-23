import 'package:flutter/material.dart';

import 'myInt.dart';
import 'myString.dart';

class MyButton {
  static ElevatedButton homePageBottomButton = ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        fixedSize:
            WidgetStateProperty.all<Size>(MyInt.homePageBottomButtonSize),
      ),
      child: Text(MyString.placeholder,
          style: TextStyle(
            fontSize: MyInt.homePageBottomButtonTextSize.toDouble(),
          )));

  static ElevatedButton alreadyVisitedButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/alreadyVisited");
        },
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all<Size>(const Size(200, 10)),
        ),
        child: const Text("Cosa hai già visitato",
            style: TextStyle(
              fontSize: 15,
            )));
  }

  static ElevatedButton notVisitedButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/notVisited");
        },
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all<Size>(const Size(200, 10)),
        ),
        child: const Text("Cosa puoi visitare ora",
            style: TextStyle(
              fontSize: 15,
            )));
  }

  static ElevatedButton restartButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context); //Objective
          Navigator.pop(context); //Tutorial
          Navigator.pop(context); //Home
        },
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all<Size>(const Size(200, 10)),
        ),
        child: const Text("Nuovo tentativo",
            style: TextStyle(
              fontSize: 15,
            )));
  }
}
