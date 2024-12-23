class Model_of_record_details {
  String bsrcode;
  String bankName;
  String data;
  String challanSr;
  String tax;


  Model_of_record_details({required this.bsrcode,
    required this.bankName,
    required this.data,

    required this.tax,
    required this.challanSr,

  });

  factory Model_of_record_details.fromJson(Map<String, dynamic> json) {
    return Model_of_record_details(
      bsrcode: json['bsrcode'],
      data: json['data'],
      challanSr: json['challanSr'],
      tax: json['tax'],
      bankName: json['bankName'],
    );
  }
}

class TCSDetails_record_details {
  String selectedValue ;
  String tanNumber = '';
  String deducted = '';
  String purchasesOfAssets = '';
  String totalTaxDeducted = '';

  TCSDetails_record_details({
    required this.selectedValue,
    required this.tanNumber,
    required this.deducted,
    required this.purchasesOfAssets,
    required this.totalTaxDeducted,


  });

  factory TCSDetails_record_details.fromJson(Map<String, dynamic> json) {
    return TCSDetails_record_details(
      selectedValue: json['selectedValue'],
      tanNumber: json['data'],
      deducted : json['deducted'],
      purchasesOfAssets: json['purchasesOfAssets'],
      totalTaxDeducted: json['totalTaxDeducted'],
    );
  }
}

class TDSDetails_record_details {
  String? headofIncome;
  String? Section2;
  String? Name;
  String? TanPan;
  String? AmountPaidCredited;
  String? DataofPayment;
  String? TaxDeductionIncluSurcharge;
  String? AmountPaidCreditedIncome;
  String? UniqueCertificateNumber;
  String? UniqueCetificateNumber9;
  String? FyinwhichTDSIsDeducted;
  String? AmountOutofInHandofSpouserOther;

  TDSDetails_record_details({
    required this.headofIncome,
    this.Section2 = '',
    this.Name='',
    this.TanPan='',
    this.AmountPaidCredited,
    this.DataofPayment='',
    this.TaxDeductionIncluSurcharge='',
    this.AmountPaidCreditedIncome='',
    this.UniqueCertificateNumber='',
    this.UniqueCetificateNumber9='',
    this.FyinwhichTDSIsDeducted='',
    this.AmountOutofInHandofSpouserOther='',
  });

  factory TDSDetails_record_details.fromJson(Map<String, dynamic> json) {
    return TDSDetails_record_details(
      headofIncome: json['headofIncome'],
      Section2: json['Section2'],
      Name: json['Name'],
      TanPan: json['TanPan'],
      AmountPaidCredited: json['AmountPaidCredited'],
      DataofPayment: json['DataofPayment'],
      TaxDeductionIncluSurcharge: json['TaxDeductionIncluSurcharge'],
      AmountPaidCreditedIncome: json['AmountPaidCreditedIncome'],
      UniqueCertificateNumber: json['UniqueCertificateNumber'],
      UniqueCetificateNumber9: json['UniqueCetificateNumber9'],
      FyinwhichTDSIsDeducted: json['FyinwhichTDSIsDeducted'],
      AmountOutofInHandofSpouserOther: json['AmountOutofInHandofSpouserOther'],
    );
  }
}
class TDSOnSalaryDetails_record_details {
  String tanNumber = '';
  String Namededucted = '';
  String IcomeChargeable = '';
  String totalTaxDeducted ;

  TDSOnSalaryDetails_record_details({

    required this.tanNumber,
    required this.Namededucted,
    required this.IcomeChargeable,
    required this.totalTaxDeducted,


  });

  factory TDSOnSalaryDetails_record_details.fromJson(Map<String, dynamic> json) {
    return TDSOnSalaryDetails_record_details(

      tanNumber: json['data'],
      Namededucted : json['deducted'],
          IcomeChargeable: json['purchasesOfAssets'],
      totalTaxDeducted: json['totalTaxDeducted'],
    );
  }
}