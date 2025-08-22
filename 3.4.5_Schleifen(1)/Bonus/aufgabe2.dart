void main(List<String> args) {
  List<String> names = ['Julietta', 'Benjamino', 'Hans-Günther', 'Evalinea', 'Fiona', 'Gregory', 'Leonhart'];
  List<int> points = [4, 5, 4, 2, 6, 6, 3];

  List<Map<String, int>>? mapList = createListMap(names, points);

  if (mapList != null) {
    printNames(mapList);
    printPoints(mapList);
    printNamesAndPoints(mapList);
  }

  
}

List<Map<String, int>>? createListMap(List<String> list1, List<int> list2) {
  if (list1.length != list2.length || list1.isEmpty && list2.isEmpty) return null;

  List<Map<String, int>> mapList = [];

  for (int i = 0; i < list1.length; i++) {
    String key = list1[i];
    int value = list2[i];

    mapList.add({key: value});
  }

  return mapList;
}

void printNames(List<Map<String, int>> mapList) {
  for (Map<String, int> item in mapList) {
    String name = item.keys.toString();
    print(name.substring(1, name.length -1));
  }
}

void printPoints(List<Map<String, int>> mapList) {
  for (Map<String, int> item in mapList) {
    String points = item.values.toString();
    print(points.substring(1, points.length -1));
  }
}

void printNamesAndPoints(List<Map<String, int>> mapList) {
  for (Map<String, int> item in mapList) {
    String name = item.keys.toString();
    String points = item.values.toString();
    print('${name.substring(1, name.length -1)}: ${points.substring(1, points.length -1)}');
  }
}