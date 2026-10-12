import 'dart:math';

import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_screen.dart';
import 'results_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  static const _startScreen = 'start';
  static const _questionsScreen = 'questions';
  static const _resultsScreen = 'results';

  final _random = Random();
  String _currentScreen = _startScreen;
  List<QuizQuestion> _questions = quizQuestions;
  List<String?> _userAnswers = List<String?>.filled(quizQuestions.length, null);
  int _questionIndex = 0;

  void _startQuiz() {
    final questions =
        quizQuestions
            .map(
              (question) => QuizQuestion(
                text: question.text,
                answers: List<String>.of(question.answers)..shuffle(_random),
                correctAnswer: question.correctAnswer,
              ),
            )
            .toList()
          ..shuffle(_random);

    setState(() {
      _questions = questions;
      _userAnswers = List<String?>.filled(questions.length, null);
      _questionIndex = 0;
      _currentScreen = _questionsScreen;
    });
  }

  void _selectAnswer(String answer) {
    setState(() {
      _userAnswers[_questionIndex] = answer;
      if (_questionIndex == _questions.length - 1) {
        _currentScreen = _resultsScreen;
      } else {
        _questionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (_currentScreen) {
      _startScreen => StartScreen(onStart: _startQuiz),
      _questionsScreen => QuestionsScreen(
        question: _questions[_questionIndex],
        questionNumber: _questionIndex + 1,
        totalQuestions: _questions.length,
        onAnswerSelected: _selectAnswer,
      ),
      _resultsScreen => ResultsScreen(
        questions: _questions,
        userAnswers: _userAnswers,
        onRestart: _startQuiz,
      ),
      _ => StartScreen(onStart: _startQuiz),
    };
  }
}
