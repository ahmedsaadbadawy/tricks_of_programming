import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  static const routName = '/my_screen1_category';

  void SelectScreen(BuildContext ctx,int n) {
    Navigator.of(ctx).pushReplacementNamed(
      '/x2',
      arguments: {
        'id': n == 1 ? 10 : 20,
        'title': n == 1 ? "info1" : "info2",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "${routeArg['id']}",
              style: const TextStyle(fontSize: 30, color: Colors.teal),
            ),
            Text(
              "${routeArg['title']}",
              style: const TextStyle(fontSize: 30, color: Colors.teal),
            ),
            InkWell(
              child: const Text(
                "Go To Screen 2",
                style: TextStyle(fontSize: 30, color: Colors.teal),
              ),
              onTap: () => SelectScreen(context,2),
            ),
          ],
        ),
      ),
    );
  }
}
