// To parse this JSON data, do
//
//     final panSearchModel = panSearchModelFromJson(jsonString);

import 'dart:convert';

PanSearchModel panSearchModelFromJson(String str) => PanSearchModel.fromJson(json.decode(str));

String panSearchModelToJson(PanSearchModel data) => json.encode(data.toJson());

class PanSearchModel {
  bool success;
  List<Datum> data;

  PanSearchModel({
    required this.success,
    required this.data,
  });

  factory PanSearchModel.fromJson(Map<String, dynamic> json) => PanSearchModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Data data;
  String gstin;

  Datum({
    required this.data,
    required this.gstin,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    data: Data.fromJson(json["data"]),
    gstin: json["gstin"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "gstin": gstin,
  };
}

class Data {
  String stjCd;
  String dty;
  String lgnm;
  String stj;
  List<dynamic> adadr;
  String cxdt;
  String gstin;
  List<String> nba;
  String lstupdt;
  String rgdt;
  String ctb;
  Pradr pradr;
  String ctjCd;
  String sts;
  String tradeNam;
  String ctj;
  String einvoiceStatus;

  Data({
    required this.stjCd,
    required this.dty,
    required this.lgnm,
    required this.stj,
    required this.adadr,
    required this.cxdt,
    required this.gstin,
    required this.nba,
    required this.lstupdt,
    required this.rgdt,
    required this.ctb,
    required this.pradr,
    required this.ctjCd,
    required this.sts,
    required this.tradeNam,
    required this.ctj,
    required this.einvoiceStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    stjCd: json["stjCd"],
    dty: json["dty"],
    lgnm: json["lgnm"],
    stj: json["stj"],
    adadr: List<dynamic>.from(json["adadr"].map((x) => x)),
    cxdt: json["cxdt"],
    gstin: json["gstin"],
    nba: List<String>.from(json["nba"].map((x) => x)),
    lstupdt: json["lstupdt"],
    rgdt: json["rgdt"],
    ctb: json["ctb"],
    pradr: Pradr.fromJson(json["pradr"]),
    ctjCd: json["ctjCd"],
    sts: json["sts"],
    tradeNam: json["tradeNam"],
    ctj: json["ctj"],
    einvoiceStatus: json["einvoiceStatus"],
  );

  Map<String, dynamic> toJson() => {
    "stjCd": stjCd,
    "dty": dty,
    "lgnm": lgnm,
    "stj": stj,
    "adadr": List<dynamic>.from(adadr.map((x) => x)),
    "cxdt": cxdt,
    "gstin": gstin,
    "nba": List<dynamic>.from(nba.map((x) => x)),
    "lstupdt": lstupdt,
    "rgdt": rgdt,
    "ctb": ctb,
    "pradr": pradr.toJson(),
    "ctjCd": ctjCd,
    "sts": sts,
    "tradeNam": tradeNam,
    "ctj": ctj,
    "einvoiceStatus": einvoiceStatus,
  };
}

class Pradr {
  Addr addr;
  String ntr;

  Pradr({
    required this.addr,
    required this.ntr,
  });

  factory Pradr.fromJson(Map<String, dynamic> json) => Pradr(
    addr: Addr.fromJson(json["addr"]),
    ntr: json["ntr"],
  );

  Map<String, dynamic> toJson() => {
    "addr": addr.toJson(),
    "ntr": ntr,
  };
}

class Addr {
  String bnm;
  String st;
  String loc;
  String bno;
  String dst;
  String lt;
  String locality;
  String pncd;
  String landMark;
  String stcd;
  String geocodelvl;
  String flno;
  String lg;

  Addr({
    required this.bnm,
    required this.st,
    required this.loc,
    required this.bno,
    required this.dst,
    required this.lt,
    required this.locality,
    required this.pncd,
    required this.landMark,
    required this.stcd,
    required this.geocodelvl,
    required this.flno,
    required this.lg,
  });

  factory Addr.fromJson(Map<String, dynamic> json) => Addr(
    bnm: json["bnm"],
    st: json["st"],
    loc: json["loc"],
    bno: json["bno"],
    dst: json["dst"],
    lt: json["lt"],
    locality: json["locality"],
    pncd: json["pncd"],
    landMark: json["landMark"],
    stcd: json["stcd"],
    geocodelvl: json["geocodelvl"],
    flno: json["flno"],
    lg: json["lg"],
  );

  Map<String, dynamic> toJson() => {
    "bnm": bnm,
    "st": st,
    "loc": loc,
    "bno": bno,
    "dst": dst,
    "lt": lt,
    "locality": locality,
    "pncd": pncd,
    "landMark": landMark,
    "stcd": stcd,
    "geocodelvl": geocodelvl,
    "flno": flno,
    "lg": lg,
  };
}