
import 'package:flutter/material.dart';

import 'myInt.dart';
import 'myString.dart';

class MyButton {
  static ElevatedButton homePageBottomButton = ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all<Size>(
            MyInt.homePageBottomButtonSize),
      ),
      child: Text(
          MyString.placeholder,
          style: TextStyle(
            fontSize: MyInt.homePageBottomButtonTextSize.toDouble(),
          )
      )
  );

  static ElevatedButton tutorialBottomButton = ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all<Size>(
            const Size(300, 150)),
      ),
      child: const Text(
          "Inizia",
          style: TextStyle(
            fontSize: 30,
          )
      )
  );


}