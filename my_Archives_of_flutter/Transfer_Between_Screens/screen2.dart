import 'package:flutter/material.dart';
import 'screen1.dart';

class Screen2 extends StatelessWidget {
  void SelectScreen(BuildContext ctx,int n) {
    Navigator.of(ctx).pushReplacementNamed(
      Screen1.routName,
      arguments: {
        'id': n == 1 ? 10 : 20,
        'title': n == 1 ? "info1" : "info2",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // if you want the tabBar to run remove the map.
    late Map<String, Object>  routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 2"),
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
                "Go To Screen 1",
                style: TextStyle(fontSize: 30, color: Colors.teal),
              ),
              onTap: () => SelectScreen(context,1),
            ),
          ],
        ),
      ),
    );
  }
}
