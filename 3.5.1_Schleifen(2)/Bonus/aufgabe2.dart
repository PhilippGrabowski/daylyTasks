import 'dart:io';

void main(List<String> args) {
  printNumberPatterns(5); // 1 2 3 4 5 4 3 2 1
  printNumberPatterns(7); // 1 2 3 4 5 6 7 6 5 4 3 2 1
}

void printNumberPatterns(int number) {
  if (number < 2) return;
  for (int i = 1; i < number; i++) {
    stdout.write('$i ');
  }
  for (int i = number; i > 0; i--) {
    i == 1 ? stdout.write('$i\n') : stdout.write('$i ');
  }
}