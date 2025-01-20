class Aadhaar {
  String? name;
  String? aadhaarNumber;
  String? gender;
  String? dob;

  Aadhaar({this.name, this.aadhaarNumber, this.gender, this.dob});

  factory Aadhaar.fromJson(Map<String, dynamic> json) {
    return Aadhaar(
      name: json['name'],
      aadhaarNumber: json['aadhaar_number'],
      gender: json['gender'],
      dob: json['dob'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'aadhaar_number': aadhaarNumber,
      'gender': gender,
      'dob': dob,
    };
  }
}
