 
import 'package:flutter/material.dart';
import 'screen1.dart';

class Screen2 extends StatelessWidget {
  void SelectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
      Screen1.routName,
    );
  }

  @override
  Widget build(BuildContext context) {
    late Map<String, Object> routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 2"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Screen2",
              style: const TextStyle(fontSize: 30, color: Colors.teal),
            ),
            InkWell(
              child: const Text(
                "Go To Screen 1",
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
