// Aufgabe A)
enum Weekday { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void main(List<String> args) {
  printDayMood(Weekday.monday); // Montage und Dienstage sind anstrengend
  printDayMood(Weekday.tuesday); // Montage und Dienstage sind anstrengend
  printDayMood(Weekday.wednesday); // Mittwoch und Donnerstag ist ok
  printDayMood(Weekday.thursday); // Mittwoch und Donnerstag ist ok
  printDayMood(Weekday.friday); // Freitag ist super
  printDayMood(Weekday.saturday); // Wochenende ist genial
  printDayMood(Weekday.sunday); // Wochenende ist genial

  Weekday? weekday;
  printDayMood(weekday); // Kein Tag ausgewählt
}

printDayMood(Weekday? weekday) {
  switch (weekday) {
    case Weekday.monday:
    case Weekday.tuesday:
      print('Montage und Dienstage sind anstrengend');
    case Weekday.wednesday:
    case Weekday.thursday:
      print('Mittwoch und Donnerstag ist ok');
    case Weekday.friday:
      print('Freitag ist super');
    case Weekday.saturday:
    case Weekday.sunday:
      print('Wochenende ist genial');
    default:
      print('Kein Tag ausgewählt');
  }
}

/*
Aufgabe B)

Ich bevorzuge hier die Switch-Case Variante, weil: 
  - es übersichtlerer ist
  - leichterer lesbar als eine if-else Kette
  - weniger fehleranfällig durch strukturierten Aufbau mit default-Fall
*/
