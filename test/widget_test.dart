import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cvicenie/main.dart';

void main() {
  const correctAnswers = <String, String>{
    'Aký programovací jazyk sa používa na vývoj aplikácií vo Flutteri?': 'Dart',
    'Ktorá funkcia sa zvyčajne používa na spustenie Flutter aplikácie?':
        'main()',
    'Ktorý widget slúži na usporiadanie detí pod seba?': 'Column',
    'Čo spôsobí volanie setState() v stavovom widgete?':
        'Znovu vykreslí používateľské rozhranie',
    'Ktorý widget je určený na zobrazenie textu?': 'Text',
  };
  const wrongAnswers = <String, String>{
    'Aký programovací jazyk sa používa na vývoj aplikácií vo Flutteri?':
        'Kotlin',
    'Ktorá funkcia sa zvyčajne používa na spustenie Flutter aplikácie?':
        'startApp()',
    'Ktorý widget slúži na usporiadanie detí pod seba?': 'Row',
    'Čo spôsobí volanie setState() v stavovom widgete?': 'Zatvorí aplikáciu',
    'Ktorý widget je určený na zobrazenie textu?': 'Label',
  };

  testWidgets('kvíz prejde otázkami a zobrazí vyhodnotené odpovede', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const FlutterQuizApp());

    expect(find.text('Flutter Quiz'), findsOneWidget);
    expect(find.text('Začať kvíz'), findsOneWidget);

    await tester.tap(find.text('Začať kvíz'));
    await tester.pumpAndSettle();
    expect(find.byType(OutlinedButton), findsNWidgets(5));

    var firstWrongAnswer = '';
    for (var index = 0; index < correctAnswers.length; index++) {
      final question = correctAnswers.keys.firstWhere(
        (text) => find.text(text).evaluate().isNotEmpty,
      );
      final correctAnswer = correctAnswers[question]!;
      final answer = index == 0 ? wrongAnswers[question]! : correctAnswer;

      await tester.ensureVisible(find.text(answer));
      await tester.tap(find.text(answer));
      await tester.pumpAndSettle();
      if (index == 0) {
        firstWrongAnswer = answer;
      }
      await tester.pumpAndSettle();
    }

    expect(find.text('Správne odpovede: 4 z 5'), findsOneWidget);
    expect(find.text('Tvoja odpoveď: $firstWrongAnswer'), findsOneWidget);
    expect(find.text('Spustiť znova'), findsOneWidget);
  });

  testWidgets('kvíz možno spustiť znova z obrazovky výsledkov', (tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const FlutterQuizApp());
    await tester.tap(find.text('Začať kvíz'));
    await tester.pumpAndSettle();

    for (var index = 0; index < correctAnswers.length; index++) {
      final question = correctAnswers.keys.firstWhere(
        (text) => find.text(text).evaluate().isNotEmpty,
      );
      final answer = correctAnswers[question]!;

      await tester.ensureVisible(find.text(answer));
      await tester.tap(find.text(answer));
      await tester.pumpAndSettle();
    }

    expect(find.text('Správne odpovede: 5 z 5'), findsOneWidget);
    await tester.ensureVisible(find.text('Spustiť znova'));
    await tester.tap(find.text('Spustiť znova'));
    await tester.pumpAndSettle();

    expect(find.text('Otázka 1 z 5'), findsOneWidget);
    expect(find.byType(OutlinedButton), findsNWidgets(5));
  });
}
