void main(List<String> args) {
  String text1 = 'Erstelle eine Funktion, die einen Text als Parameter entgegennimmt und die Anzahl der Zeichen dieses Textes zurückgibt.';
  String text2 = 'Hinweis: Folge den 4 Schritten zum Schreiben einer Funktion aus der Vorlesung.';
  String text3 = 'Erstelle';
  print(vowelsAmountOfString(text1));
  print(vowelsAmountOfString(text2));
  print(vowelsAmountOfString(text3));
}

int vowelsAmountOfString(String text) {
  if (text.trim() == 0) return 0;
  int amount = 0;
  for (int i = 0; i < text.length; i++) {
    if (!['a', 'e', 'i', 'o', 'u'].contains(text[i].toLowerCase())) continue;
    amount++;
  }
  return amount;
}