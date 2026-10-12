import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.questions,
    required this.userAnswers,
    required this.onRestart,
  });

  final List<QuizQuestion> questions;
  final List<String?> userAnswers;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    var correctCount = 0;
    for (var index = 0; index < questions.length; index++) {
      if (userAnswers[index] == questions[index].correctAnswer) {
        correctCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Výsledok')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Správne odpovede: $correctCount z ${questions.length}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          QuestionsSummary(questions: questions, userAnswers: userAnswers),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: onRestart,
            child: const Text('Spustiť znova'),
          ),
        ],
      ),
    );
  }
}
