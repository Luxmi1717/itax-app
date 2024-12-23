// To parse this JSON data, do
//
//     final pincodebycityModel = pincodebycityModelFromJson(jsonString);

import 'dart:convert';

PincodebycityModel pincodebycityModelFromJson(String str) => PincodebycityModel.fromJson(json.decode(str));

String pincodebycityModelToJson(PincodebycityModel data) => json.encode(data.toJson());

class PincodebycityModel {
  PincodebycityModel({
    required this.success,
    required this.info,
  });

  bool success;
  List<Info> info;

  factory PincodebycityModel.fromJson(Map<String, dynamic> json) => PincodebycityModel(
    success: json["success"],
    info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
  };
}

class Info {
  Info({
    required this.officeName,
    required this.pincode,
    required this.taluk,
    required this.districtName,
    required this.stateName,
  });

  String officeName;
  int pincode;
  String taluk;
  String districtName;
  StateName stateName;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    officeName: json["officeName"],
    pincode: json["pincode"],
    taluk: json["taluk"],
    districtName: json["districtName"],
    stateName: stateNameValues.map[json["stateName"]]!,
  );

  Map<String, dynamic> toJson() => {
    "officeName": officeName,
    "pincode": pincode,
    "taluk": taluk,
    "districtName": districtName,
    "stateName": stateNameValues.reverse[stateName],
  };
}

enum StateName { ANDHRA_PRADESH, PONDICHERRY, ASSAM, BIHAR, CHATTISGARH, DELHI, GUJARAT, DAMAN_DIU, DADRA_NAGAR_HAVELI, HARYANA, HIMACHAL_PRADESH, JAMMU_KASHMIR, JHARKHAND, KARNATAKA, KERALA, LAKSHADWEEP, MADHYA_PRADESH, MAHARASHTRA, GOA, MANIPUR, MIZORAM, NAGALAND, TRIPURA, ARUNACHAL_PRADESH, MEGHALAYA, ODISHA, PUNJAB, CHANDIGARH, RAJASTHAN, TAMIL_NADU, UTTAR_PRADESH, UTTARAKHAND, WEST_BENGAL, ANDAMAN_NICOBAR_ISLANDS, SIKKIM }

final stateNameValues = EnumValues({
  "ANDAMAN & NICOBAR ISLANDS": StateName.ANDAMAN_NICOBAR_ISLANDS,
  "ANDHRA PRADESH": StateName.ANDHRA_PRADESH,
  "ARUNACHAL PRADESH": StateName.ARUNACHAL_PRADESH,
  "ASSAM": StateName.ASSAM,
  "BIHAR": StateName.BIHAR,
  "CHANDIGARH": StateName.CHANDIGARH,
  "CHATTISGARH": StateName.CHATTISGARH,
  "DADRA & NAGAR HAVELI": StateName.DADRA_NAGAR_HAVELI,
  "DAMAN & DIU": StateName.DAMAN_DIU,
  "DELHI": StateName.DELHI,
  "GOA": StateName.GOA,
  "GUJARAT": StateName.GUJARAT,
  "HARYANA": StateName.HARYANA,
  "HIMACHAL PRADESH": StateName.HIMACHAL_PRADESH,
  "JAMMU & KASHMIR": StateName.JAMMU_KASHMIR,
  "JHARKHAND": StateName.JHARKHAND,
  "KARNATAKA": StateName.KARNATAKA,
  "KERALA": StateName.KERALA,
  "LAKSHADWEEP": StateName.LAKSHADWEEP,
  "MADHYA PRADESH": StateName.MADHYA_PRADESH,
  "MAHARASHTRA": StateName.MAHARASHTRA,
  "MANIPUR": StateName.MANIPUR,
  "MEGHALAYA": StateName.MEGHALAYA,
  "MIZORAM": StateName.MIZORAM,
  "NAGALAND": StateName.NAGALAND,
  "ODISHA": StateName.ODISHA,
  "PONDICHERRY": StateName.PONDICHERRY,
  "PUNJAB": StateName.PUNJAB,
  "RAJASTHAN": StateName.RAJASTHAN,
  "SIKKIM": StateName.SIKKIM,
  "TAMIL NADU": StateName.TAMIL_NADU,
  "TRIPURA": StateName.TRIPURA,
  "UTTARAKHAND": StateName.UTTARAKHAND,
  "UTTAR PRADESH": StateName.UTTAR_PRADESH,
  "WEST BENGAL": StateName.WEST_BENGAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
