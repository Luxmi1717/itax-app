import 'package:flutter/cupertino.dart';

class GSTR3B with ChangeNotifier {
  final TextEditingController _value = TextEditingController();
  final TextEditingController _cgst = TextEditingController();
  final TextEditingController _sgst = TextEditingController();

  final TextEditingController _igst= TextEditingController();
  final TextEditingController _cess = TextEditingController();


  TextEditingController get value => _value;

  TextEditingController get cgst => _cgst;
  TextEditingController get sgst => _sgst;
  TextEditingController get igst => _igst;

  TextEditingController get cess => _cess;


  final TextEditingController _valueB = TextEditingController();
  final TextEditingController _cgstB = TextEditingController();
  final TextEditingController _sgstB = TextEditingController();

  final TextEditingController _igstB= TextEditingController();
  final TextEditingController _cessB = TextEditingController();


  TextEditingController get valueB => _valueB;

  TextEditingController get cgstB => _cgstB;
  TextEditingController get sgstB => _sgstB;
  TextEditingController get igstB => _igstB;

  TextEditingController get cessB => _cessB;
  final TextEditingController _valueC = TextEditingController();
  final TextEditingController _cgstC = TextEditingController();
  final TextEditingController _sgstC= TextEditingController();

  final TextEditingController _igstC= TextEditingController();
  final TextEditingController _cessC = TextEditingController();


  TextEditingController get valueC => _valueC;

  TextEditingController get cgstC => _cgstC;
  TextEditingController get sgstC => _sgstC;
  TextEditingController get igstC=> _igstC;

  TextEditingController get cessC => _cessC;


  final TextEditingController _valueD = TextEditingController();
  final TextEditingController _cgstD = TextEditingController();
  final TextEditingController _sgstD= TextEditingController();

  final TextEditingController _igstD= TextEditingController();
  final TextEditingController _cessD= TextEditingController();


  TextEditingController get valueD => _valueD;

  TextEditingController get cgstD => _cgstD;
  TextEditingController get sgstD => _sgstD;
  TextEditingController get igstD=> _igstD;

  TextEditingController get cessD => _cessD;


  final TextEditingController _valueE = TextEditingController();
  final TextEditingController _cgstE = TextEditingController();
  final TextEditingController _sgstE= TextEditingController();

  final TextEditingController _igstE= TextEditingController();
  final TextEditingController _cessE = TextEditingController();


  TextEditingController get valueE => _valueE;

  TextEditingController get cgstE => _cgstE;
  TextEditingController get sgstE => _sgstC;
  TextEditingController get igstE=> _igstE;

  TextEditingController get cessE=> _cessE;





  double _Intregrated=0.0;
  double get Intregated=>_Intregrated;


  double _CentalTax=0.0;
  double get Center=>_CentalTax;


  double _StateTax=0.0;
  double get StateTax=>_StateTax;

  double _Cess=0.0;
  double get Cess=>_Cess;

  void setgstvalue() {
    double igst  = double.tryParse(_igst.text) ?? 0;
    double  cgst = double.tryParse(_cgst.text) ?? 0;
    double sgst  = double.tryParse(_sgst.text) ?? 0;
    double cess= double.tryParse(_cess.text) ?? 0;
    _Intregrated=igst;
    _Cess=cess;
    _StateTax=sgst;
    _CentalTax=cgst;

    notifyListeners();
  }



  //gstr3b  card number two
//3.1.1 supplies notified under section9(5) of the CGST Act

}


class GSTR3BCardNo2 with ChangeNotifier{

  final TextEditingController _value = TextEditingController();
  final TextEditingController _cgst = TextEditingController();
  final TextEditingController _sgst = TextEditingController();

  final TextEditingController _igst= TextEditingController();
  final TextEditingController _cess = TextEditingController();
  final TextEditingController _value1 = TextEditingController();


  TextEditingController get value => _value;

  TextEditingController get cgst => _cgst;
  TextEditingController get sgst => _sgst;
  TextEditingController get igst => _igst;

  TextEditingController get cess => _cess;
  TextEditingController get value1 => _cess;

  double _Intregrated=0.0;
  double get Intregated=>_Intregrated;


  double _CentalTax=0.0;
  double get Center=>_CentalTax;


  double _StateTax=0.0;
  double get StateTax=>_StateTax;

  double _Cess=0.0;
  double get Cess=>_Cess;

  void setgstvalue() {
    double igst  = double.tryParse(_igst.text) ?? 0;
    double  cgst = double.tryParse(_cgst.text) ?? 0;
    double sgst  = double.tryParse(_sgst.text) ?? 0;
    double cess= double.tryParse(_cess.text) ?? 0;
    _Intregrated=igst;
    _Cess=cess;
    _StateTax=sgst;
    _CentalTax=cgst;

    notifyListeners();
  }


}
class GSTR3BCardNo3 with ChangeNotifier{

  final TextEditingController _value = TextEditingController();
  final TextEditingController _cgst = TextEditingController();
  final TextEditingController _sgst = TextEditingController();

  final TextEditingController _igst= TextEditingController();
  final TextEditingController _cess = TextEditingController();
  final TextEditingController _value1 = TextEditingController();


  TextEditingController get value => _value;

  TextEditingController get cgst => _cgst;
  TextEditingController get sgst => _sgst;
  TextEditingController get igst => _igst;

  TextEditingController get cess => _cess;
  TextEditingController get value1 => _cess;

  double _Intregrated=0.0;
  double get Intregated=>_Intregrated;


  double _CentalTax=0.0;
  double get Center=>_CentalTax;


  double _StateTax=0.0;
  double get StateTax=>_StateTax;

  double _Cess=0.0;
  double get Cess=>_Cess;

  void setgstvalue() {
    double igst  = double.tryParse(_igst.text) ?? 0;
    double  cgst = double.tryParse(_cgst.text) ?? 0;
    double sgst  = double.tryParse(_sgst.text) ?? 0;
    double cess= double.tryParse(_cess.text) ?? 0;
    _Intregrated=igst;
    _Cess=cess;
    _StateTax=sgst;
    _CentalTax=cgst;

    notifyListeners();
  }


}
