class BankValidationMode {
  bool? success;
  Results? results;

  BankValidationMode({this.success, this.results});

  BankValidationMode.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
    json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  int? code;
  int? timestamp;
  String? transactionId;
  Data? data;

  Results({this.code, this.timestamp, this.transactionId, this.data});

  Results.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    timestamp = json['timestamp'];
    transactionId = json['transaction_id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['timestamp'] = timestamp;
    data['transaction_id'] = transactionId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? entity;
  String? message;
  bool? accountExists;
  String? nameAtBank;
  String? utr;
  String? amountDeposited;

  Data(
      {this.entity,
        this.message,
        this.accountExists,
        this.nameAtBank,
        this.utr,
        this.amountDeposited});

  Data.fromJson(Map<String, dynamic> json) {
    entity = json['@entity'];
    message = json['message'];
    accountExists = json['account_exists'];
    nameAtBank = json['name_at_bank'];
    utr = json['utr'];
    amountDeposited = json['amount_deposited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@entity'] = entity;
    data['message'] = message;
    data['account_exists'] = accountExists;
    data['name_at_bank'] = nameAtBank;
    data['utr'] = utr;
    data['amount_deposited'] = amountDeposited;
    return data;
  }
}
