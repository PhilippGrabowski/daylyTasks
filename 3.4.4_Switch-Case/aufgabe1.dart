// Aufgabe A)
enum Weekday {monday, tuesday, wednesday, thursday, friday, saturday, sunday}

void main(List<String> args) {
  Weekday? weekday;

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