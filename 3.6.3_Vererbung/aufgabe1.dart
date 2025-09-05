enum HeadSize {
  small,
  medium,
  large
}

class Tool {
  final double weight;
  final String manufacturer;
  final bool isElectric;

  Tool({required this.weight, required this.manufacturer, this.isElectric = false});

  void printToolType() {
    print('Das Werkzeug ist ${isElectric ? 'ein' : 'kein'} elektrisches Werkzeug');
  }
}

class Hammer extends Tool {
  final HeadSize headSize;
  late final int hammerBlowAmount;

  Hammer({required this.headSize, required super.weight, required super.manufacturer, super.isElectric}) {
    switch (headSize) {
      case HeadSize.small:
        hammerBlowAmount = 8;
      case HeadSize.medium:
        hammerBlowAmount = 5;
      default:
        hammerBlowAmount = 2;
    }
  }

  void printUse() {
    print('Es benötigt $hammerBlowAmount Schläge mit dem Hammer, um einen Nagel in das Holz zu schlagen.');
  }
}

class Saw extends Tool {
  final double bladeLength;
  double? batteryStatus;

  Saw(this.bladeLength, {required super.weight, required super.manufacturer, super.isElectric}) {
    batteryStatus = super.isElectric == false ? null : 100;
  }

  useSaw([int numberOfUse = 1]) {
    if (batteryStatus == null) return;
    batteryStatus = batteryStatus! - (numberOfUse * 10).ceil();
    if (batteryStatus! < 0) batteryStatus = 0;
  }

  void printBatteryStatus() {
    batteryStatus == null
    ? print('Die Säge ist nicht elekktrisch und hat keinen Akku.')
    : print('Der Akku liegt bei $batteryStatus%.');
  }
}

void main(List<String> args) {
  Saw saw = Saw(80, manufacturer: 'Siemens', weight: 2.0, isElectric: true);
  Hammer hammer = Hammer(headSize: HeadSize.medium, weight: 5.0, manufacturer: 'Bosch');

  hammer.printUse();

  saw.printToolType();
  saw.useSaw();
  saw.printBatteryStatus();
  saw.useSaw(3);
  saw.printBatteryStatus();
}