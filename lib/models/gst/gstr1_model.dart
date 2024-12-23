class MyData {
  final String gstin;
  final String fp;
  final double gt;
  final double curGt;
  final List<B2bData> b2b;
  final List<B2csData> b2cs;

  MyData({
    required this.gstin,
    required this.fp,
    required this.gt,
    required this.curGt,
    required this.b2b,
    required this.b2cs,
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    var b2bList = json['b2b'] as List<dynamic>? ?? [];
    List<B2bData> b2bData =
    b2bList.map((i) => B2bData.fromJson(i)).toList();

    var b2csList = json['b2cs'] as List<dynamic>? ?? [];
    List<B2csData> b2csData = b2csList.map((i) => B2csData.fromJson(i))
        .toList();

    return MyData(
      gstin: json['gstin'],
      fp: json['fp'],
      gt: json['gt'],
      curGt: json['cur_gt'],
      b2b: b2bData,
      b2cs: b2csData,
    );
  }
}

class B2bData {
  final String ctin;
  final List<InvData> inv;

  B2bData({
    required this.ctin,
    required this.inv,
  });

  factory B2bData.fromJson(Map<String, dynamic> json) {
    var invList = json['inv'] as List;
    List<InvData> invData = invList.map((i) => InvData.fromJson(i)).toList();

    return B2bData(
      ctin: json['ctin'],
      inv: invData,
    );
  }
}

class InvData {
  final String inum;
  final String idt;
  final double val;
  final String pos;
  final String rchrg;
  final List<ItmData> itms;
  final String invTyp;

  InvData({
    required this.inum,
    required this.idt,
    required this.val,
    required this.pos,
    required this.rchrg,
    required this.itms,
    required this.invTyp,
  });

  factory InvData.fromJson(Map<String, dynamic> json) {
    var itmList = json['itms'] as List;
    List<ItmData> itmData = itmList.map((i) => ItmData.fromJson(i)).toList();

    return InvData(
      inum: json['inum'],
      idt: json['idt'],
      val: json['val'],
      pos: json['pos'],
      rchrg: json['rchrg'],
      itms: itmData,
      invTyp: json['inv_typ'],
    );
  }
}

class ItmData {
  final int num;
  final ItmDetData itmDet;

  ItmData({
    required this.num,
    required this.itmDet,
  });

  factory ItmData.fromJson(Map<String, dynamic> json) {
    return ItmData(
      num: json['num'],
      itmDet: ItmDetData.fromJson(json['itm_det']),
    );
  }
}

class ItmDetData {
  final double txVal;
  final int rt;
  final double camt;
  final double samt;
  final double csamt;

  ItmDetData({
    required this.txVal,
    required this.rt,
    required this.camt,
    required this.samt,
    required this.csamt,
  });

  factory ItmDetData.fromJson(Map<String, dynamic> json) {
    return ItmDetData(
      txVal: json['txval'],
      rt: json['rt'],
      camt: json['camt'] == null ? 0.0 : json['camt'].toDouble(),
      samt: json['samt'] == null ? 0.0 : json['samt'].toDouble(),
      csamt: json['csamt'],
    );
  }
}
class B2csData {
  final int rt;
  final String splyTy;
  final String pos;
  final String typ;
  final double txval;
  final double camt;
  final double samt;
  final double csamt;

  B2csData({
    required this.rt,
    required this.splyTy,
    required this.pos,
    required this.typ,
    required this.txval,
    required this.camt,
    required this.samt,
    required this.csamt,
  });

  factory B2csData.fromJson(Map<String, dynamic> json) {
    return B2csData(
      rt: json['rt'],
      splyTy: json['sply_ty'],
      pos: json['pos'],
      typ: json['typ'],
      txval: json['txval'],
      camt: json['camt'],
      samt: json['samt'],
      csamt: json['csamt'],
    );
  }
}



