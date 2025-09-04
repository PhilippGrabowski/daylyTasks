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

  Hammer({required this.headSize, required super.weight, required super.manufacturer, super.isElectric});

  void setBlowAmount() {
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
  int? batteryStatus;


  Saw(this.bladeLength, {required super.weight, required super.manufacturer, super.isElectric});

  getBatteryStatus(int numberOfUse) {
    if (isElectric == false) {
      print('Säge ist nicht elektrisch!');
      return;
    } else if (numberOfUse > 0 && numberOfUse <= 5) {
      batteryStatus = 100 - numberOfUse * 3;
      print('Die Batterie liegt bei $batteryStatus%');
    } else if (numberOfUse > 0 && numberOfUse > 5 && numberOfUse < 10) {
      batteryStatus = 100 - numberOfUse * 5;
      print('Die Batterie liegt bei $batteryStatus%');
    } else if (numberOfUse > 0 && numberOfUse < 15) {
      batteryStatus = 25;
      print('Die Batterie liegt bei $batteryStatus%');
    } else if (numberOfUse > 0 && numberOfUse > 15) {
      batteryStatus = 0;
      print('Die Batterie ist leer!');
    } else {
      ();
    }
  }
}

void main(List<String> args) {
  Saw saw = Saw(80, manufacturer: 'Siemens', weight: 2.0, isElectric: true);
  Hammer hammer = Hammer(headSize: HeadSize.medium, weight: 5.0, manufacturer: 'Bosch');

  hammer.setBlowAmount();
  hammer.printUse();
  saw.printToolType();
  saw.getBatteryStatus(14);
}