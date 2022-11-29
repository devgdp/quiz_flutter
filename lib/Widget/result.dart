import 'package:flutter/Material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restartQuiz;

  const Result(this.score, this.restartQuiz, {super.key});

  String get resultFinal {
    if (score < 8) {
      return "Você atingiu: $score pontos \nParabéns";
    } else if (score < 12) {
      return "Você atingiu: $score pontos \nVocê é bom";
    } else if (score < 16) {
      return "Você atingiu: $score pontos \nImpressionante";
    } else {
      return "Você atingiu: $score pontos \nLevel GOD";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 200),
            child: Text(
              resultFinal,
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TextButton(
          onPressed: restartQuiz,
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Jogar Novamente"),
        )
      ],
    );
  }
}
