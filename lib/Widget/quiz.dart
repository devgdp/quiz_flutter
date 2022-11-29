// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/Material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> answers;
  final int questionsSelected;
  final void Function(int) responder;

  const Quiz({
    super.key,
    required this.answers,
    required this.questionsSelected,
    required this.responder,
  });

  bool get hasQuestionSelected {
    return questionsSelected < answers.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> questions = hasQuestionSelected
        ? answers[questionsSelected]['reply'] as List<Map<String, Object>>
        : [];
    return Column(
      children: <Widget>[
        Question(answers[questionsSelected]['title'].toString()),
        ...questions.map((resp) {
          return Answer(
            resp['title'] as String,
            () => responder(resp['score'] as int),
          );
        }).toList(),
      ],
    );
  }
}
