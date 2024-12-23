class PanDetails {
  final int code;
  final int timestamp;
  final String transactionId;
  final PanData data;

  PanDetails({
    required this.code,
    required this.timestamp,
    required this.transactionId,
    required this.data,
  });

  factory PanDetails.fromJson(Map<String, dynamic> json) {
    return PanDetails(
      code: json['code'] ?? 0,
      timestamp: json['timestamp'] ?? 0,
      transactionId: json['transaction_id'] ?? "",
      data: PanData.fromJson(json['data']),
    );
  }
}

class PanData {
  final String pan;
  final String firstName;
  final String lastName;
  final String middleName;
  final String status;
  final String aadhaarSeedingStatus;
  final String category;
  final String lastUpdated;

  PanData({
    required this.pan,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.status,
    required this.aadhaarSeedingStatus,
    required this.category,
    required this.lastUpdated,
  });

  factory PanData.fromJson(Map<String, dynamic> json) {
    return PanData(
      pan: json['pan'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      middleName: json['middle_name'],
      status: json['status'],
      aadhaarSeedingStatus: json['aadhaar_seeding_status'],
      category: json['category'],
      lastUpdated: json['last_updated'],
    );
  }
}
