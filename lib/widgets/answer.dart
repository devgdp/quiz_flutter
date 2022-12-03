import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.answerTitle, this.onSelected, {super.key});

  final String answerTitle;
  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            foregroundColor: Colors.white,
          ),
          onPressed: onSelected,
          child: Text(
            answerTitle,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
