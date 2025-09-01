class WordToNumber {
  final Map<String, int> mapNumbers = {
    'eins': 1,
    'zwei': 2,
    'drei': 3,
    'vier': 4,
    'fünf': 5,
    'sechs': 6,
    'sieben': 7,
    'acht': 8,
    'neun': 9,
    'zehn': 10,
    'elf': 11,
    'zwölf': 12,
    'dreizehn': 13,
    'vierzehn': 14,
    'fünfzehn': 15,
    'sechzehn': 16
  };

  List<String> get words {
    return mapNumbers.keys.toList();
  }

  int getNumber(String key) {
    return mapNumbers[key]!;
  }
}
