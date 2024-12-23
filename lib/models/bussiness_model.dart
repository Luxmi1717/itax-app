class BusinessData {
  String ifsc;
  String businessName;
  String bankAccountNo;
  String companyPanNo;
  String companyTanNo;
  String msmeNo;
  String gstNo;
  String state;
  String branch;
  String tradeName;
  String status;
  String address;

  BusinessData({
    required this.ifsc,
    required this.businessName,
    required this.bankAccountNo,
    required this.companyPanNo,
    required this.companyTanNo,
    required this.msmeNo,
    required this.gstNo,
    required this.state,
    required this.branch,
    required this.tradeName,
    required this.status,
    required this.address,
  });

  factory BusinessData.fromJson(Map<String, dynamic> json) => BusinessData(
    ifsc: json["ifsc"],
    businessName: json["businessName"],
    bankAccountNo: json["bankAccountNo"],
    companyPanNo: json["companyPanNo"],
    companyTanNo: json["companyTanNo"],
    msmeNo: json["msmeNo"],
    gstNo: json["gstNo"],
    state: json["state"],
    branch: json["branch"],
    tradeName: json["tradename"],
    status: json["status"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "ifsc": ifsc,
    "businessName": businessName,
    "bankAccountNo": bankAccountNo,
    "companyPanNo": companyPanNo,
    "companyTanNo": companyTanNo,
    "msmeNo": msmeNo,
    "gstNo": gstNo,
    "state": state,
    "branch": branch,
    "tradename": tradeName,
    "status": status,
    "address": address,
  };
}