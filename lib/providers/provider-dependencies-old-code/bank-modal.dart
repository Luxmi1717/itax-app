class Account_bank_model {
  String bsrcode;
  String bankName;
  String data;
  String challanSr;
  String tax;

  Account_bank_model({
    required this.bsrcode,
    required this.bankName,
    required this.data,
    required this.tax,
    required this.challanSr,
  });

  factory Account_bank_model.fromJson(Map<String, dynamic> json) {
    return Account_bank_model(
      bsrcode: json['bsrcode'],
      data: json['data'],
      challanSr: json['challanSr'],
      tax: json['tax'],
      bankName: json['bankName'],
    );
  }
}
