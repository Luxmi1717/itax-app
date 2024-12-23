
import 'dart:convert';



class ITR1Model {
  final Map<String, dynamic>? Form_ITR1;
  final Map<String, dynamic>? PersonalInfo;
  final Map<String, dynamic>? FilingStatus;
  final Map<String, dynamic>? ITR1_IncomeDeductions;
  final Map<String, dynamic>? ITR1_TaxComputation;
  final Map<String, dynamic>? TaxPayments;

  final Map<dynamic, dynamic>?TaxPaid ;
  final Map<String, dynamic>? Refund;

  final Map<String, dynamic>? Schedule80G;
  final Map<String, dynamic>? Schedule80D;
  final Map<String, dynamic>? TDSonOthThanSals;
  final Map<dynamic, dynamic>? TDSonSalaries;
  final Map<dynamic, dynamic>?Verification ;

  ITR1Model({
    this.Form_ITR1,
    this.PersonalInfo,
    this.FilingStatus,
    this.ITR1_IncomeDeductions,
    this.ITR1_TaxComputation,
    this.TaxPayments,
    this.TaxPaid,
    this.Refund,
    this.Schedule80G,
    this.Schedule80D,
    this.TDSonOthThanSals,
    this.TDSonSalaries,
    this.Verification,
  });
}

ITR1Model createITR1Model(List<Map<String, dynamic>> mapList) {
  Map<String, dynamic> formITR1 = {};
  Map<String, dynamic> personalInfo = {};
  Map<String, dynamic> FilingStatus = {};
  Map<String, dynamic> itr1Incomedeductions = {};
  Map<String, dynamic> itr1Taxcomputation = {};
  Map<String, dynamic>TaxPayments = {};
  Map<dynamic, dynamic>? TaxPaid={};
  Map<String, dynamic> Refund = {};
  Map<String, dynamic> Schedule80G = {};
  Map<String, dynamic> Schedule80D = {};
  Map<String, dynamic> TDSonOthThanSals = {};
  Map<dynamic, dynamic>TDSonSalaries = {};
   Map<dynamic, dynamic>? Verification={};

  for (final map in mapList) {
    if (map.containsKey("Form_ITR1")) {
      formITR1 = map["Form_ITR1"];
    } else if (map.containsKey("PersonalInfo")) {
      personalInfo = map["PersonalInfo"];
    } else if (map.containsKey("FilingStatus")) {
      FilingStatus = map["FilingStatus"];
    } else if (map.containsKey("ITR1_IncomeDeductions")) {
      itr1Incomedeductions = map["ITR1_IncomeDeductions"];
    } else if (map.containsKey("ITR1_TaxComputation")) {
      itr1Taxcomputation = map["ITR1_TaxComputation"];
    } else if (map.containsKey("TaxPaid")) {
      TaxPayments = map["TaxPaid"];
    } else if (map.containsKey("Refund")) {
      Refund = map["Refund"];
    } else if (map.containsKey("Schedule80G")) {
      Schedule80G = map["Schedule80G"];
    } else if (map.containsKey("Schedule80D")) {
      Schedule80D = map["Schedule80D"];
    } else if (map.containsKey("TDSonSalaries")) {
      TDSonOthThanSals= map["TDSonSalaries"];
    } else if (map.containsKey("TDSOnOthThanSals")) {
      TDSonSalaries = map["TDSonSalaries"];
    }
    else if (map.containsKey("Verification")) {
      Verification = map["Verification"];
    }

    else if (map.containsKey("TaxPaid")) {
      TaxPaid = map["TaxPaid"];
    }
  }



  return ITR1Model(

  Form_ITR1: formITR1,
  PersonalInfo: personalInfo,
  FilingStatus: FilingStatus,
  ITR1_IncomeDeductions: itr1Incomedeductions,
  ITR1_TaxComputation: itr1Taxcomputation,
  TaxPayments: TaxPayments,
  TaxPaid: TaxPaid,
  Refund: Refund,
  Schedule80G:Schedule80G,
  Schedule80D: Schedule80D,
  TDSonOthThanSals: TDSonOthThanSals,
  TDSonSalaries: TDSonSalaries,
  Verification:Verification,


  );

}


// Create the ITR1Model instance




String convertITR1ModelToJson(ITR1Model model) {
  Map<String, dynamic> jsonMap = {
    'formITR1': model.Form_ITR1,
    'personalInfo': model.PersonalInfo,
    'filingStatus': model.FilingStatus,
    'itr1IncomeDeductions': model.ITR1_IncomeDeductions,
    'ITR1_TaxComputation': model.ITR1_TaxComputation,
    'TaxPayments': model.TaxPayments,
    'TaxPaid':model.TaxPaid,
    'refund': model.Refund,
    'Schedule80G': model.Schedule80G,
    'Schedule80D': model.Schedule80D,
    'tdsOnSalaries': model.TDSonOthThanSals,
    'tdsOnOthThanSals': model.TDSonSalaries,
    'Verification':model.Verification,
  };

  return json.encode(jsonMap);
}
