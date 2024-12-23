// To parse this JSON data, do
//
//     final liabilityResone = liabilityResoneFromJson(jsonString);

import 'dart:convert';

LiabilityResone liabilityResoneFromJson(String str) => LiabilityResone.fromJson(json.decode(str));

String liabilityResoneToJson(LiabilityResone data) => json.encode(data.toJson());

class LiabilityResone {
  LiabilityResone({
    required this.status,
    required this.company,
  });

  String status;
  Company company;

  factory LiabilityResone.fromJson(Map<String, dynamic> json) => LiabilityResone(
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
    required this.frDt,
    required this.toDt,
    required this.clBal,
    required this.gstin,
    required this.tr,
    required this.opBal,
  });

  String frDt;
  String toDt;
  Bal clBal;
  String gstin;
  List<Tr> tr;
  Bal opBal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    frDt: json["fr_dt"],
    toDt: json["to_dt"],
    clBal: Bal.fromJson(json["cl_bal"]),
    gstin: json["gstin"],
    tr: List<Tr>.from(json["tr"].map((x) => Tr.fromJson(x))),
    opBal: Bal.fromJson(json["op_bal"]),
  );

  Map<String, dynamic> toJson() => {
    "fr_dt": frDt,
    "to_dt": toDt,
    "cl_bal": clBal.toJson(),
    "gstin": gstin,
    "tr": List<dynamic>.from(tr.map((x) => x.toJson())),
    "op_bal": opBal.toJson(),
  };
}

class Bal {
  Bal({
    required this.igstbal,
    required this.sgstbal,
    required this.cessbal,
    required this.totRngBal,
    required this.cgstbal,
    required this.desc,
  });

  Cessbal igstbal;
  Cessbal sgstbal;
  Cessbal cessbal;
  int totRngBal;
  Cessbal cgstbal;
  String desc;

  factory Bal.fromJson(Map<String, dynamic> json) => Bal(
    igstbal: Cessbal.fromJson(json["igstbal"]),
    sgstbal: Cessbal.fromJson(json["sgstbal"]),
    cessbal: Cessbal.fromJson(json["cessbal"]),
    totRngBal: json["tot_rng_bal"],
    cgstbal: Cessbal.fromJson(json["cgstbal"]),
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "igstbal": igstbal.toJson(),
    "sgstbal": sgstbal.toJson(),
    "cessbal": cessbal.toJson(),
    "tot_rng_bal": totRngBal,
    "cgstbal": cgstbal.toJson(),
    "desc": desc,
  };
}

class Cessbal {
  Cessbal({
    required this.intr,
    required this.oth,
    required this.tx,
    required this.fee,
    required this.pen,
    required this.tot,
  });

  int intr;
  int oth;
  int tx;
  int fee;
  int pen;
  int tot;

  factory Cessbal.fromJson(Map<String, dynamic> json) => Cessbal(
    intr: json["intr"],
    oth: json["oth"],
    tx: json["tx"],
    fee: json["fee"],
    pen: json["pen"],
    tot: json["tot"],
  );

  Map<String, dynamic> toJson() => {
    "intr": intr,
    "oth": oth,
    "tx": tx,
    "fee": fee,
    "pen": pen,
    "tot": tot,
  };
}

class Tr {
  Tr({
    required this.sgst,
    required this.refNo,
    required this.dptDt,
    required this.sgstbal,
    required this.cessbal,
    required this.cgst,
    required this.cess,
    required this.totRngBal,
    required this.igst,
    required this.trTyp,
    required this.retPeriod,
    this.rptDt,
    required this.igstbal,
    this.dptTime,
    required this.totTrAmt,
    required this.cgstbal,
    required this.desc,
  });

  Cessbal sgst;
  String refNo;
  String dptDt;
  Cessbal sgstbal;
  Cessbal cessbal;
  Cessbal cgst;
  Cessbal cess;
  int totRngBal;
  Cessbal igst;
  String trTyp;
  String retPeriod;
  String? rptDt;
  Cessbal igstbal;
  String? dptTime;
  int totTrAmt;
  Cessbal cgstbal;
  String desc;

  factory Tr.fromJson(Map<String, dynamic> json) => Tr(
    sgst: Cessbal.fromJson(json["sgst"]),
    refNo: json["refNo"],
    dptDt: json["dpt_dt"],
    sgstbal: Cessbal.fromJson(json["sgstbal"]),
    cessbal: Cessbal.fromJson(json["cessbal"]),
    cgst: Cessbal.fromJson(json["cgst"]),
    cess: Cessbal.fromJson(json["cess"]),
    totRngBal: json["tot_rng_bal"],
    igst: Cessbal.fromJson(json["igst"]),
    trTyp: json["tr_typ"],
    retPeriod: json["ret_period"],
    rptDt: json["rpt_dt"],
    igstbal: Cessbal.fromJson(json["igstbal"]),
    dptTime: json["dpt_time"],
    totTrAmt: json["tot_tr_amt"],
    cgstbal: Cessbal.fromJson(json["cgstbal"]),
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "sgst": sgst.toJson(),
    "refNo": refNo,
    "dpt_dt": dptDt,
    "sgstbal": sgstbal.toJson(),
    "cessbal": cessbal.toJson(),
    "cgst": cgst.toJson(),
    "cess": cess.toJson(),
    "tot_rng_bal": totRngBal,
    "igst": igst.toJson(),
    "tr_typ": trTyp,
    "ret_period": retPeriod,
    "rpt_dt": rptDt,
    "igstbal": igstbal.toJson(),
    "dpt_time": dptTime,
    "tot_tr_amt": totTrAmt,
    "cgstbal": cgstbal.toJson(),
    "desc": desc,
  };
}
