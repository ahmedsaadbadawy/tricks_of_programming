import 'package:flutter/material.dart';
import 'package:flutter_application_4/info.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      title: "Flutter App",
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color b = Colors.blue;
  Color g = Colors.green;
// when you call an item from (list) it will perform it to all the list.
  final List<Info> li = [
    Info(name: "Ahmed Saad Badawy", height: 182, date: DateTime.now()),
    Info(name: "Mohamed Saad Badawy", height: 185, date: DateTime.now()),
  ];

  void x(BuildContext ctx) {
    // the (showBottomSheet) is something show up when you press on button.
    // it must be in stateless widget.
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          // the (ListView) = column but here you can scroll on the screen.
          //the (ListView.builder) = Listview but here the items whitch be loaded
          //is items whitch show up on screen but here there's no children.

          return ListView.builder(
            //the count of items in card.
            itemCount: li.length,
            //(ctx) we wrote it as (context),and (i) for (indexes) in the list.
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: const Color.fromARGB(255, 39, 4, 108),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            li[i].name,
                            style: TextStyle(color: b, fontSize: 25, height: 2),
                          ),
                          Text(
                            "${li[i].height}",
                            style: TextStyle(color: b, fontSize: 25),
                          ),
                        ],
                      ),
                      Text(
                        DateFormat('yy/MMM/dd').format(li[i].date),
                        style: TextStyle(color: b, fontSize: 25, height: 2),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  DateTime _selectedDate = DateTime.now();
  void _datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990, 1, 1),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "The 2nd App",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(
              "https://media.licdn.com/dms/image/D4D12AQGDtWEy4e0cVA/article-inline_image-shrink_1000_1488/0/1657811912984?e=1683158400&v=beta&t=qJS6i36oI_eRkin-smtXC7tYA4l6vsyVaEqM-mTVGm0",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: ElevatedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: _datePicker,
              child: Text(
                DateFormat.yMMMd().format(_selectedDate),
                style: const TextStyle(fontSize: 22),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => x(context),
      ),
    );
  }
}
