import 'package:app_rl/res/my_colors.dart';
import 'package:app_rl/res/my_widgets.dart';
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
      appBar: AppBar(
        title: const Text("Cosa puoi visitare ora"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
        child: Column(children: [
          Expanded(child: MyWidgets.getListOfNotVisitedExhibit(context, false)),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/alreadyVisited");
              },
              child: const Text("Cosa hai già visitato"),
          ),
        ]),
      ),
      bottomNavigationBar: MyWidgets.myBottomAppBar(context)
    );
  }
}
