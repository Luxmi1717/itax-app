import 'package:flutter/foundation.dart';

enum FinancialYear { fy2022_2023, fy2023_2024 }

class ITRProvider extends ChangeNotifier {
  FinancialYear _financialYear = FinancialYear.fy2022_2023;

  get financialYear => _financialYear;

  set financialYear(value) {
    _financialYear = value;
    notifyListeners();
  }
}
