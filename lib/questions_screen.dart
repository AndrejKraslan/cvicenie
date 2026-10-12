import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'models/answer_button.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onAnswerSelected,
  });

  final QuizQuestion question;
  final int questionNumber;
  final int totalQuestions;
  final ValueChanged<String> onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Quiz')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Otázka $questionNumber z $totalQuestions'),
          const SizedBox(height: 16),
          Text(
            question.text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          ...question.answers.map(
            (answer) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AnswerButton(
                answer: answer,
                onTap: () => onAnswerSelected(answer),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
