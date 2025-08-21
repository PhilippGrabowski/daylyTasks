void main(List<String> args) {
  List<Map<String, double?>> weatherData = [
    {'temp': 5.3, 'rain': 0.9, 'wind': null},
    {'temp': 4.5, 'rain': null, 'wind': 16.8},
    {'temp': null, 'rain': 3.8, 'wind': null},
  ];

    List<Map<String, double?>> weatherData2 = [
    {'temp': null, 'rain': 2.9, 'wind': 34.0},
    {'temp': null, 'rain': 1.5, 'wind': 16.8},
    {'temp': null, 'rain': 3.8, 'wind': 5.8},
  ];

  calculateAvgValues(weatherData); 
  // Durchschnittstemperatur: 5 °C; Niederschlagsmenge: 2.4 mm; Windgeschwindigkeit: 16.8 km/h
  calculateAvgValues(weatherData2); 
  // Durchschnittstemperatur: Keine Daten vorhanden; Niederschlagsmenge: 2.7 mm; Windgeschwindigkeit: 18.87 km/h
}

void calculateAvgValues(List<Map<String, double?>> data) {
  if (data.isEmpty) return;

  List<String> weatherParameters = data[0].keys.toList();
  for (String parameter in weatherParameters) {
    double? avg = getAvgOfWeatherParameter(parameter, data);
    printAvgOfParameter(parameter, avg);
  }
}

double? getAvgOfWeatherParameter(String parameter, List<Map<String, double?>> weatherData) {
  List<double> validValues = getValidValues(parameter, weatherData);
  if (validValues.isEmpty) return null;
  double avg = (validValues.reduce((a, b) => a + b)) / validValues.length;
  return avg;
}

List<double> getValidValues(String parameter, List<Map<String, double?>> weatherData) {
  List<double?> valuesOfParameter = weatherData.map((e) => e[parameter]).toList();
  List<double> filteredValidValues = valuesOfParameter.whereType<double>().toList();
  return filteredValidValues;
}

void printAvgOfParameter(String parameter, double? avg) {
  if (parameter == 'temp') {
    print('Durchschnittstemperatur: ${avg != null ? avg.toStringAsFixed(0) + ' °C' : 'Keine Daten vorhanden'}');
  } else if (parameter == 'rain') {
    print('Niederschlagsmenge: ${avg != null ? avg.toStringAsFixed(1) + ' mm' : 'Keine Daten vorhanden'}');
  } else if (parameter == 'wind') {
    print('Windgeschwindigkeit: ${avg != null ? avg.toStringAsFixed(2) + ' km/h' : 'Keine Daten vorhanden'}');
  }
}