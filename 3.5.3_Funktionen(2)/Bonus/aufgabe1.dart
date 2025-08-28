import 'dart:math';
import 'dart:io';

void main(List<String> args) {
  List<List<int>> randomNumList = generateListOfRandomNumLists(3);
  for (List<int> randomNums in randomNumList) {
    print(randomNums);
    print('Die höchste Zahl ist ${isBigger(randomNums[0], randomNums[1])}.');
  }
}

int isBigger(int num1, int num2) {
  return num1 > num2 ? num1 : num2;
}

List<int> generateListOfTwoRandomNums() {
  final random = Random();
  List<int> randomNums = [];
  for (int i = 0; i < 2; i++) {
    randomNums.add(random.nextInt(31));
  }
  return randomNums;
}

List<List<int>> generateListOfRandomNumLists(int amount) {
  if (amount < 1 && amount > 10) return [];
  List<List<int>> randomNumList = [];
  for (int i = 0; i < amount; i++) {
    randomNumList.add(generateListOfTwoRandomNums());
  }
  return randomNumList;
}