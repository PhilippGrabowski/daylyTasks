enum Sex { male, female }

void main(List<String> args) {
  printAvgHeight(Sex.male.name, 21); // Im Schnitt 181,4m.
  printAvgHeight(Sex.male.name, 27); // Im Schnitt 181,3m.
  printAvgHeight(Sex.male.name, 30); // Im Schnitt 180,4m.
  printAvgHeight(Sex.male.name, 16); // Keine Durchschnittsgröße bekannt.
  printAvgHeight(Sex.female.name, 24); // Im Schnitt 167,5m
  printAvgHeight(Sex.female.name, 25); // Im Schnitt 167,3m
  printAvgHeight(Sex.female.name, 32); // Im Schnitt 167,2m
  printAvgHeight(Sex.female.name, 44); // Keine Durchschnittsgröße bekannt.
}

void printAvgHeight(String sex,  age) {
  if (age <= 0) return;
  
  switch (sex) {
    case 'male':
      switch (age) {
        case >= 20 && < 25:
          print('Im Schnitt 181,4m.');
        case >= 25 && < 30:
          print('Im Schnitt 181,3m.');
        case >= 30 && < 35:
          print('Im Schnitt 180,4m.');
        default:
          print('Keine Durchschnittsgröße bekannt.');
      }
    case 'female':
      switch (age) {
        case >= 20 && < 25:
          print('Im Schnitt 167,5m.');
        case >= 25 && < 30:
          print('Im Schnitt 167,3m.');
        case >= 30 && < 35:
          print('Im Schnitt 167,2m.');
        default:
          print('Keine Durchschnittsgröße bekannt.');
      }
  }
}

/*
In der Aufgabe steht „zwischen Alter X und Alter Y“. Wörtlich verstanden würde dies die Randwerte X und Y ausschließen, sodass z. B. die Altersangaben 20, 25, 30 und 35 nicht erfasst wären. Um eine lückenlose Abdeckung sicherzustellen, habe ich die Intervalle so interpretiert, dass jeweils die Untergrenze (X) inbegriffen ist.
*/