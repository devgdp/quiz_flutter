import 'dart:math';

import 'package:flutter/material.dart';
import './widgets/quiz.dart';
import './widgets/result.dart';

void main() => runApp(const Quiz());

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _questionSelected = 0;
  int _scoreTotal = 0;
  final questionsList = [
    {
      'question': 'Qual é seu animal preferido?',
      'answers': [
        {'answerTitle': 'Gato', 'score': Random().nextInt(30)},
        {'answerTitle': 'Cachorro', 'score': Random().nextInt(30)},
        {'answerTitle': 'Leão', 'score': Random().nextInt(30)},
        {'answerTitle': 'Zebra', 'score': Random().nextInt(30)},
        {'answerTitle': 'Elefante', 'score': Random().nextInt(30)},
      ],
    },
    {
      'question': 'Qual e sua cor favorita?',
      'answers': [
        {'answerTitle': 'Preto', 'score': Random().nextInt(30)},
        {'answerTitle': 'Azul', 'score': Random().nextInt(30)},
        {'answerTitle': 'Vermelho', 'score': Random().nextInt(30)},
        {'answerTitle': 'Verde', 'score': Random().nextInt(30)},
        {'answerTitle': 'Branco', 'score': Random().nextInt(30)},
      ],
    },
    {
      'question': 'Quantos anos você tem?',
      'answers': [
        {'answerTitle': '5 - 10', 'score': Random().nextInt(30)},
        {'answerTitle': '10 - 15', 'score': Random().nextInt(30)},
        {'answerTitle': '15 - 20', 'score': Random().nextInt(30)},
        {'answerTitle': '20 - 25', 'score': Random().nextInt(30)},
        {'answerTitle': '25 - 30', 'score': Random().nextInt(30)},
      ],
    },
  ];

  bool get hasQuestionSelected {
    return _questionSelected < questionsList.length;
  }

  void _reply(int score) {
    setState(() {
      if (hasQuestionSelected) {
        _questionSelected++;
        _scoreTotal += score;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionSelected = 0;
      _scoreTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          centerTitle: true,
          backgroundColor: Colors.blue[700],
          title: const SizedBox(
            child: Text(
              'Quiz',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ),
        body: hasQuestionSelected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuizLogic(
                      questionsList: questionsList,
                      questionSelected: _questionSelected,
                      reply: _reply),
                ],
              )
            : Result(_scoreTotal, _restartQuiz),
      ),
    );
  }
}
