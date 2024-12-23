// To parse this JSON data, do
//
//     final invoiceItemCreateModel = invoiceItemCreateModelFromJson(jsonString);

import 'dart:convert';

InvoiceItemCreateModel invoiceItemCreateModelFromJson(String str) => InvoiceItemCreateModel.fromJson(json.decode(str));

String invoiceItemCreateModelToJson(InvoiceItemCreateModel data) => json.encode(data.toJson());

class InvoiceItemCreateModel {
  bool success;
  Item item;

  InvoiceItemCreateModel({
    required this.success,
    required this.item,
  });

  factory InvoiceItemCreateModel.fromJson(Map<String, dynamic> json) => InvoiceItemCreateModel(
    success: json["success"],
    item: Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "item": item.toJson(),
  };
}

class Item {
  String id;
  String itemName;
  String unit;
  String price;
  String openingStock;
  String closingStock;
  String purchasePrice;
  String cgst;
  String sgst;
  String igst;
  String utgst;
  bool taxExempted;
  String description;
  String hsnCode;
  dynamic categoryId;
  dynamic supplierId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  Item({
    required this.id,
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
    required this.categoryId,
    required this.supplierId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
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
    categoryId: json["categoryId"],
    supplierId: json["supplierId"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
    "categoryId": categoryId,
    "supplierId": supplierId,
    "userId": userId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}