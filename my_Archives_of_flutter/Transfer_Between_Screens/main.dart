import 'package:flutter/material.dart';
import 'package:flutter_application_5/screen1.dart';
import 'package:flutter_application_5/screen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MyHomePage(),
      initialRoute: '/',
      routes: {
        //('/':(context) => MyHomePage()) = home: MyHomePage()
        '/': (context) => MyHomePage(),
        Screen1.routName: (context) => Screen1(),
        '/x2': (context) => Screen2()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void SelectScreen(BuildContext ctx, int n) {
    Navigator.of(ctx).pushNamed(
      n == 1 ? Screen1.routName : '/x2',
      arguments: {
        'id': n == 1 ? 10 : 20,
        'title': n == 1 ? "info1" : "info2",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Screen"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: ("Screen1"),
              ),
              Tab(
                icon: Icon(Icons.star),
                text: ("Screen2"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Scaffold(
              appBar: AppBar(
                title: Text("part 1"),
              ),
              body: Center(
                child: Text("Text 1"),
              ),
            ),
            Scaffold(
              body: Center(
                child: Text("Text 1"),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              // (InkWell) text you can click on it.
              //must contain child after it.
              // (ListTile) = (InkWell) don't contain child after it.
              ListTile(
                title: const Text(
                  "Go To Screen 1",
                  style: TextStyle(fontSize: 30, color: Colors.teal),
                ),
                subtitle: Text("Go To Screen 1"),
                onTap: () => SelectScreen(context, 1),
              ),
              ListTile(
                title: const Text(
                  "Go To Screen 2",
                  style: TextStyle(fontSize: 30, color: Colors.teal),
                ),
                subtitle: Text("Go To Screen 2"),
                onTap: () => SelectScreen(context, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
