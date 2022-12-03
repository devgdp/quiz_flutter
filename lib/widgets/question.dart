import 'package:flutter/Material.dart';

class Question extends StatelessWidget {
  const Question(this.questionTitle, {super.key});

  final String questionTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Text(
        questionTitle,
        style: const TextStyle(
          wordSpacing: 10,
          fontSize: 28,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
