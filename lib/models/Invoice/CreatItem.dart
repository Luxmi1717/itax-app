
class InvoiceGetByIdModel {
  String itemName;
  String unit;
  int price;
  int openingStock;
  int closingStock;
  int purchasePrice;
  int cgst;
  int sgst;
  int igst;
  int utgst;
  bool taxExempted;
  String description;
  String hsnCode;
  int userId;

  InvoiceGetByIdModel({
    required this.itemName,
    required this.unit,
    required this.price,
    required this.openingStock,
    required this.closingStock,
    required this.purchasePrice,
    required this.cgst,
    required this.sgst,
    required this.igst,
    required this.utgst,
    required this.taxExempted,
    required this.description,
    required this.hsnCode,
    required this.userId,
  });

  factory InvoiceGetByIdModel.fromJson(Map<String, dynamic> json) =>
      InvoiceGetByIdModel(
        itemName: json["itemName"],
        unit: json["unit"],
        price: json["price"],
        openingStock: json["openingStock"],
        closingStock: json["closingStock"],
        purchasePrice: json["purchasePrice"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        igst: json["igst"],
        utgst: json["utgst"],
        taxExempted: json["taxExempted"],
        description: json["description"],
        hsnCode: json["hsnCode"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() =>
      {
        "itemName": itemName,
        "unit": unit,
        "price": price,
        "openingStock": openingStock,
        "closingStock": closingStock,
        "purchasePrice": purchasePrice,
        "cgst": cgst,
        "sgst": sgst,
        "igst": igst,
        "utgst": utgst,
        "taxExempted": taxExempted,
        "description": description,
        "hsnCode": hsnCode,
        "userId": userId,
      };
}

// To parse this JSON data, do
//
//     final invoiceItemCreateModel = invoiceItemCreateModelFromJson(jsonString);

