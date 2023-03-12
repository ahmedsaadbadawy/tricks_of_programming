import 'package:flutter/material.dart';
import 'package:flutter_application_3/test.dart';
import 'age.dart';
class LessonTwo extends StatefulWidget {
  const LessonTwo({super.key});

  @override
  State<StatefulWidget> createState() => _LessonTwoState();
}

class _LessonTwoState extends State<LessonTwo> {
  TextStyle s = TextStyle(
    color: Colors.green,
    fontSize: 25,
  );
  bool passwordvisible = true;
  var mycontroller = TextEditingController();
  int str = 0;
  var c = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: const Icon(
          Icons.center_focus_weak_sharp,
          color: Colors.green,
        ),
        title: const Text('Saad\'s Home Page 2'),
        actions: const [
          Icon(Icons.center_focus_weak_sharp),
          Icon(Icons.center_focus_weak_sharp),
          Icon(Icons.center_focus_weak_sharp),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Input your Birth Year",
                hintStyle: TextStyle(fontSize: 15),
                labelText: "Birth Year",
                labelStyle: TextStyle(fontSize: 33),
              ),
              keyboardType: TextInputType.number,
              controller: mycontroller,
              style: TextStyle(color: Colors.blue, fontSize: 20, height: 1.5),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your Password",
                hintStyle: const TextStyle(fontSize: 12),
                labelText: "Password",
                labelStyle: const TextStyle(fontSize: 33),
                suffixIcon: IconButton(
                  icon: Icon(passwordvisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passwordvisible = !passwordvisible;
                    });
                  },
                ),
              ),
              style: const TextStyle(
                  color: Colors.blue, fontSize: 20, height: 1.5),
              keyboardType: TextInputType.visiblePassword,
              obscureText: passwordvisible,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Text(
              "your Age is $str Years Old",
              style: const TextStyle(fontSize: 22, color: Colors.blue),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => setState(() {
                //str = mycontroller.text;
                Agecalculator(int.parse(mycontroller.text));
                str = Agecalculator.age;
              }),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text(
                "Get Value",
                style: TextStyle(fontSize: 30),
                selectionColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
             //Text("Hey",style: s,),
             MyText("Hey",s),
          ),
          const SizedBox(height: 20),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            c = Colors.teal;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

