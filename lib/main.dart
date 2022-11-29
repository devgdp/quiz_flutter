// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import './Widget/quiz.dart';
import './Widget/result.dart';

main() => runApp(QuestionsApp());

class QuestionsApp extends StatefulWidget {
  const QuestionsApp({super.key});
  @override
  State<QuestionsApp> createState() => _QuestionsAppState();
}

class _QuestionsAppState extends State<QuestionsApp> {
  var _questionsSelected = 0;
  var _scoreTotal = 0;
  final _answers = const [
    {
      'title': 'Qual é sua cor favorita?',
      'reply': [
        {'title': 'Preto', 'score': 10},
        {'title': 'Vermelho', 'score': 5},
        {'title': 'Verde', 'score': 3},
        {'title': 'Branco', 'score': 1},
      ],
    },
    {
      'title': 'Qual é seu animal favorito?',
      'reply': [
        {'title': 'Gato', 'score': 10},
        {'title': 'Cachorro', 'score': 5},
        {'title': 'Leão', 'score': 3},
        {'title': 'Coelho', 'score': 1},
      ],
    },
    {
      'title': 'Qual é seu instrutor favorito?',
      'reply': [
        {'title': 'João', 'score': 10},
        {'title': 'Maria', 'score': 5},
        {'title': 'Pedro', 'score': 3},
        {'title': 'Guilherme', 'score': 1},
      ],
    },
  ];

  bool get hasQuestionSelected {
    return _questionsSelected < _answers.length;
  }

  void _responder(int score) {
    setState(() {
      if (hasQuestionSelected) {
        _questionsSelected++;
        _scoreTotal += score;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionsSelected = 0;
      _scoreTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: hasQuestionSelected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Quiz(
                      answers: _answers,
                      questionsSelected: _questionsSelected,
                      responder: _responder),
                ],
              )
            : Result(_scoreTotal, _restartQuiz),
      ),
    );
  }
}
