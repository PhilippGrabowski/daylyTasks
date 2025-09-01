import 'dart:io';

const List<String> menu = [
  '1. Neue Vokabel hinzufügen',
  '2. Vokabeln abfragen',
  '3. Beenden'
];
String selectedMenuItem = '0';
final Map<String, String> vocabulary = {};
final List<bool> quizAnswers = [];
bool editMode = true;

void main(List<String> args) {
  startVocabularyCoach();
}

void startVocabularyCoach() {
  printWelcome();
  while(editMode) {
    openMenu();
  }
  exitVocabularyCoach();
}

void openMenu() {
  printMenu();
  selectMenuListItem();
}

void selectMenuListItem() {
  selectedMenuItem = '0';
  final String selectedMenuListItem = getEnteredInput();
  switch (selectedMenuListItem) {
    case '1':
      addVocabulary();
    case '2':
      openVocabularyQuiz();
    default:
      editMode = false;
  }
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Add Vocabulary Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
void addVocabulary() {
  bool addVocabularyMode = true;
  while(addVocabularyMode) {
    selectedMenuItem = '1';
    printInstruction();
    final String vocabulary = getEnteredInput();
    saveVocabulary(vocabulary.toLowerCase());
    addVocabularyMode = continueProcess();
  }
  openMenu();
}

void saveVocabulary(String input) {
  final List<String> memorizedVokabulary = input.split('-');
  if (vocabularyExists(memorizedVokabulary)) {
    addBlankLine();
    print('Dieser Eintag wurde schon gespeichert');
    return;
  }
  vocabulary[memorizedVokabulary[0].trim()] = memorizedVokabulary[1].trim();
  addBlankLine();
  print('Es wurde ein neuer Eintrag: ${memorizedVokabulary[0].trim()} - ${memorizedVokabulary[1].trim()} hinzugefügt.');
}

bool vocabularyExists(List<String> memorizedVokabulary) => vocabulary.keys.toList().contains(memorizedVokabulary[0].trim());

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Add Vocabulary Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
void openVocabularyQuiz() {
  if (vocabulary.length == 0) {
    addBlankLine();
    print('Deine Vokabelliste ist leer. Füge zuerst Einträge hinzu');
    openMenu();
  } else {
    playQuiz();
  }
}

void playQuiz() {
  bool quizMode = true;
  int counter = 0;
  while(quizMode) {
    selectedMenuItem = '2';
    printInstruction(counter);
    answerQuestion(counter);
    counter++;
    quizMode = counter + 1 > vocabulary.length ? false : continueProcess();
  }
  showQuizResult();
  openMenu();
}

void answerQuestion(int counter) {
  String answer = '';
  while(answer.isEmpty) {
    answer = stdin.readLineSync() ?? '';
    if (answer.isEmpty) print('Leere Eingabe ist nicht erlaubt! Try again.');
  }
  checkAnswer(answer.toLowerCase(), counter);
}

void checkAnswer(String answer, int counter) {
  if (correctAnswer(answer, counter)) {
    quizAnswers.add(true);
    print('Deine Antwort war richtig!');
  } else {
    quizAnswers.add(false);
    print('Deine Antwort war falsch! Die richtige Lösung lautet: ${vocabulary.values.elementAt(counter)}');
  }
}

bool correctAnswer(String answer, int counter) => vocabulary.values.elementAt(counter) == answer;

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Process Decision >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
bool continueProcess() {
  addBlankLine();
  selectedMenuItem == '1' ? print('Weiteren Eintrag hinzufügen? [J/N]') : print('Quiz fortsetzen? [J/N]');
  selectedMenuItem = '';
  final String decision = getEnteredInput();
  if (decision.toLowerCase() == 'j') return true;
  return false;
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Input Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
String getEnteredInput() {
  bool invalidInput = true;
  String enteredInput = '';
  while(invalidInput) {
    enteredInput = stdin.readLineSync() ?? '';
    validInput(enteredInput.trim()) ? invalidInput = false : print('Ungültige Eingabe! Try again.');
  }
  return enteredInput.trim();
}

bool validInput(String input) {
  switch (selectedMenuItem) {
    case '0':
      return validMenuListItem(input);
    case '1':
      return validVocabulary(input);
    default:
      return validDecision(input);
  }
}

bool validDecision(String input) => ['j', 'n'].contains(input.toLowerCase());

bool validVocabulary(String input) => input.contains('-') && input.split('-').length == 2 && noEmptyInputs(input);

bool noEmptyInputs(String input) => input.split('-')[0].trim().length > 0 && input.split('-')[1].trim().length > 0;

bool validMenuListItem(String input) => menu.map((item) => item[0]).toList().contains(input);

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Print Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
void printWelcome() {
  addBlankLine();
  print('Willkommen im Vokabel-Trainer.');
  print('Wähle eins der Menu-Punkte durch die Eingabe der entsprechenden Nummer aus.');
}

void printMenu() {
  addBlankLine();
  for (String menuListItem in menu) {
    print(menuListItem);
  }
}

void printInstruction([int? counter]) {
  addBlankLine();
  selectedMenuItem == '1' 
  ? print('Gebe die Vokabel, die du hinzufügen möchtest, folgendermaßen ein: \"Vokabel\" - \"Übersetzung\"')
  : print('Übersetze folgendes: ${vocabulary.keys.elementAt(counter!)}');
}

void showQuizResult() {
  int rightAnswers = quizAnswers.where((answer) => answer == true).toList().length;
  addBlankLine();
  print('Du hast $rightAnswers von ${quizAnswers.length} Vokabeln richtig übersetzt.');
  quizAnswers.clear();
}

void exitVocabularyCoach() {
  addBlankLine();
  print('Der Vokabel-Trainer wird beendet. Bis zum nächsten Mal.');
}

void addBlankLine() => print(' ');