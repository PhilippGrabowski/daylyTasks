import 'dart:io';

bool editToDos = true;
final List<String> toDos = [];
final Map<int, bool> toDoStatus = {};

void main(List<String> args) {
  startToDo();
}

void startToDo() {
  welcomeUser();
  while (editToDos) {
    showMenu();
    String input = stdin.readLineSync() ?? '';
    executeNextAction(input);
  }
  print('Tschüss!');
}

void showMenu() {
  print('- Aufgaben hinzufügen (add <beschreibung>)');
  print('- Aufgaben anzeigen (list)');
  print('- Aufgaben hinzufügen (done <nummer>)');
  print('- Das Programm beenden (exit)');
  addBlankLine();
}

void executeNextAction(String input) {
  if (trimString(input) == 'exit') {
    exitProgram();
  } else if (getSubstring(trimString(input), 0, 3) == 'add') {
    addTask(input);
  } else if (trimString(input) == 'list') {
    showTaskList();
  } else if (getSubstring(trimString(input), 0, 4) == 'done') {
    markTaskAsComplete(input);
  } else {
    print('Ungültige Eingabe!b Try again.');
  }
}

void addTask(String input) {
  if (getLength(trimString(input)) < 6) return;
  String taskDescription = trimString(getSubstring(trimString(input), 4));
  toDos.add(taskDescription);
  toDoStatus[getLength(null, toDos)] = false;
  print('Aufgabe hinzugefügt: $taskDescription');
  addBlankLine();
}

void markTaskAsComplete(String input) {
  if (getLength(trimString(input)) < 6) return;
  String taskNumber = getSubstring(trimString(input), 5);
  int? number = int.tryParse(taskNumber);
  if (number == null || getLength(null, toDos) < number || number < 0) return;
  toDoStatus[number] = true;
  print('Abgehakt: $number: ${toDos[number - 1]}');
  addBlankLine();
}

void showTaskList() {
  if (getLength(null, toDos) == 0) {
    print('Keine ToDo\'s in der Liste');
  }
  for (int i = 0; i < getLength(null, toDos); i++) {
    print(
      '[${toDoStatus[i + 1] == true ? 'x' : ' '}] ${getLength(null, toDos)}. ${toDos[i]}',
    );
  }
  addBlankLine();
}

void exitProgram() => editToDos = false;

void addBlankLine() => print(' ');

void welcomeUser() {
  addBlankLine();
  print('Willkommen bei deiner ToDo-Liste. Bearbeite deine ToDo\'s');
  addBlankLine();
}

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
