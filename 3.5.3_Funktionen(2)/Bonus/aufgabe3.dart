import 'dart:math';

final random = Random();

void main(List<String> args) {
  List<List<int>> randomNumList = generateListOfRandomNumLists(3);
  for (List<int> randomNums in randomNumList) {
    print(randomNums);
    print('Die Summe ist ${calculateSum(randomNums)}.');
  }
}

int calculateSum(List<int> numbers) {
  return numbers.reduce((a, b) => a + b);
}

List<int> generateListOfRandomNums(int amount) {
  List<int> randomNums = [];
  for (int i = 0; i < amount; i++) {
    randomNums.add(random.nextInt(31));
  }
  return randomNums;
}

List<List<int>> generateListOfRandomNumLists(int amount) {
  if (amount < 1 && amount > 10) return [];
  List<List<int>> randomNumList = [];
  for (int i = 0; i < amount; i++) {
    randomNumList.add(generateListOfRandomNums(random.nextInt(11 + 1)));
  }
  return randomNumList;
}