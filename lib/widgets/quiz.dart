import 'package:flutter/Material.dart';
import './question.dart';
import './answer.dart';

class QuizLogic extends StatelessWidget {
  const QuizLogic(
      {super.key,
      required this.questionsList,
      required this.questionSelected,
      required this.reply});

  final List<Map<String, Object>> questionsList;
  final int questionSelected;
  final void Function(int) reply;

  bool get hasQuestionSelected {
    return questionSelected < questionsList.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> questions = hasQuestionSelected
        ? questionsList[questionSelected]['answers']
            as List<Map<String, Object>>
        : [];
    return Column(
      children: <Widget>[
        Question(questionsList[questionSelected]['question'].toString()),
        ...questions.map((resp) {
          return Answer(
            resp['answerTitle'] as String,
            () => reply(resp['score'] as int),
          );
        }).toList(),
      ],
    );
  }
}
