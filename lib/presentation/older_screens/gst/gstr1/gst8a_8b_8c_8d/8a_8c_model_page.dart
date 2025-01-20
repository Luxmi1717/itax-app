class Model8a_8b_8c_8d {
  String Place_of_supply;
  String Rate;
  String Total_taxable;
  String Integrated;
  String central_tax;
  String State_tax;
  String cess;


  Model8a_8b_8c_8d({required this.Place_of_supply,
    required this.Rate,
    required this.Total_taxable,
    required this.Integrated,
    required this.central_tax,
    required this.State_tax,
    required this.cess,
  });

  factory Model8a_8b_8c_8d.fromJson(Map<String, dynamic> json) {
    return Model8a_8b_8c_8d(
      Place_of_supply :json['Place_of_supply'],
      Rate: json['Rate'],
      Total_taxable: json['Total_taxable'],
      Integrated :json['Integrated'],
      State_tax :json['State_tax'],
      cess:json['cess'], central_tax: 'central_tax',
    );
  }
}