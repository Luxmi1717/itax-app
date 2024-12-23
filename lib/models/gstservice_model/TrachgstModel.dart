class TrackGstModel {
  bool? _success;
  Data? _data;

  TrackGstModel({bool? success, Data? data}) {
    if (success != null) {
      _success = success;
    }
    if (data != null) {
      _data = data;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  TrackGstModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = _success;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    return data;
  }
}

class Data {
  List<EFiledlist>? _eFiledlist;

  Data({List<EFiledlist>? eFiledlist}) {
    if (eFiledlist != null) {
      _eFiledlist = eFiledlist;
    }
  }

  List<EFiledlist>? get eFiledlist => _eFiledlist;
  set eFiledlist(List<EFiledlist>? eFiledlist) => _eFiledlist = eFiledlist;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['EFiledlist'] != null) {
      _eFiledlist = <EFiledlist>[];
      json['EFiledlist'].forEach((v) {
        _eFiledlist!.add(EFiledlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_eFiledlist != null) {
      data['EFiledlist'] = _eFiledlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EFiledlist {
  String? _valid;
  String? _mof;
  String? _dof;
  String? _retPrd;
  String? _rtntype;
  String? _arn;
  String? _status;

  EFiledlist(
      {String? valid,
        String? mof,
        String? dof,
        String? retPrd,
        String? rtntype,
        String? arn,
        String? status}) {
    if (valid != null) {
      _valid = valid;
    }
    if (mof != null) {
      _mof = mof;
    }
    if (dof != null) {
      _dof = dof;
    }
    if (retPrd != null) {
      _retPrd = retPrd;
    }
    if (rtntype != null) {
      _rtntype = rtntype;
    }
    if (arn != null) {
      _arn = arn;
    }
    if (status != null) {
      _status = status;
    }
  }

  String? get valid => _valid;
  set valid(String? valid) => _valid = valid;
  String? get mof => _mof;
  set mof(String? mof) => _mof = mof;
  String? get dof => _dof;
  set dof(String? dof) => _dof = dof;
  String? get retPrd => _retPrd;
  set retPrd(String? retPrd) => _retPrd = retPrd;
  String? get rtntype => _rtntype;
  set rtntype(String? rtntype) => _rtntype = rtntype;
  String? get arn => _arn;
  set arn(String? arn) => _arn = arn;
  String? get status => _status;
  set status(String? status) => _status = status;

  EFiledlist.fromJson(Map<String, dynamic> json) {
    _valid = json['valid'];
    _mof = json['mof'];
    _dof = json['dof'];
    _retPrd = json['ret_prd'];
    _rtntype = json['rtntype'];
    _arn = json['arn'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['valid'] = _valid;
    data['mof'] = _mof;
    data['dof'] = _dof;
    data['ret_prd'] = _retPrd;
    data['rtntype'] = _rtntype;
    data['arn'] = _arn;
    data['status'] = _status;
    return data;
  }
}