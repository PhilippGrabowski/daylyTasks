void main(List<String> args) {
    print(correctBracketsSequence('())()(()'));
}

bool correctBracketsSequence(String text) {
  List<String> chars = text.split('');
  int counter = 0;
  for (int i = 0; i < chars.length; i++) {
    if (chars[i] == '(') {
      counter++;
    } else {
      if (chars[i] == ')') {
        if(--counter < 0) return false;
      }
    }
    if (i == chars.length - 1 && counter > 0) return false;
  }
  return true;
}