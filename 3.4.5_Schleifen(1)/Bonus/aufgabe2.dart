void main(List<String> args) {
  List<String> names = ['Julietta', 'Benjamino', 'Hans-Günther', 'Evalinea', 'Fiona', 'Gregory', 'Leonhart'];
  List<int> points = [4, 5, 4, 2, 6, 6, 3];

  Map<String, int>? map = createMap(names, points);

  if (map != null) {
    printNames(map);
    printPoints(map);
    printNamesAndPoints(map);
  }

  
}

Map<String, int>? createMap(List<String> list1, List<int> list2) {
  if (list1.length != list2.length || list1.isEmpty) return null;

  Map<String, int> result = {};
  int index = 0;
  for (var key in list1) {
    result[key] = list2[index];
    index++;
  }
  return result;
}

void printNames(Map<String, int> map) {
  List<String> names = map.keys.toList();

  for (String name in names) {
    print(name);
  }
}

void printPoints(Map<String, int> map) {
  List<int> points = map.values.toList();

  for (int point in points) {
    print(point);
  }
}

void printNamesAndPoints(Map<String, int> map) {
  List<String> names = map.keys.toList();
  List<int> points = map.values.toList();

  for (int i = 0; i < names.length; i++) {
    print('${names[i]}: ${points[i]}');
  }
}