
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter demo app")),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Pagina di errore",
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: const Text("Torna alla home page"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
