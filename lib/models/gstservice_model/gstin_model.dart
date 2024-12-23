// To parse this JSON data, do
//
//     final gstinServiceModel = gstinServiceModelFromJson(jsonString);

import 'dart:convert';

GstinServiceModel gstinServiceModelFromJson(String str) => GstinServiceModel.fromJson(json.decode(str));

String gstinServiceModelToJson(GstinServiceModel data) => json.encode(data.toJson());

class GstinServiceModel {
  bool success;
  GstinServiceModelData data;

  GstinServiceModel({
    required this.success,
    required this.data,
  });

  factory GstinServiceModel.fromJson(Map<String, dynamic> json) => GstinServiceModel(
    success: json["success"],
    data: GstinServiceModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class GstinServiceModelData {
  DataData data;
  String statusCd;

  GstinServiceModelData({
    required this.data,
    required this.statusCd,
  });

  factory GstinServiceModelData.fromJson(Map<String, dynamic> json) => GstinServiceModelData(
    data: DataData.fromJson(json["data"]),
    statusCd: json["status_cd"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status_cd": statusCd,
  };
}

class DataData {
  String stjCd;
  String stj;
  String dty;
  String lgnm;
  List<dynamic> adadr;
  String cxdt;
  String gstin;
  List<String> nba;
  String lstupdt;
  String rgdt;
  String ctb;
  Pradr pradr;
  String ctjCd;
  String tradeNam;
  String sts;
  String ctj;
  String einvoiceStatus;

  DataData({
    required this.stjCd,
    required this.stj,
    required this.dty,
    required this.lgnm,
    required this.adadr,
    required this.cxdt,
    required this.gstin,
    required this.nba,
    required this.lstupdt,
    required this.rgdt,
    required this.ctb,
    required this.pradr,
    required this.ctjCd,
    required this.tradeNam,
    required this.sts,
    required this.ctj,
    required this.einvoiceStatus,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    stjCd: json["stjCd"],
    stj: json["stj"],
    dty: json["dty"],
    lgnm: json["lgnm"],
    adadr: List<dynamic>.from(json["adadr"].map((x) => x)),
    cxdt: json["cxdt"],
    gstin: json["gstin"],
    nba: List<String>.from(json["nba"].map((x) => x)),
    lstupdt: json["lstupdt"],
    rgdt: json["rgdt"],
    ctb: json["ctb"],
    pradr: Pradr.fromJson(json["pradr"]),
    ctjCd: json["ctjCd"],
    tradeNam: json["tradeNam"],
    sts: json["sts"],
    ctj: json["ctj"],
    einvoiceStatus: json["einvoiceStatus"],
  );

  Map<String, dynamic> toJson() => {
    "stjCd": stjCd,
    "stj": stj,
    "dty": dty,
    "lgnm": lgnm,
    "adadr": List<dynamic>.from(adadr.map((x) => x)),
    "cxdt": cxdt,
    "gstin": gstin,
    "nba": List<dynamic>.from(nba.map((x) => x)),
    "lstupdt": lstupdt,
    "rgdt": rgdt,
    "ctb": ctb,
    "pradr": pradr.toJson(),
    "ctjCd": ctjCd,
    "tradeNam": tradeNam,
    "sts": sts,
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