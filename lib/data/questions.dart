class QuizQuestion {
  const QuizQuestion({
    required this.text,
    required this.answers,
    required this.correctAnswer,
  });

  final String text;
  final List<String> answers;
  final String correctAnswer;
}

const quizQuestions = <QuizQuestion>[
  QuizQuestion(
    text: 'Aký programovací jazyk sa používa na vývoj aplikácií vo Flutteri?',
    answers: ['Kotlin', 'Dart', 'Swift', 'JavaScript', 'Python'],
    correctAnswer: 'Dart',
  ),
  QuizQuestion(
    text: 'Ktorá funkcia sa zvyčajne používa na spustenie Flutter aplikácie?',
    answers: ['startApp()', 'init()', 'main()', 'runFlutter()', 'build()'],
    correctAnswer: 'main()',
  ),
  QuizQuestion(
    text: 'Ktorý widget slúži na usporiadanie detí pod seba?',
    answers: ['Row', 'Stack', 'Scaffold', 'Column', 'Container'],
    correctAnswer: 'Column',
  ),
  QuizQuestion(
    text: 'Čo spôsobí volanie setState() v stavovom widgete?',
    answers: [
      'Zatvorí aplikáciu',
      'Znovu vykreslí používateľské rozhranie',
      'Vytvorí novú obrazovku',
      'Uloží dáta do databázy',
      'Reštartuje zariadenie',
    ],
    correctAnswer: 'Znovu vykreslí používateľské rozhranie',
  ),
  QuizQuestion(
    text: 'Ktorý widget je určený na zobrazenie textu?',
    answers: ['Text', 'Label', 'Paragraph', 'StringView', 'Typography'],
    correctAnswer: 'Text',
  ),
];
