import 'package:app_rl/res/my_string.dart';
import 'package:app_rl/res/widgets/my_button.dart';
import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/widgets/my_text.dart';
import 'package:app_rl/res/widgets/my_bottom_app_bar.dart';
import 'package:app_rl/res/widgets/my_list_view.dart';
import 'package:flutter/material.dart';

class NotVisitedPage extends StatefulWidget {
  const NotVisitedPage({super.key});

  @override
  State<NotVisitedPage> createState() => _NotVisitedPageState();
}

class _NotVisitedPageState extends State<NotVisitedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backgroundYellow,
        appBar: AppBar(title: MyText.getPlainText(MyString.cosaPuoiVisitare, true)),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
          child: Column(children: [
            Expanded(child: MyListView.getListOfNotVisitedExhibit(context, false)),
            MyButton.alreadyVisitedButton(context, true),
          ]),
        ),
        bottomNavigationBar: MyBottomAppBar.myBottomAppBar(context));
  }
}
