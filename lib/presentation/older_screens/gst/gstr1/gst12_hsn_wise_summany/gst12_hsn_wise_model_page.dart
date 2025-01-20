class Modelgst12_hsn_wise {
  String Place_of_supply;
  String Rate;
  String Total_taxable;
  String Integrated;
  String central_tax;
  String State_tax;
  String cess;


  Modelgst12_hsn_wise({required this.Place_of_supply,
    required this.Rate,
    required this.Total_taxable,
    required this.Integrated,
    required this.central_tax,
    required this.State_tax,
    required this.cess,
  });

  factory Modelgst12_hsn_wise.fromJson(Map<String, dynamic> json) {
    return Modelgst12_hsn_wise(
      Place_of_supply :json['Place_of_supply'],
      Rate: json['Rate'],
      Total_taxable: json['Total_taxable'],
      Integrated :json['Integrated'],
      State_tax :json['State_tax'],
      cess:json['cess'], central_tax: 'central_tax',
    );
  }
}