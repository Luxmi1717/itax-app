class BusinessProfileModel {
  String? businessName;
  String? gstin;
  String? pan;
  String? tan;
  String? address;
  String? bankName;
  String? bankAccountNo;
  String? bankIfsc;
  String? bankBranch;

  BusinessProfileModel({
    this.businessName,
    this.gstin,
    this.pan,
    this.tan,
    this.address,
    this.bankName,
    this.bankAccountNo,
    this.bankIfsc,
    this.bankBranch,
  });

  // Factory constructor to create an instance from a JSON map
  factory BusinessProfileModel.fromJson(Map<String, dynamic> json) {
    return BusinessProfileModel(
      businessName: json['businessName'] ?? '',
      gstin: json['gstin'] ?? '',
      pan: json['pan'] ?? '',
      tan: json['tan'] ?? '',
      address: json['address'] ?? '',
      bankName: json['bankName'] ?? '',
      bankAccountNo: json['bankAccountNo'] ?? '',
      bankIfsc: json['bankIfsc'] ?? '',
      bankBranch: json['bankBranch'] ?? '',
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'gstin': gstin,
      'pan': pan,
      'tan': tan,
      'address': address,
      'bankName': bankName,
      'bankAccountNo': bankAccountNo,
      'bankIfsc': bankIfsc,
      'bankBranch': bankBranch,
    };
  }

  // Method to check if the business profile is complete
  bool isComplete() {
    return businessName != null &&
        businessName!.isNotEmpty &&
        pan != null &&
        pan!.isNotEmpty &&
        tan != null &&
        tan!.isNotEmpty &&
        address != null &&
        address!.isNotEmpty;
  }

  // Method to update fields of the business profile
  void updateProfile({
    String? businessName,
    String? gstin,
    String? pan,
    String? tan,
    String? address,
    String? bankName,
    String? bankAccountNo,
    String? bankIfsc,
    String? bankBranch,
  }) {
    if (businessName != null) this.businessName = businessName;
    if (gstin != null) this.gstin = gstin;
    if (pan != null) this.pan = pan;
    if (tan != null) this.tan = tan;
    if (address != null) this.address = address;
    if (bankName != null) this.bankName = bankName;
    if (bankAccountNo != null) this.bankAccountNo = bankAccountNo;
    if (bankIfsc != null) this.bankIfsc = bankIfsc;
    if (bankBranch != null) this.bankBranch = bankBranch;
  }

  @override
  String toString() {
    return 'BusinessProfileModel(businessName: $businessName, gstin: $gstin, pan: $pan, tan: $tan, address: $address, bankName: $bankName, bankAccountNo: $bankAccountNo, bankIfsc: $bankIfsc, bankBranch: $bankBranch)';
  }
}
