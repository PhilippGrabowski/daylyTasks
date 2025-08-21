void main(List<String> args) {
  // Test 1
  calculateDiscountPrice(150, true, false, false); // Spar-Deal: 142.50€ - du sparst 7.50€ bei 5% Rabatt!
  // Test 2
  calculateDiscountPrice(250, false, true, true); // Super Spar-Deal: 200.00€ - du sparst 50.00€ bei 20% Rabatt
  // Test 3
  calculateDiscountPrice(50, false, false, false); // Standardpreis: 50.00€. Kein Rabatt verfügbar.
}

void calculateDiscountPrice(int totalAmount, bool isStudent, bool hasVoucher, bool isLoyalCustomer) {
  double? discount;
  discount = getBasicDiscount(isStudent, hasVoucher, isLoyalCustomer);
  discount = getExtraDiscount(totalAmount, discount);
  printDiscountPrice(discount, totalAmount);
}

double getBasicDiscount(bool isStudent, bool hasVoucher, bool isLoyalCustomer) {
  if (hasVoucher) {
    return 0.15; // 15% Rabatt mit Gutschein
  } else if (isLoyalCustomer) {
    return 0.1; // 10% Rabatt für treue Kunden
  } else if (isStudent) {
    return 0.05; // 5% Rabatt für Studenten
  } else {
    return 0.0; // Kein Rabatt
  }
}

// Zusätzlicher Rabatt für Bestellungen über 200€
double getExtraDiscount(int totalAmount, double discount) {
  return totalAmount > 200 ? discount + 0.05 : discount;
}

// Ausgabe des Endpreises basierend auf dem Rabatt
void printDiscountPrice(double discount, int totalAmount) {
  final String totalDiscount = (totalAmount * discount).toStringAsFixed(2);
  final String discountRate = (discount * 100).toStringAsFixed(0);
  final String totalPrice = (totalAmount * (1 - discount)).toStringAsFixed(2);

  discount > 0.15 ? print('Super Spar-Deal: $totalPrice€ - du sparst $totalDiscount€ bei $discountRate% Rabatt!') : 
  discount > 0.0 ? print('Spar-Deal: $totalPrice€ - du sparst $totalDiscount€ bei $discountRate% Rabatt!') : 
  print('Standardpreis: ${totalAmount.toStringAsFixed(2)}€. Kein Rabatt verfügbar.');
}