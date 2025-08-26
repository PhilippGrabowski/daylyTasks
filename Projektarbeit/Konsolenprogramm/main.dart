import 'dart:io';

const List<double> priceList = [0.01, 0.5, 1, 5, 10, 50, 100, 500, 1000, 2500, 5000, 10000, 15000, 25000, 50000, 100000];
final List<double> lostPrices = [];
Map<int, double>? selectedSuitcase;
int round = 0;
String offer = '';
bool deal = false;
bool gameOver = false;


void main(List<String> args) {
  startGame();
}

void startGame(){
  final List<double> randomSortedPriceList = List.from(priceList)..shuffle();
  final Map<int, double> suitcases = generateRandomSuitcases(randomSortedPriceList);
  printGameDescription();
  selectYourSuitcase(suitcases);
  removeSuitcasesPerRound(suitcases);
  gameOver = true;
  printResult();
  restartGame();
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Select Your Suitcase >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
void selectYourSuitcase(Map<int, double> suitcases) {
  print('Wähle einen aus 16 Koffern und gebe die Kofferzahl ein.');
  printAvailableSuitcases(suitcases);
  final int number = enterSuitcaseNumber(suitcases);
  selectedSuitcase = {number: suitcases[number]!};
  print('Du hast den Koffer ${getSuitcaseNumber(number)} ausgewählt.');
  printSelectedSuitcase();
  suitcases[number] = 0;
}

int enterSuitcaseNumber(Map<int, double> suitcases) {
  bool invalidInput = true;
  int? number;
  while(invalidInput) {
    final String enteredSuitcaseNumber = stdin.readLineSync() ?? '';
    number = int.tryParse(enteredSuitcaseNumber);
    invalidInput = checkEnteredSuitcaseNumber(number, suitcases);
  }
  return number!;
}

bool checkEnteredSuitcaseNumber(int? number, Map<int, double> suitcases) {
  if (!invalidSuitcaseNumber(number, suitcases)) return false;
  print('Ungültige Eingabe!');
  return true;
}

bool invalidSuitcaseNumber(int? number, Map<int, double> suitcases) {
  return number == null || notAvailableSuitcaseNumber(number) || suitcaseWasRemoved(number, suitcases);
}

bool notAvailableSuitcaseNumber(int number) {
  return number < 1 || number > priceList.length;
}

bool suitcaseWasRemoved(int number, Map<int, double> suitcases) {
  return suitcases[number] == 0;
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Remove Suitcases >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
void removeSuitcasesPerRound(Map<int, double> suitcases) {
  for (int i = 5; i > 0; i--) {
    printRoundInstruction(i);
    removeSuitcases(suitcases, i);
    printOffer(suitcases);
    final String decision = enterDecision();
    if (decision == 'no deal') continue;
    if (decision == 'deal') {
      deal = true;
      break;
    }
  }
}

void removeSuitcases(Map<int, double> suitcases, int loop) {
  int loopAmount = loop == 5 ? 4 : loop;
  for (int i = 0; i < loopAmount; i++) {
    printInstruction(suitcases, i);
    final int number = enterSuitcaseNumber(suitcases);
    lostPrices.add(suitcases[number]!);
    print('Im Koffer ${getSuitcaseNumber(number)} befand sich ein Preisgeld von ${transformToString(suitcases[number]!)}');
    suitcases[number] = 0;
  }
}

String enterDecision() {
  bool invalidInput = true;
  String decision = '';
  while(invalidInput) {
    decision = stdin.readLineSync() ?? '';
    invalidInput = checkEnteredDecision(decision);
  }
  return decision;
}

bool checkEnteredDecision(String decision) {
  if (!invalidDecision(decision)) return false;
  print('Gebe \"Deal\" oder \"No Deal\" ein!');
  return true;
}

bool invalidDecision(String decision) {
  // if (gameOver) {
  //   return 
  // }
  return decision == '' && decision.trim().toLowerCase() != 'deal' && decision.trim().toLowerCase() != 'no deal';
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Restart Game >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
void restartGame() {
  printRestartQuery();
  final String decision = enterDecision();
  if (decision == 'ende') print('Ende');
  if (decision == 'restart') {
    lostPrices.clear();
    selectedSuitcase = null;
    round = 0;
    offer = '';
    deal = false;
    startGame();
  }
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Print Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
void printGameDescription() {
  addBlankLine();
  print('Willkommen bei Deal or No Deal!');
}

void printOverview(Map<int, double> suitcases) {
  printAvailableSuitcases(suitcases);
  printAvailablePrices(suitcases);
}

void printAvailableSuitcases(Map<int, double> suitcases) {
  addBlankLine();
  suitcases.forEach((key, value) {
    if (key % 4 == 0) {
      printSuitcaseNextLine(key, value);
    } else {
      printSuitcaseInline(key, value);
    }
  });
  addBlankLine();
}

void printSuitcaseNextLine(int suitcaseNumber, double price) {
  print('${price != 0 ? '|${getSuitcaseNumber(suitcaseNumber)}| ' : '____ '}');
}

void printSuitcaseInline(int suitcaseNumber, double price) {
  stdout.write('${price != 0 ? '|${getSuitcaseNumber(suitcaseNumber)}| ' : '____ '}');
}

void printAvailablePrices(Map<int, double> suitcases) {
  addBlankLine();
  final List<double> availablePrices = getAvailablePrices();
  print('In deinem Koffer befindet sich womöglich folgender Gewinn:');
  print(transformToStringList(availablePrices));
  addBlankLine();
}

void printSelectedSuitcase() {
  addBlankLine();
  final int suitcaseNumber = selectedSuitcase!.keys.toList()[0];
  print('|${getSuitcaseNumber(suitcaseNumber)}|');
  addBlankLine();
}

void printRoundInstruction(int loop) {
  int loopAmount = loop == 5 ? 4 : loop;
  loopAmount == 1 ? print('Elemeniere in Runde ${++round} einen Koffer.') 
  : print('Elemeniere in Runde ${++round} der Reihe nach ${loopAmount} Koffer.');
}

void printInstruction(Map<int, double> suitcases, int loop) {
  printAvailableSuitcases(suitcases);
  print('Wähle den ${atomicNumber(loop)} Koffer und gebe die entsprechende Kofferzahl ein.');
  addBlankLine();
}

void printOffer(Map<int, double> suitcases) {
  printOverview(suitcases);
  addBlankLine();
  print('Die Runde $round ist zu Ende. Der Banker macht dir ein Angebot!');
  calculateOffer();
  print('Das Angebot lautet $offer!\nMöchtest du den Deal annehmen? Antworte mit \"Deal\" oder \"No Deal\"');
}

void printResult() {
  addBlankLine();
  final double price = selectedSuitcase!.values.toList()[0];
  deal ? print('Du hast das Angebot von $offer angenommen, Glückwunsch!\nLass uns sehen ob du einen guten Deal gemacht hast.') 
  : print('Du hast jedes Angebot abgelehnt. Schauen wir, was in deinem Koffer steckt.');
  printSelectedSuitcase();
  print('In deinem Koffer ${deal ? 'waren' : 'sind'} ${transformToString(price)}!');
}

void printRestartQuery() {
  addBlankLine();
  print('Möchtest du das Spiel neu starten? Gebe \"Restart\" ein neues Spiel zu beginnen und \"Ende\" um das Spiel zu beenden.');
}

void addBlankLine() {
  print(' ');
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< General Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Map<int, double> generateRandomSuitcases(List<double> priceList) {
  Map<int, double> suitcases = {};
  for (int i = 0; i < priceList.length; i++) {
    suitcases[i+1] = priceList[i];
  }
  return suitcases;
}

String atomicNumber(int loop) {
    switch (loop) {
    case 0:
      return 'ersten';
    case 1:
      return 'zweiten';
    case 2:
      return 'dritten';
    default:
      return 'vierten';
  }
}

void calculateOffer() {
  final List<double> availablePrices = getAvailablePrices();
  final double avg = (availablePrices.reduce((a, b) => a + b)) / availablePrices.length;
  final double roundOffer = avg * roundFactor();
  offer = transformToString(roundOffer);
}

double roundFactor() {
  switch (round) {
    case 1:
    case 2:
      return 0.9;
    case 3:
      return 0.8;
    case 4:
      return 0.7;
    default:
      return 0.6;
  }
}

List<String> transformToStringList(List<double> priceList) {
  final List<String> transformedStringList = [];
  priceList.forEach((price) => transformedStringList.add(transformToString(price)));
  return transformedStringList;
}

String transformToString(double price) {
  if (price >= 1) {
    return'${price.ceil().toString()}€';
  } else {
    return '${price.toStringAsFixed(2)}€';
  }
}

List<double> getAvailablePrices() {
  final List<double> copyPriceList = List.from(priceList);
  lostPrices.forEach((price) => copyPriceList.remove(price));
  return copyPriceList;
}

String getSuitcaseNumber(int suitcaseNumber) {
  return suitcaseNumber.toString().padLeft(2, '0');
}