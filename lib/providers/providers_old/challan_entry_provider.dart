import 'package:flutter/cupertino.dart';

class CallanTypeofPayment with ChangeNotifier{
  int _selectedValue=0;
  int get selectedValue=>_selectedValue;
  void setPaymentType(int value){
    _selectedValue=value;
    notifyListeners();

  }




}