import 'dart:io';

const List<List<int>> grades = [
  [1, 2, 2, 4, 3, 3],
  [3, 2, 3, 4, 4],
  [2, 2, 3, 2, 1, 1],
  [5, 5, 4, 4, 4, 6],
  [3, 2, 3, 4, 5],
];

void main(List<String> args) {
  grades.forEach((list) => analyzeGrades(list));
}

void printGrades(List<int> grades) {
  if (grades.isEmpty) return;
  for (int i = 1; i < grades.length; i++) {
    i == grades.length - 1 ? stdout.write('Note $i: ${grades[i]}\n')
    : stdout.write('Note $i: ${grades[i]}, ');
  }
}

void calculateAndPrintAverage(List<int> grades) {
  if (grades.isEmpty) return;
  final int sum = grades.reduce((a, b) => a + b);
  final String avg = (sum / grades.length).toStringAsFixed(1);
  print('Der Durchschnitt ist: $avg');
}

void analyzeGrades(List<int> grades) {
  printGrades(grades);
  calculateAndPrintAverage(grades);
}