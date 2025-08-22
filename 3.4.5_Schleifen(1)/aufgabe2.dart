void main(List<String> args) {
  List<int> points = [4, 5, 4, 2, 6, 6, 3];

  double? avg = calculateAvg(points); // 4.285714285714286
  double? avg2 = calculateAvg([]); // Keine Werte in der Liste!

  print(avg ?? 'Keine Werte in der Liste!');
  print(avg2 ?? 'Keine Werte in der Liste!');
}

double? calculateAvg(List<int> list) {
  if (list.length < 1) return null;

  int sum = 0;
  for (int item in list) {
    sum += item;
  }

  return sum / list.length;
}