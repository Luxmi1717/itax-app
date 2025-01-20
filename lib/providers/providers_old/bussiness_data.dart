import 'package:flutter/cupertino.dart';
import 'package:itax/models/business_profile_model.dart';


class GstBussinessData with ChangeNotifier{
  BusinessProfile _businessProfiledata=BusinessProfile(
    result: Result(
      businessName:'NEW SATHI',
    gstNo: '23BNJPS3408M1ZP'
    ),
  );
   BusinessProfile  get BusinessProfiledata=>_businessProfiledata;

  SetBussinesData(BusinessProfile data ){
    _businessProfiledata=data;

    notifyListeners();
  }


}