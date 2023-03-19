 
import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  static const routName = '/my_screen1_category';

  void SelectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
      '/x2',
    );
  }

  @override
  Widget build(BuildContext context) {
    late Map<String, Object> routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Screen1",
              style: const TextStyle(fontSize: 30, color: Colors.teal),
            ),
            InkWell(
              child: const Text(
                "Go To Screen 2",
                style: TextStyle(fontSize: 30, color: Colors.teal),
              ),
              onTap: () => SelectScreen(context),
            ),
          ],
        ),
      ),
    );
  }
}
