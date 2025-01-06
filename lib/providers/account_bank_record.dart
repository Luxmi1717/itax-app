import 'package:flutter/widgets.dart';
import 'package:itax/providers/provider-dependencies-old-code/bank-modal.dart';


class AccountBank extends ChangeNotifier{

  final List<Account_bank_model> _dataList = [];

  List<Account_bank_model > get dataList => _dataList;

  void addRecord(Account_bank_model  record) {
    _dataList.add(record);

    notifyListeners();
  }

}