import 'package:flutter/material.dart';

class Window extends StatefulWidget {
  const Window({super.key});

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  int numquestion = 0;
  int score = 0;
  List<String> questions = ["Вы дядя Коля?"];

  void nextQuestion(bool incr) {
    setState(() {
      numquestion++;
      if (incr) score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(numquestion < 1 ? "Вопрос №${numquestion + 1}" : "Результат"),
      content: (score == 1 && numquestion == 1)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/dance-cat.gif",
                  height: 250.0,
                  width: 200.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("🎂🥳 С ДНЕМ РОЖДЕНИЯ! 🎉🎊")
              ],
            )
          : (score < 1 && numquestion == 1)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/shapocka.jpg",
                      height: 200.0,
                      width: 200.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Тогда поздравьте дядю Колю.")
                  ],
                )
              : Text(questions[numquestion]),
      actions: [
        TextButton.icon(
          onPressed: () {
            numquestion < 1 ? nextQuestion(true) : Navigator.of(context).pop();
          },
          label: const Text("ДА"),
          icon: const Icon(Icons.check),
        ),
        if (score < 1)
          TextButton.icon(
            onPressed: () {
              nextQuestion(false);
            },
            label: const Text("НЕТ"),
            icon: const Icon(Icons.close),
          ),
      ],
    );
  }
}
