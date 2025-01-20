import 'package:flutter/cupertino.dart';

class GstCalculation with ChangeNotifier {
  final TextEditingController _turnover1 = TextEditingController();
  final TextEditingController _cgst1 = TextEditingController();
  final TextEditingController _sgst1 = TextEditingController();

  final TextEditingController _turnover2 = TextEditingController();
  final TextEditingController _cgst2 = TextEditingController();
  final TextEditingController _sgst2 = TextEditingController();



  final TextEditingController _turnover0 = TextEditingController();
  final TextEditingController _cgst0 = TextEditingController();
  final TextEditingController _sgst0 = TextEditingController();

  final TextEditingController _turnover5 = TextEditingController();
  final TextEditingController _cgst5 = TextEditingController();
  final TextEditingController _sgst5 = TextEditingController();


  TextEditingController get sgst5 => _sgst5;

  TextEditingController get turnover1 => _turnover1;
  TextEditingController get cgst1 => _cgst1;
  TextEditingController get sgst1 => _sgst1;

  TextEditingController get turnover2 => _turnover2;
  TextEditingController get cgst2 => _cgst2;
  TextEditingController get sgst2 => _sgst2;



  TextEditingController get turnover0 => _turnover0;
  TextEditingController get cgst0 =>_cgst0;
  TextEditingController get gst0 =>_sgst0;

  TextEditingController get turnover5 => _turnover5;
  TextEditingController get gst5 => _cgst5;





double _percentage1=0;
double get percentage =>_percentage1;

  void set1present() {
    _cgst1.text = (percentage/2).toString();
    _sgst1.text = (percentage/2).toString();
    notifyListeners();
  }




  void setPercent(){
    double turnover1 = double.tryParse(_turnover1.text)??0;

    _percentage1= (turnover1/100)*1;


    notifyListeners();
  }


  double _percentage2=0;
  double get percentage2 =>_percentage2;

  void set2present() {
    _cgst2.text = (percentage2/2).toString();
    _sgst2.text = (percentage2/2).toString();
    notifyListeners();
  }

  void set2Percent(){
    double turnover2 = double.tryParse(_turnover2.text)??0;

    _percentage2= (turnover2/100)*2;


    notifyListeners();
  }
  double _percentage5=0;
  double get percentage5 =>_percentage5;

  void set5present() {
    _cgst5.text = (percentage5/2).toString();
    _sgst5.text = (percentage5/2).toString();
    notifyListeners();
  }

  void set5Percent(){
    double turnover5 = double.tryParse(_turnover5.text)??0;

    _percentage5= (turnover5/100)*5;


    notifyListeners();
  }



  double _percentageTotal=0;
  double get percentageTotal =>_percentageTotal;


  double _TotalTurnover=0;
  double get TotalTurnover =>_TotalTurnover;


  final TextEditingController _cgsttotal = TextEditingController();
  final TextEditingController _sgsttotal = TextEditingController();
  final TextEditingController _TurnoverTotal = TextEditingController();

  TextEditingController get cgsttotal => _cgsttotal;
  TextEditingController get sgsttotal =>_sgsttotal;
  TextEditingController get turnovertotal =>_TurnoverTotal;

  void settotalpresent() {
    _cgsttotal.text = (percentageTotal/2).toString();
    _sgsttotal.text = (percentageTotal/2).toString();
    _TurnoverTotal.text = (TotalTurnover).toString();
    notifyListeners();
  }


  void settotalPercent(){
    double turnover1 = double.tryParse(_turnover1.text)??0;
    double turnover2 = double.tryParse(_turnover2.text)??0;
    double turnover5 = double.tryParse(_turnover5.text)??0;


    _percentageTotal=(percentage+percentage2+percentage5);
    _TotalTurnover=turnover1+turnover5+turnover2;


    notifyListeners();
  }





}