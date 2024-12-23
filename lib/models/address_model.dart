class AddressModel {
  String residenceNo;
  String residenceName;
  String roadOrStreet;
  String localityOrArea;
  String cityOrTownOrDistrict;
  String stateCode;
  String countryCode;
  String pinCode;
  String countryCodeMobile;
  String mobileNo;
  String emailAddress;

  AddressModel({
    this.residenceNo = '',
    this.residenceName = '',
    this.roadOrStreet = '',
    this.localityOrArea = '',
    this.cityOrTownOrDistrict = '',
    this.stateCode = '',
    this.countryCode = '',
    this.pinCode = '',
    this.countryCodeMobile = '',
    this.mobileNo = '',
    this.emailAddress = '',
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      residenceNo: map['ResidenceNo'],
      residenceName: map['ResidenceName'],
      roadOrStreet: map['RoadOrStreet'],
      localityOrArea: map['LocalityOrArea'],
      cityOrTownOrDistrict: map['CityOrTownOrDistrict'],
      stateCode: map['StateCode'],
      countryCode: map['CountryCode'],
      pinCode: map['PinCode'],
      countryCodeMobile: map['CountryCodeMobile'],
      mobileNo: map['MobileNo'],
      emailAddress: map['EmailAddress'],
    );
  }
}
