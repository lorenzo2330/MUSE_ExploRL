import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/widgets/my_app_bar.dart';
import 'package:app_rl/res/widgets/my_list_view.dart';
import 'package:flutter/material.dart';

import '../res/my_int.dart';
import '../res/widgets/my_padding.dart';
import '../res/widgets/my_text.dart';

class NotVisitedPage extends StatefulWidget {
  const NotVisitedPage({super.key});

  @override
  State<NotVisitedPage> createState() => _NotVisitedPageState();
}

class _NotVisitedPageState extends State<NotVisitedPage> {
  @override
  Widget build(BuildContext context) {
    double s = MyInt.tutorialStringSize.toDouble();
    ListView listOfExhibits = MyListView.getListOfNotVisitedExhibit(context, false);
    ElevatedButton b = MyButton.alreadyVisitedButton(context, true);

    Text cosaVisitare = MyText.getLeftTextWithSize(MyString.cosaPuoiVisitare, s, true);
    return Scaffold(
        backgroundColor: MyColors.bgColor,
        appBar: MyAppBar.myAppBar(MyString.cosaPuoiVisitare, [MyPadding.timerScreen(context)], null, true),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: cosaVisitare),
              Expanded(flex: 10, child: listOfExhibits),
              Expanded(flex: 2, child: Center(child: b))
            ],
          ),
        ),
        bottomNavigationBar: MyAppBar.myBottomAppBar(context));
  }
}
/*
* Column(children: [
            Expanded(child: MyListView.getListOfNotVisitedExhibit(context, false)),
            MyButton.alreadyVisitedButton(context, true),
          ])*/
