import 'dart:math';
import 'dart:io';

void main(List<String> args) {
  List<int> randomNums = generateListOfThreeRandomNums();
  for (int num in randomNums) {
    print('Die Zahl $num ist ${numIsEven(num) ? 'gerade' : 'ungerade'}.');
  }
}

bool numIsEven(int num) {
  return num % 2 == 0;
}

List<int> generateListOfThreeRandomNums() {
  final random = Random();
  List<int> randomNums = [];
  for (int i = 0; i < 2; i++) {
    randomNums.add(random.nextInt(31));
  }
  return randomNums;
}