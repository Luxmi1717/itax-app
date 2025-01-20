class Gst5aModel {
  String Invoice_no;
  String Invoice_data;
  String Total_invoice;
  String Total_taxable;
  String Integrate_tax;
  String cess;

  Gst5aModel({
     required this.Invoice_no,required this.Invoice_data,required this.Total_invoice,required this.Total_taxable,required this.Integrate_tax, required this.cess
  });

  factory Gst5aModel.fromJson(Map<String, dynamic> json) {
    return Gst5aModel(
      Invoice_no: json['Invoice_no'],
      Invoice_data: json['Invoice_data'],
      Total_invoice: json['Total_invoice'],
      Total_taxable: json['Total_taxable'],
      Integrate_tax: json['Integrate_tax'],
      cess: json['cess'],
    );
  }
}