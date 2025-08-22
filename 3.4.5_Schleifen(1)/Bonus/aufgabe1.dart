void main(List<String> args) {
  List<String> names = ['Julietta', 'Benjamino', 'Hans-Günther', 'Evalinea', 'Fiona', 'Gregory', 'Leonhart'];
  List<int> points = [4, 5, 4, 2, 6, 6, 3];

  List<Map<String, int>>? mapList = createListMap(names, points); 
  // [{Julietta: 4}, {Benjamino: 5}, {Hans-Günther: 4}, {Evalinea: 2}, {Fiona: 6}, {Gregory: 6}, {Leonhart: 3}]
  List<Map<String, int>>? mapList2 = createListMap(names, [1, 2, 3]); 
  // Map-List Erstellung nicht möglich!

  print(mapList ?? 'Map-List Erstellung nicht möglich!');
  print(mapList2 ?? 'Map-List Erstellung nicht möglich!');
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
