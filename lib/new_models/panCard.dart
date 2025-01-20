class PanCard {
  String? name;
  String? fatherName;
  String? dob;
  String? panNumber;

  PanCard({this.name, this.fatherName, this.dob, this.panNumber});

  factory PanCard.fromJson(Map<String, dynamic> json) {
    return PanCard(
      name: json['name'],
      fatherName: json['father_name'],
      dob: json['dob'],
      panNumber: json['pan_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'father_name': fatherName,
      'dob': dob,
      'pan_number': panNumber,
    };
  }
}
