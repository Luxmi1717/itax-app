import 'package:flutter/cupertino.dart';

import '../models/gst/gstr1_model.dart';



class MyDataModel extends ChangeNotifier {
  MyData? _myData;
  int? _selectinvoice;

  MyData? get myData => _myData;
  int? get selectinvoice => _selectinvoice;

  void setMyData(MyData data) {
    _myData = data;
    notifyListeners();
  }
  void setMyInvoice(int data) {
    _selectinvoice = data;
    notifyListeners();
  }




}


