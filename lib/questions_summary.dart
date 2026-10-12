import 'package:flutter/material.dart';

import 'data/questions.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.questions,
    required this.userAnswers,
  });

  final List<QuizQuestion> questions;
  final List<String?> userAnswers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var index = 0; index < questions.length; index++)
          _buildQuestionResult(index),
      ],
    );
  }

  Widget _buildQuestionResult(int index) {
    final question = questions[index];
    final userAnswer = userAnswers[index] ?? '';
    final isCorrect = userAnswer == question.correctAnswer;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${index + 1}. ${question.text}'),
          Text(
            'Tvoja odpoveď: $userAnswer',
            style: TextStyle(color: isCorrect ? Colors.green : Colors.red),
          ),
          if (!isCorrect)
            Text(
              'Správna odpoveď: ${question.correctAnswer}',
              style: const TextStyle(color: Colors.green),
            ),
        ],
      ),
    );
  }
}
