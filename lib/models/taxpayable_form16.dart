class TaxModel {
  static const double RATE_1 = 0.0;
  static const double RATE_2 = 0.05;
  static const double RATE_3 = 0.2;
  static const double RATE_4 = 0.3;
  static const double RATE_5 = 0.2;
  static const double RATE_6 = 0.25;
  static const double RATE_7 = 0.3;
  static const double CESSRATE_7 = 0.04;

  static const double LIMIT_1 = 250000.0;
  static const double LIMIT_2 = 500000.0;
  static const double LIMIT_3 = 1000000.0;
  static const double LIMIT_4 = 1200000.0;
  static const double LIMIT_5 = 1200000000.0;

  static double calculateTax(double income) {
    double tax = 0.0;
    if (income <= LIMIT_1) {
      tax = RATE_1 * income;
    } else if (income <= LIMIT_2) {
      tax = RATE_2 * (income - LIMIT_1);
    } else if (income <= LIMIT_3) {
      tax = RATE_3 * (income - LIMIT_2) + calculateTax(LIMIT_2);
    } else if (income <= LIMIT_4) {
      tax = RATE_4 * (income - LIMIT_3) + calculateTax(LIMIT_3);
    } else if (income <= LIMIT_5) {
      tax = RATE_5 * (income - LIMIT_4) + calculateTax(LIMIT_4);
    }

    return tax;
  }
}

class TaxCess {
  TaxCess(double tax);

  static double calculateTax(double tax) {
    double cessRate = 0.04; // 4% cess rate
    double cess = tax * cessRate;
    print('total$cess');
    return cess;
  }
}
