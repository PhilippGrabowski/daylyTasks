import 'dart:io';

const List<List<int>> numbers = [
  [-1, 2, 2, 4, 3, 3, 2],
  [3, 2, 3, 4, 4],
  [-2, 2, 3, 2, 10, 1, -2, -100],
  [-5, 53, 4, 14, 40, 6, 40, 40],
  [3, 2, 3, 4, 5, 6],
];

void main(List<String> args) {
  numbers.forEach((list) => analyzeNumbers(list));
}

void findAndPrintExtreme(List<int> numbers) {
  if (numbers.isEmpty) return;
  final List<int> copyNumbers = List.from(numbers);
  copyNumbers.sort();
  final int min = copyNumbers[0];
  final int max = copyNumbers[numbers.length - 1];
  final List<String> indexPositions = [];
  for (int i = 0; i < 2; i++) {
    int value = i == 0 ? min : max;
    for (int j = 0; j < numbers.length; j++) {
      if (value != numbers[j]) continue;
      indexPositions.add('$j, ');
    }
    indexPositions[indexPositions.length -1] = indexPositions[indexPositions.length -1][0];
    print('Die ${value == min ? 'kleinste' : 'größte'} Zahl ist $value und befindet sich auf ${indexPositions.length == 1 ? 'der Position' : 'den Positionen'} ${indexPositions.join()}');
    indexPositions.clear();
  }
}

void printNumberTypes(List<int> numbers) {
  if (numbers.isEmpty) return;
  final List<int> oddNumbers = numbers.where((number) => number % 2 != 0).toList();
  final List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  final List<int> positiveNumbers = numbers.where((number) => number >= 0).toList();
  final List<int> negativeNumbers = numbers.where((number) => number < 0).toList();

  stdout.write('Anzahl gerade Zahlen: ${evenNumbers.length}, ');
  stdout.write('Anzahl ungerade Zahlen: ${oddNumbers.length}, ');
  stdout.write('Anzahl positive Zahlen: ${positiveNumbers.length}, ');
  stdout.write('Anzahl negative Zahlen: ${negativeNumbers.length}\n');
}

void printDistribution(List<int> numbers) {
  if (numbers.isEmpty) return;
  final Set<dynamic> set = List.from(numbers).toSet();
  final Map<int, int> amount = {};
  for (int number in set) {
    List<int> nums = numbers.where((listElement) => listElement == number).toList();
    amount[number] = nums.length;
  }
  amount.forEach((key, value) => print('Die Zahl $key kommt ${value}mal in der Liste vor.'));
}

void analyzeNumbers(List<int> numbers) {
  if (numbers.isEmpty) {
  print('Keine Zahlen in der Liste.');
  return;
  }
  findAndPrintExtreme(numbers);
  printNumberTypes(numbers);
  printDistribution(numbers);
}