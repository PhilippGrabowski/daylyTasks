void main(List<String> args) {
  // 1. Keine Standardbestellung
  calculateDeliveryPrice(18.5, 4.2, false, false, 2); // Günstige Lieferung: 2.5€; Gesamtpreis der Lieferung: 21.0€
  // 2. Große Regenbestellung
  calculateDeliveryPrice(55.9, 8.8, true, true, 6); // Standartlieferung: 7.2€; Gesamtpreis der Lieferung: 63.1€
  // 3. Kleine Entfernungsbestellung
  calculateDeliveryPrice(12.4, 11.2, false, false, 1); // Standartlieferung: 5.0€; Gesamtpreis der Lieferung: 17.4€
}

void calculateDeliveryPrice(
  double orderValue,
  double distance,
  bool rushHour,
  bool isRaining,
  int orderSize,
) {
  double deliveryPrice = 
    getBaseDeliveryCharge(distance) +
    getDistanceSurcharge(distance) + 
    getWeatherSurcharge(isRaining) +
    getRushHourSurcharge(rushHour) - 
    getOrderSizeDiscount(orderSize) +
    getMinimumOrderCharge(orderValue);

  double maxDeliveryPrice = orderValue * 0.4; // Maximalkosten 40% des Bestellwertes
  deliveryPrice = deliveryPrice > maxDeliveryPrice ? roundToTenCents(maxDeliveryPrice) : roundToTenCents(deliveryPrice);

  printDeliveryPrice(deliveryPrice);
  print('Gesamtpreis der Lieferung: ${roundToTenCents(deliveryPrice + orderValue)}€');
}

// Grundliefergebühr
double getBaseDeliveryCharge(double distance) {
  if (distance <= 5.0) {
    return 2.5;
  } else if (distance <= 10) {
    return 3.5;
  } else {
    return 5.0;
  }
}

// Distanzzuschlag
double getDistanceSurcharge(double distance) {
  if (distance <= 5.0) return 0.0;
  double surcharge = (distance - 5.0).ceilToDouble(); // Runden auf die nächste ganze Zahl
  return surcharge * 0.3;
}

// Wetterzuschlag bei Regen
double getWeatherSurcharge(bool isRaining) {
  return isRaining ? 1.5 : 0.0;
}

// Hauptverkehrszeit-Zuschlag
double getRushHourSurcharge(bool isRushHour) {
  return isRushHour ? 2.0 : 0.0;
}

// Mengenrabatt
double getOrderSizeDiscount(int orderSize) {
  if (orderSize < 3) {
    return 0.0;
  } else if (orderSize < 5) {
    return 0.5;
  } else if (orderSize < 8) {
    return 1.0;
  } else {
    return 2.0;
  }
}

// Mindermengenzuschlag
double getMinimumOrderCharge(double orderValue) {
  return orderValue < 15.0 ? 2.0 : 0.0;
}

// Rundet Preis auf die nächste Zehntelstelle
double roundToTenCents(double price) {
  return (price * 10).roundToDouble() / 10;
}

// Druckt den Lieferpreis basierend auf dem Preis
void printDeliveryPrice(double price) {
    if (price < 5.0) {
    return print('Günstige Lieferung: $price€');
  } else if (price < 10.0) {
    return print('Standartlieferung: $price€');
  } else {
    return print('Premium-Lieferung: $price€');
  }
}