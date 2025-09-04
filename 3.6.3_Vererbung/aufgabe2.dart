class Grocery {
  final String name;
  final String manufacturer;
  final double weight;
  final double price;

  Grocery({required this.name, required this.manufacturer, required this.weight, required this.price});

  void printGroceryType() {
    print('Das Lebensmittel gibt es im Handel für ${price.toStringAsFixed(2)} €');
  }
}

class Milk extends Grocery {
  Milk({required super.name, required super.manufacturer, required super.weight, required super.price});

  @override
  void printGroceryType() {
    print('Die Milch kostet ${price.toStringAsFixed(2)} €');
  }
}

class Butter extends Grocery {
  Butter({required super.name, required super.manufacturer, required super.weight, required super.price});

  @override
  void printGroceryType() {
    print('Die Butter kostet ${price.toStringAsFixed(2)} €');
  }
}

void main(List<String> args) {
  Milk milk = Milk(name: 'Halbfettarme Milch', manufacturer: 'SachsenMilch', weight: 1.0, price: 1.89);
  Butter butter = Butter(name: 'Kräuterbutter', manufacturer: 'Meggle', weight: 0.5, price: 1.20);

  milk.printGroceryType();
  butter.printGroceryType();
}