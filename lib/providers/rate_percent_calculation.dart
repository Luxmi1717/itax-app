import 'package:flutter/cupertino.dart';

class RatePercentCalculation with ChangeNotifier{

  double rate=0;
  double calculaterValue=0;
  double get CalculateVale=>calculaterValue;
 void Ratecalculate(double rate, double value){
   calculaterValue=(rate * value) / 100;
   print(calculaterValue);
    notifyListeners();
  }
}