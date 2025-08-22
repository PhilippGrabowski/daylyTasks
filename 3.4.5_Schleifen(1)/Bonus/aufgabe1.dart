void main(List<String> args) {
  List<String> names = ['Julietta', 'Benjamino', 'Hans-Günther', 'Evalinea', 'Fiona', 'Gregory', 'Leonhart'];
  List<int> points = [4, 5, 4, 2, 6, 6, 3];

  Map<String, int>? map = createMap(names, points); 
  // {Julietta: 4, Benjamino: 5, Hans-Günther: 4, Evalinea: 2, Fiona: 6, Gregory: 6, Leonhart:3}
  Map<String, int>? map2 = createMap(names, [1, 2, 3]); 
  // Map Erstellung nicht möglich!

  print(map ?? 'Map Erstellung nicht möglich!');
  print(map2 ?? 'Map Erstellung nicht möglich!');
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
