import 'package:flutter/material.dart';
import 'package:flutter_application_5/answer.dart';
import 'package:flutter_application_5/question.dart';
import 'package:flutter_application_5/quiz.dart';
import 'package:flutter_application_5/result.dart';
import 'question.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionindex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionindex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionindex += 1;
    });

    print(_questionindex);
    print(_totalScore);
    print("Answer Chosen !");
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'What\'s your favourite Color?',
      'answers': [
        {'text': 'black', 'score': 0},
        {'text': 'blue', 'score': 3},
        {'text': 'wgite', 'score': 0},
        {'text': 'green', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s your favourite Animal?',
      'answers': [
        {'text': 'Tiger', 'score': 0},
        {'text': 'Wolf', 'score': 4},
        {'text': 'Lion', 'score': 0},
        {'text': 'Sheeta', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s your favourite Food?',
      'answers': [
        {'text': 'Berger', 'score': 0},
        {'text': 'Pizza', 'score': 0},
        {'text': 'Koshary', 'score': 3},
        {'text': 'Sbagety', 'score': 0},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
        ),
        body: Container(
          child: _questionindex < _question.length
              ? Column(
                  children: [
                    Spacer(),
                    Quiz(_question, _questionindex, answerQuestions),
                    Spacer(),
                  ],
                )
              // When I finish All the Question,
              : Column(
                  children: [
                    Spacer(),
                    Result(_resetQuiz, _totalScore),
                    Spacer(),
                  ],
                ),
        ),
      ),
    );
  }
}

