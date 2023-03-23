import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function() q;
  final int resultScore;
  const Result(this.q, this.resultScore);
  String get resultPhrase {
    String resultText;
    if (resultScore == 10)
      resultText = "Excellent !";
    else if (resultScore < 5)
      resultText = "Not Bad";
    else
      resultText = "Very Bad !";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text(
          "Done !",
          style: TextStyle(
              fontSize: 45, color: Colors.teal, fontWeight: FontWeight.bold),
        ),
        Text(
          resultPhrase,
          style: const TextStyle(
              fontSize: 45, color: Colors.teal, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: q,
          child: const Text(
            "Restart The App",
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
        )
      ],
    ));
  }
}

