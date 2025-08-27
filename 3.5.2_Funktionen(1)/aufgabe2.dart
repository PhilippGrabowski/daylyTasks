const List<String> textExamples = [
  'Erstelle eine void-Funktion mit dem Namen triplePrint, die einen Text als Parameter nimmt und diesen auf der Konsole 3 mal ausgibt.',
  'Rufe die Funktion dann in der main-Funktion mit verschiedenen Werten auf.',
  'Erstelle für deine Lösung ein GitHub-Repository und gib den Link dazu im Antwortfeld ein.'
  ];

void main(List<String> args) {
  for (int i = 2; i >= 0; i--) {
    for (int j = 0; j < 3; j++) {
      print(textExamples[i]);
    }
  }
}

void triplePrint(String text) {
  print(text.trim());
}