
/*class BusinessProfile {
  final int? id;
  final String businessName;
  final bool? isBusinessNameVerified;
  final bool? isGstinVerified;
  final bool? isPanVerified;
  final bool? isAddressVerified;
  final bool? isStateVerified;
  final String? pan;
  final String? tan;
  final String? gstin;
  final String? address;
  final String? bankName;
  final String? bankAccountNo;
  final String? bankIfsc;
  final String? bankBranch;
  final String? state;

  BusinessProfile({
    this.id,
    required this.businessName,
    this.isBusinessNameVerified,
    this.isAddressVerified,
    this.isGstinVerified,
    this.isPanVerified,
    this.isStateVerified,
    this.pan,
    this.tan,
    this.gstin,
    this.address,
    this.bankName,
    this.bankAccountNo,
    this.bankIfsc,
    this.bankBranch,
    this.state,
  });

  factory BusinessProfile.fromJson(Map<String, dynamic> json) {
    return BusinessProfile(
        id: json['id'] ?? "",
        businessName: json['businessName'] ?? "",
        pan: json['pan'] ?? "",
        tan: json['tan'] ?? "",
        gstin: json['gstin'] ?? "",
        address: json['address'] ?? '',
        bankName: json['bankName'] ?? "",
        bankAccountNo: json['bankAccountNo'] ?? "",
        bankIfsc: json['bankIfsc'] ?? "",
        bankBranch: json['bankBranch'] ?? "",
        state: json['state'] ?? "",
        isGstinVerified: json['isGstinVerified'] ?? "",
        isBusinessNameVerified: json['isBusinessNameVerified'] ?? "",
        isPanVerified: json['isPanVerified'] ?? "",
        isAddressVerified: json['isAddressVerified'] ?? "",
        isStateVerified: json['isStateVerified'] ?? "");
  }

  factory BusinessProfile.parseApi(Map<String, dynamic> json) {
    Map<String, dynamic> addrJson = json['data']['pradr']['addr'];

    List addr = [];
    addrJson.forEach((k, v) => {
          if (v != "NA" && v != "") {addr.add(v)}
        });

    final String address = addr.join(" ");

    String pan = (json['data']['gstin'] as String).substring(2, 12);

    return BusinessProfile(
        businessName: json['data']['tradeNam'],
        pan: pan,
        gstin: json['data']['gstin'],
        address: address,
        isGstinVerified: true);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessName': businessName,
      'pan': pan,
      'tan': tan,
      'gstin': gstin,
      'address': address,
      'bankName': bankName,
      'bankAccountNo': bankAccountNo,
      'bankIfsc': bankIfsc,
      'bankBranch': bankBranch,
      'state': state,
      'isGstinVerified': isGstinVerified,
      'isBusinessNameVerified': isBusinessNameVerified,
      'isPanVerified': isPanVerified,
      'isAddressVerified': isAddressVerified,
      'isStateVerified': isStateVerified
    };
  }
}*/
class BusinessProfile {
  String? status;
  String? message;
  Result? result;

  BusinessProfile({this.status, this.message, this.result});

  BusinessProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
   int? userId;
  String? businessName;
  String? bankAccountNo;
  String? companyPanNo;
  String? companyTanNo;

  bool? isBusinessNameVerified;
  bool? isGstinVerified;
   bool? isPanVerified;
   bool? isAddressVerified;
   bool? isStateVerified;
  String? msmeNo;
  String? gstNo;
  String? address;
  String? ifsc;
  String? branch;
  String? state;
  String? tradename;
  String? status;
  String? createdAt;
  String? updatedAt;

  Result(
      {this.id,
        this.userId,
        this.isBusinessNameVerified,
        this.isAddressVerified,
        this.isGstinVerified,
        this.isPanVerified,
        this.isStateVerified,
        this.businessName,
        this.bankAccountNo,
        this.companyPanNo,
        this.companyTanNo,
        this.msmeNo,
        this.gstNo,
        this.address,
        this.ifsc,
        this.branch,
        this.state,
        this.tradename,
        this.status,
        this.createdAt,
        this.updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    businessName = json['businessName'];
    bankAccountNo = json['bankAccountNo'];
    companyPanNo = json['companyPanNo'];
    companyTanNo = json['companyTanNo'];
    msmeNo = json['msmeNo'];
    gstNo = json['gstNo'];
    address = json['address'];
    ifsc = json['ifsc'];
    branch = json['branch'];
    state = json['state'];
    tradename = json['tradename'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['businessName'] = businessName;
    data['bankAccountNo'] = bankAccountNo;
    data['companyPanNo'] = companyPanNo;
    data['companyTanNo'] = companyTanNo;
    data['msmeNo'] = msmeNo;
    data['gstNo'] = gstNo;
    data['address'] = address;
    data['ifsc'] = ifsc;
    data['branch'] = branch;
    data['state'] = state;
    data['tradename'] = tradename;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
