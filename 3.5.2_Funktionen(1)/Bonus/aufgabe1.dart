import 'dart:math';

void main(List<String> args) {
  final random = Random();
  for (int i = 0; i < 5; i++) {
    int randomMinutes = random.nextInt(600) + 1;
    print(randomMinutes);
    convertMinutesToTime(randomMinutes);
  }
}

void convertMinutesToTime(int minutesInput) {
  if (minutesInput < 1) return;
  int hours = minutesInput ~/ 60;
  int minutes = minutesInput % 60;
  print('$hours Stunden, $minutes Minuten');
}