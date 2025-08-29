import 'dart:io';

List<String> actions = [
  '- Aufgaben hinzufügen (add <beschreibung>)',
  '- Aufgaben anzeigen (list)',
  '- Aufgaben hinzufügen (done <nummer>)',
  '- Das Programm beenden (exit)'
];
bool editToDos = true;
final List<String> toDos = [];
final Map<int, bool> toDoStatus = {};

void main(List<String> args) {
  startToDo();
}

void startToDo() {
  welcomeUser();
  showMenu();
  editToDoList();
}

void welcomeUser() {
  addBlankLine();
  print('Willkommen bei deiner ToDo-Liste. Bearbeite deine ToDo\'s');
  addBlankLine();
}

void showMenu() {
  for(String action in actions) {
    print(action);
  }
  addBlankLine();
}

void editToDoList() {
  while (editToDos) {
    String input = stdin.readLineSync() ?? '';
    executeNextAction(input);
  }
  print('Tschüss!');
}

void executeNextAction(String input) {
  if (inputWasExit(input)) {
    exitProgram();
  } else if (inputWasAdd(input)) {
    addToDo(input);
  } else if (inputWasList(input)) {
    showToDoList();
  } else if (inputWasDone(input)) {
    markToDoAsComplete(input);
  } else {
    print('Ungültige Eingabe! Try again.');
  }
}

void addToDo(String input) {
  String toDo = trimString(getSubstring(trimString(input), 4));
  if (inputIsEmpty(toDo)) {
    print('Ungültige Eingabe! Try again.');
    return;
  } else {
    addToList(toDo);
  }
}

void addToList(String toDo) {
  toDos.add(toDo);
  toDoStatus[getLength(null, toDos)] = false;
  print('Aufgabe hinzugefügt: $toDo');
  addBlankLine();
}

void markToDoAsComplete(String input) {
  String toDoNumber = getSubstring(trimString(input), 5);
  int? number = int.tryParse(toDoNumber);
  if (inputIsEmpty(toDoNumber) || inputWasNotAValidNumber(number)) {
    print('Ungültige Eingabe! Try again.');
    return;
  } else {
    changeToDoStatus(number!);
  }
}

void changeToDoStatus(int number) {
  toDoStatus[number] = true;
  print('Abgehakt: $number: ${toDos[number - 1]}');
  addBlankLine();
}

void showToDoList() {
  if (listIsEmpty()) {
    print('Keine ToDo\'s in der Liste');
  }
  for (int i = 0; i < getLength(null, toDos); i++) {
    print('[${toDoStatus[i + 1] == true ? 'x' : ' '}] ${getLength(null, toDos)}. ${toDos[i]}');
  }
  addBlankLine();
}

void exitProgram() => editToDos = false;

bool inputWasExit(String input) => trimString(input) == 'exit';

bool inputWasAdd(String input) => getSubstring(trimString(input), 0, 3) == 'add';

bool inputWasList(String input) => trimString(input) == 'list';

bool inputWasDone(String input) => getSubstring(trimString(input), 0, 4) == 'done';

bool inputIsEmpty(String input) => getLength(input) == 0;

bool inputWasNotAValidNumber(int? number) => number == null || getLength(null, toDos) < number || number < 0;

bool listIsEmpty() => getLength(null, toDos) == 0;

void addBlankLine() => print(' ');



//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< String Funktionen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><
String trimString(String text) {
  List<String> chars = [];
  bool firstChar = false;
  for (int i = 0; i < getLength(text); i++) {
    if (text[i] == ' ' && !firstChar) {
      continue;
    } else {
      firstChar ? () : firstChar = true;
      chars.add(text[i]); 
    }
  }

  List<String> chars2 = [];
  firstChar = false;
  for (int i = getLength(null, chars) - 1; i >= 0; i--) {
    if (chars[i] == ' ' && !firstChar) {
      continue;
    } else {
      firstChar ? () : firstChar = true;
      chars2.insert(0, chars[i]); 
    }
  }
  String trimString = '';
  chars.forEach((char) => trimString = trimString + char);
  return trimString;
}

int getLength([String? text, List<String>? chars]) {
  int length = 0;
  String? char;
  while(true) {
    try {
      if (text != null) char = text[length];
      if (chars != null) char = chars[length];
      length++;
    } catch (e) {
      break;
    }
  }
  return length;
}

String getSubstring(String text, int start, [int? end]) {
  List<String> chars = [];
  for (int i = start; i < (end ?? getLength(text)); i++) {
    chars.add(text[i]);
  }
  String substring = '';
  chars.forEach((char) => substring = substring + char);
  return substring;
}
