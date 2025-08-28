import 'dart:math';
import 'dart:io';

void main(List<String> args) {
  List<List<int>> randomNumList = generateListOfRandomNumLists(3);
  for (List<int> randomNums in randomNumList) {
    stdout.write('Die Summe aus ${randomNums.join(', ')} ist: ');
    stdout.write('${calculateSum(randomNums[0], randomNums[1], randomNums[2])}\n');
  }
}

int calculateSum(int num1, int num2, int num3) {
  return num1 + num2 + num3;
}

List<int> generateListOfThreeRandomNums() {
  final random = Random();
  List<int> randomNums = [];
  for (int i = 0; i < 3; i++) {
    randomNums.add(random.nextInt(31));
  }
  return randomNums;
}

List<List<int>> generateListOfRandomNumLists(int amount) {
  if (amount < 1 && amount > 10) return [];
  List<List<int>> randomNumList = [];
  for (int i = 0; i < amount; i++) {
    randomNumList.add(generateListOfThreeRandomNums());
  }
  return randomNumList;
}