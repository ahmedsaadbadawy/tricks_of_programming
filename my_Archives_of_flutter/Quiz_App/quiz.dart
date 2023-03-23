import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionindex;
  final Function answerQuestions;

  Quiz( this.question,  this.questionindex,  this.answerQuestions);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[questionindex]['questionText'].toString()),

        //Answer(answerQuestions, "Answer 1"),
        //Answer(answerQuestions, "Answer 2"),
        //Answer(answerQuestions, "Answer 3"),
        ...(question[questionindex]['answers'] as List<Map<String, Object>>).map((i) {
          return Answer(()=>answerQuestions(int.parse(i['score'].toString())), i['text'].toString());
        }).toList(),
      ],
    );
  }
}

