void main(List<String> args) {
  String text1 = 'Erstelle eine Funktion, die einen Text als Parameter entgegennimmt und die Anzahl der Zeichen dieses Textes zurückgibt.';
  String text2 = 'Hinweis: Folge den 4 Schritten zum Schreiben einer Funktion aus der Vorlesung.';
  String text3 = 'Erstelle für deine Lösung ein GitHub-Repository und gib den Link dazu im Antwortfeld ein.';
  print(characterAmountOfString(text1));
  print(characterAmountOfString(text2));
  print(characterAmountOfString(text3));
}

int characterAmountOfString(String text) {
  return text.trim().length;
}