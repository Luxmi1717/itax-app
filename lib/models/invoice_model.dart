class InvoiceModel {
  String? status;
  Data? data;

  InvoiceModel({this.status, this.data});

  InvoiceModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Buyer? buyer;
  Buyer? supplier;
  Buyer? consignee;
  String? invoiceNo;
  String? date;
  String? destination;
  int? chargeableAmount;
  double? taxAmount;
  String? chargeableAmountInWords;
  String? taxAmountInWords;
  double? cgst;

  Data(
      {this.buyer,
      this.supplier,
      this.consignee,
      this.invoiceNo,
      this.date,
      this.destination,
      this.chargeableAmount,
      this.taxAmount,
      this.chargeableAmountInWords,
      this.taxAmountInWords,
      this.cgst});

  Data.fromJson(Map<dynamic, dynamic> json) {
    buyer = json['buyer'] != null ? Buyer.fromJson(json['buyer']) : null;
    supplier =
        json['supplier'] != null ? Buyer.fromJson(json['supplier']) : null;
    consignee =
        json['consignee'] != null ? Buyer.fromJson(json['consignee']) : null;
    invoiceNo = json['invoiceNo'];
    date = json['date'];
    destination = json['destination'];
    chargeableAmount = json['chargeableAmount'];
    taxAmount = json['taxAmount'];
    chargeableAmountInWords = json['chargeableAmountInWords'];
    taxAmountInWords = json['taxAmountInWords'];
    cgst = json['cgst'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <String, dynamic>{};
    if (buyer != null) {
      data['buyer'] = buyer!.toJson();
    }
    if (supplier != null) {
      data['supplier'] = supplier!.toJson();
    }
    if (consignee != null) {
      data['consignee'] = consignee!.toJson();
    }
    data['invoiceNo'] = invoiceNo;
    data['date'] = date;
    data['destination'] = destination;
    data['chargeableAmount'] = chargeableAmount;
    data['taxAmount'] = taxAmount;
    data['chargeableAmountInWords'] = chargeableAmountInWords;
    data['taxAmountInWords'] = taxAmountInWords;
    data['cgst'] = cgst;
    return data;
  }
}

class Buyer {
  String? gstin;
  InvoiceState? state;
  String? address;

  Buyer({this.gstin, this.state, this.address});

  Buyer.fromJson(Map<dynamic, dynamic> json) {
    gstin = json['gstin'];
    state = json['state'] != null ? InvoiceState.fromJson(json['state']) : null;
    address = json['address'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <String, dynamic>{};
    data['gstin'] = gstin;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    data['address'] = address;
    return data;
  }
}

class InvoiceState {
  String? stateName;
  String? stateCode;

  InvoiceState({this.stateName, this.stateCode});

  InvoiceState.fromJson(Map<dynamic, dynamic> json) {
    stateName = json['stateName'];
    stateCode = json['stateCode'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['stateName'] = stateName;
    data['stateCode'] = stateCode;
    return data;
  }
}
