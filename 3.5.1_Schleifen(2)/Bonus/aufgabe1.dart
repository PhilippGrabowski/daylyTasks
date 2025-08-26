void main(List<String> args) {
  checkIsPalindrom('otto'); // otto ist ein Palindrom
  checkIsPalindrom('haus'); // haus ist kein Palindrom
  checkIsPalindrom('rentner'); // haus ist kein Palindrom
}

void checkIsPalindrom(String word) {
  for (int i = 0; i < word.length ~/ 2; i++) {
    if (word[i] != word[word.length - 1 - i]) {
      print('$word ist kein Palindrom');
      break;
    }
    if (i == word.length ~/ 2 - 1) {
      print('$word ist ein Palindrom');
    }
  }
}