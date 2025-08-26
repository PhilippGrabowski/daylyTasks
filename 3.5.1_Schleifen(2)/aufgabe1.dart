void main(List<String> args) {
  for (int i = 1; i < 101; i++) {
    if (i < 10) {
      print('Kleine Zahl: $i');
    } else if (i < 60) {
      print('Mittlere Zahl: $i');
    } else {
      print('Große Zahl: $i');
    }
  }
}