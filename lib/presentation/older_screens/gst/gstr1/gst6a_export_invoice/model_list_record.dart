class Gst6aModel {
  String Invoice_no;
  String Invoice_data;
  String GSTPayment;
  String Total_invoice;
  String Total_taxable;
  String Integrate_tax;
  String cess;

  Gst6aModel({
    required this.Invoice_no,required this.Invoice_data,required this.Total_invoice,required this.Total_taxable,required this.Integrate_tax, required this.cess,required this.GSTPayment
  });

  factory Gst6aModel.fromJson(Map<String, dynamic> json) {
    return Gst6aModel(
      Invoice_no: json['Invoice_no'],
      Invoice_data: json['Invoice_data'],
      Total_invoice: json['Total_invoice'],
      Total_taxable: json['Total_taxable'],
      Integrate_tax: json['Integrate_tax'],
      cess: json['cess'],
      GSTPayment: json['GSTPayment'],
    );
  }
}