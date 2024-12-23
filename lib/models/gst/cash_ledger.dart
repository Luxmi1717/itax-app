import 'dart:convert';

CashResponse cashResponseFromJson(String str) => CashResponse.fromJson(json.decode(str));

String cashResponseToJson(CashResponse data) => json.encode(data.toJson());

class CashResponse {
  CashResponse({
    required this.status,
    required this.company,
  });

  String status;
  Company company;

  factory CashResponse.fromJson(Map<String, dynamic> json) => CashResponse(
    status: json["status"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "company": company.toJson(),
  };
}

class Company {
  Company({
    required this.transactionId,
    required this.code,
    required this.data,
    required this.timestamp,
  });

  String transactionId;
  int code;
  Data data;
  int timestamp;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    transactionId: json["transaction_id"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "code": code,
    "data": data.toJson(),
    "timestamp": timestamp,
  };
}

class Data {
  Data({
    required this.cashBal,
    required this.itcBal,
    required this.itcBlckBal,
    required this.gstin,
  });

  CashBal cashBal;
  ItcBal itcBal;
  ItcBlckBal itcBlckBal;
  String gstin;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cashBal: CashBal.fromJson(json["cash_bal"]),
    itcBal: ItcBal.fromJson(json["itc_bal"]),
    itcBlckBal: ItcBlckBal.fromJson(json["itc_blck_bal"]),
    gstin: json["gstin"],
  );

  Map<String, dynamic> toJson() => {
    "cash_bal": cashBal.toJson(),
    "itc_bal": itcBal.toJson(),
    "itc_blck_bal": itcBlckBal.toJson(),
    "gstin": gstin,
  };
}

class CashBal {
  CashBal({
    required this.sgstTotBal,
    required this.sgst,
    required this.igstTotBal,
    required this.cgst,
    required this.cess,
    required this.cessTotBal,
    required this.igst,
    required this.cgstTotBal,
  });

  int sgstTotBal;
  Cess sgst;
  int igstTotBal;
  Cess cgst;
  Cess cess;
  int cessTotBal;
  Cess igst;
  int cgstTotBal;

  factory CashBal.fromJson(Map<String, dynamic> json) => CashBal(
    sgstTotBal: json["sgst_tot_bal"],
    sgst: Cess.fromJson(json["sgst"]),
    igstTotBal: json["igst_tot_bal"],
    cgst: Cess.fromJson(json["cgst"]),
    cess: Cess.fromJson(json["cess"]),
    cessTotBal: json["cess_tot_bal"],
    igst: Cess.fromJson(json["igst"]),
    cgstTotBal: json["cgst_tot_bal"],
  );

  Map<String, dynamic> toJson() => {
    "sgst_tot_bal": sgstTotBal,
    "sgst": sgst.toJson(),
    "igst_tot_bal": igstTotBal,
    "cgst": cgst.toJson(),
    "cess": cess.toJson(),
    "cess_tot_bal": cessTotBal,
    "igst": igst.toJson(),
    "cgst_tot_bal": cgstTotBal,
  };
}

class Cess {
  Cess({
    required this.intr,
    required this.oth,
    required this.tx,
    required this.fee,
    required this.pen,
  });

  int intr;
  int oth;
  int tx;
  int fee;
  int pen;

  factory Cess.fromJson(Map<String, dynamic> json) => Cess(
    intr: json["intr"],
    oth: json["oth"],
    tx: json["tx"],
    fee: json["fee"],
    pen: json["pen"],
  );

  Map<String, dynamic> toJson() => {
    "intr": intr,
    "oth": oth,
    "tx": tx,
    "fee": fee,
    "pen": pen,
  };
}

class ItcBal {
  ItcBal({
    required this.cgstBal,
    required this.igstBal,
    required this.sgstBal,
    required this.cessBal,
  });

  int cgstBal;
  int igstBal;
  int sgstBal;
  int cessBal;

  factory ItcBal.fromJson(Map<String, dynamic> json) => ItcBal(
    cgstBal: json["cgst_bal"],
    igstBal: json["igst_bal"],
    sgstBal: json["sgst_bal"],
    cessBal: json["cess_bal"],
  );

  Map<String, dynamic> toJson() => {
    "cgst_bal": cgstBal,
    "igst_bal": igstBal,
    "sgst_bal": sgstBal,
    "cess_bal": cessBal,
  };
}

class ItcBlckBal {
  ItcBlckBal({
    required this.igstBlckBal,
    required this.cgstBlckBal,
    required this.sgstBlckBal,
    required this.cessBlckBal,
  });

  int igstBlckBal;
  int cgstBlckBal;
  int sgstBlckBal;
  int cessBlckBal;

  factory ItcBlckBal.fromJson(Map<String, dynamic> json) => ItcBlckBal(
    igstBlckBal: json["igst_blck_bal"],
    cgstBlckBal: json["cgst_blck_bal"],
    sgstBlckBal: json["sgst_blck_bal"],
    cessBlckBal: json["cess_blck_bal"],
  );

  Map<String, dynamic> toJson() => {
    "igst_blck_bal": igstBlckBal,
    "cgst_blck_bal": cgstBlckBal,
    "sgst_blck_bal": sgstBlckBal,
    "cess_blck_bal": cessBlckBal,
  };
}