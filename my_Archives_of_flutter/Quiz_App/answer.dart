import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String AnswerText;

  Answer(this.x, this.AnswerText);
  final Function() x;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 70.0,
      margin: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: x,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)))),
        child: Text(
          AnswerText,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

