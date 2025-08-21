enum CharacterType { warrior, mage, archer }

enum DayTime { morning, noon, evening, night }

enum Weather { sunny, rainy, stormy }

class Character {
  final CharacterType type;
  final int typeNumber;
  final int combatStrength = 50;

  Character.warrior() : type = CharacterType.warrior, typeNumber = 0;

  Character.mage() : type = CharacterType.mage, typeNumber = 1;

  Character.archer() : type = CharacterType.archer, typeNumber = 2;
}

const List<Map<String, int>> combatStatsOfDayTime = [
  {'type': 0, 'morning': -5, 'noon': 10, 'evening': 5, 'night': -10},
  {'type': 1, 'morning': 10, 'noon': 5, 'evening': -10, 'night': -5},
  {'type': 2, 'morning': 5, 'noon': -10, 'evening': -5, 'night': 10},
];

const List<Map<String, int>> combatStatsOfWeather = [
  {'type': 0, 'sunny': 15, 'rainy': -5, 'stormy': -10},
  {'type': 1, 'sunny': 10, 'rainy': -20, 'stormy': 10},
  {'type': 2, 'sunny': 20, 'rainy': -5, 'stormy': -15},
];

void main(List<String> args) {
  final Character warrior = new Character.warrior();
  final Character mage = new Character.mage();
  final Character archer = new Character.archer();

  calculateWinnerOfFight(warrior, mage, DayTime.evening, Weather.sunny); 
  // Der Sieger ist warrior mit einer Kampfstärke von 70 gegenüber dem mage mit einer Kampfstärke von 50!
  calculateWinnerOfFight(warrior, mage, DayTime.morning, Weather.rainy);
  // Der Kampf zwischen warrior und mage endet unentschieden! Beide haben eine Kampfstärke von 40.
  calculateWinnerOfFight(archer, mage, DayTime.noon, Weather.sunny);
  // Der Sieger ist mage mit einer Kampfstärke von 65 gegenüber dem archer mit einer Kampfstärke von 60!
  calculateWinnerOfFight(warrior, archer, DayTime.night, Weather.stormy);
  // Der Sieger ist archer mit einer Kampfstärke von 45 gegenüber dem warrior mit einer Kampfstärke von 30!
}

void calculateWinnerOfFight(
  Character fighter1,
  Character fighter2,
  DayTime dayTime,
  Weather weather,
) {
  final int combatStrengthFighter1 = calculateCombatStrength(fighter1, dayTime, weather);
  final int combatStrengthFighter2 = calculateCombatStrength(fighter2, dayTime, weather);

  if (combatStrengthFighter1 > combatStrengthFighter2) {
    printResult(fighter1, combatStrengthFighter1, fighter2, combatStrengthFighter2);
  } else if (combatStrengthFighter1 < combatStrengthFighter2) {
    printResult(fighter2, combatStrengthFighter2, fighter1, combatStrengthFighter1);
  } else {
    print(
      'Der Kampf zwischen ${fighter1.type.name} und ${fighter2.type.name} endet unentschieden! Beide haben eine Kampfstärke von $combatStrengthFighter1.',
    );
  }
}

int calculateCombatStrength(Character fighter, DayTime dayTime, Weather weather) {
  int basicCombatStrength = fighter.combatStrength;

  Map<String, int> dayTimeCombatStats = getCombatStatsOfCharacter(combatStatsOfDayTime, fighter);
  int dayTimePowerUp = dayTimeCombatStats[dayTime.name]!;

  Map<String, int> weatherCombatStats = getCombatStatsOfCharacter(combatStatsOfWeather, fighter);
  int weatherPowerUp = weatherCombatStats[weather.name]!;

  return basicCombatStrength + dayTimePowerUp + weatherPowerUp;
}

// Returns combat stats of the character that matches the `typeNumber` of the provided `fighter`.
Map<String, int> getCombatStatsOfCharacter(List<Map<String, int>> combatStats, Character fighter) {
  return combatStats.firstWhere((stats) => stats['type'] == fighter.typeNumber);
}

void printResult(Character winner, int winnerCombatStrength, Character loser, int loserCombatStrength) {
      print(
      'Der Sieger ist ${winner.type.name} mit einer Kampfstärke von $winnerCombatStrength gegenüber dem ${loser.type.name} mit einer Kampfstärke von $loserCombatStrength!',
    );
}
