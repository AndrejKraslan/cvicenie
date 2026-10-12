# Flutter Quiz

Jednoduchá Flutter aplikácia s piatimi otázkami o Flutteri. Odpovede sa
premiešajú pri každom spustení kvízu. Po výbere odpovede sa zobrazí ďalšia
otázka a na konci výsledok s prehľadom odpovedí.

## Spustenie

V koreňovom priečinku projektu spusti:

```bash
flutter pub get
flutter run
```

## Štruktúra

- `lib/data/questions.dart` – otázky a správne odpovede
- `lib/models/answer_button.dart` – tlačidlo odpovede
- `lib/quiz.dart` – stav a riadenie obrazoviek kvízu
- `lib/start_screen.dart` – úvodná obrazovka
- `lib/questions_screen.dart` – otázky a odpovede
- `lib/results_screen.dart` – výsledky
- `lib/questions_summary.dart` – prehľad odpovedí

Testy spustíš príkazom `flutter test`.
