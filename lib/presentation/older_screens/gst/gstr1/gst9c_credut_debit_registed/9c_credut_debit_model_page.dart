class Model9c_credut_debit{
  String Place_of_supply;
  String Rate;
  String Total_taxable;
  String Integrated;
  String central_tax;
  String State_tax;
  String cess;


  Model9c_credut_debit({required this.Place_of_supply,
    required this.Rate,
    required this.Total_taxable,
    required this.Integrated,
    required this.central_tax,
    required this.State_tax,
    required this.cess,
  });

  factory Model9c_credut_debit.fromJson(Map<String, dynamic> json) {
    return Model9c_credut_debit(
      Place_of_supply :json['Place_of_supply'],
      Rate: json['Rate'],
      Total_taxable: json['Total_taxable'],
      Integrated :json['Integrated'],
      State_tax :json['State_tax'],
      cess:json['cess'], central_tax: 'central_tax',
    );
  }
}