class Invoice {
  String? id;
  String? invoiceNumber;
  String? type;
  String? partyId;
  String phone;
  String partyName;
  String? stateOfSupply;
  double? totalAmount;
  double? totalGst;
  double? cgst;
  double? sgst;
  double? igst;
  double? utgst;
  String? details;
  String? extraDetails;
  List<InvoiceItem>? items;
  String? modeOfPayment;
  bool? credit;

  Invoice({
    this.id,
    this.invoiceNumber,
    required this.type,
    required this.partyId,
    required this.phone,
    required this.partyName,
    this.totalAmount,
    this.totalGst,
    this.stateOfSupply,
    this.cgst,
    this.sgst,
    this.igst,
    this.utgst,
    this.details,
    this.extraDetails,
    this.items,
    this.modeOfPayment,
    this.credit,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    List<InvoiceItem> invoiceItems = [];

    if (json['items'] != null) {
      json['items'].forEach((itemJson) {
        invoiceItems.add(InvoiceItem.fromJson(itemJson));
      });
    }

    return Invoice(
      id: json['id'].toString(),
      invoiceNumber: json['invoiceNumber'].toString(),
      type: json['type'].toString(),
      partyId: json['partyId'].toString(),
      phone: json['phone'].toString(),
      partyName: json['partyName'].toString(),
      totalAmount: double.parse(json['totalAmount']),
      totalGst: double.parse(json['totalGst']),
      stateOfSupply: json['stateOfSupply'].toString(),
      cgst: double.parse(json['cgst']),
      sgst: double.parse(json['sgst']),
      igst: double.parse(json['igst']),
      utgst: double.parse(json['utgst']),
      details: json['details'].toString(),
      extraDetails: json['extraDetails'].toString(),
      items: invoiceItems,
      modeOfPayment: json['modeOfPayment'].toString(),
      credit: json['credit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'invoiceNumber': invoiceNumber,
      'type': type,
      'partyId': partyId,
      'phone': phone,
      'partyName': partyName,
      'totalAmount': totalAmount,
      'totalGst': totalGst,
      'stateOfSupply': stateOfSupply,
      'cgst': cgst,
      'sgst': sgst,
      'igst': igst,
      'utgst': utgst,
      'details': details,
      'extraDetails': extraDetails,
      'items':
          items != null ? items!.map((item) => item.toJson()).toList() : [],
      'modeOfPayment': modeOfPayment,
      'credit': credit,
    };
  }
}

class InvoiceItem {
  String id;
  String itemId;
  int quantity;
  double discount = 0.0;

  InvoiceItem({
    required this.id,
    required this.itemId,
    required this.quantity,
    required this.discount,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    return InvoiceItem(
        id: json['id'].toString(),
        itemId: json['itemId'].toString(),
        quantity: int.parse(json['quantity'].toString()),
        discount: double.parse(json['discount'].toString()));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': itemId,
      'quantity': quantity,
    };
  }
}

class Item {
  String id;
  String itemName;
  String unit;
  double price;
  double openingStock;
  double closingStock;
  double purchasePrice;
  double gst;
  bool taxExempted;
  String description;
  String hsnCode;

  Item({
    required this.id,
    required this.itemName,
    required this.unit,
    required this.price,
    required this.openingStock,
    required this.closingStock,
    required this.purchasePrice,
    required this.gst,
    required this.taxExempted,
    required this.description,
    required this.hsnCode,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    print(json);
    return Item(
      id: json['id'],
      itemName: json['itemName'],
      unit: json['unit'],
      price: double.parse(json['price']),
      openingStock: double.parse(json['openingStock']),
      closingStock: double.parse(json['closingStock']),
      purchasePrice: double.parse(json['purchasePrice']),
      gst: double.parse(json['gst'] ?? '0.0'),
      taxExempted: json['taxExempted'],
      description: json['description'],
      hsnCode: json['hsnCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemName': itemName,
      'unit': unit,
      'price': price,
      'openingStock': openingStock,
      'closingStock': closingStock,
      'purchasePrice': purchasePrice,
      'gst': gst,
      'taxExempted': taxExempted,
      'description': description,
      'hsnCode': hsnCode,
    };
  }
}

class Party {
  String? id;
  String partyName;
  String type;
  String gstin;
  String pan;
  String tan;
  String upi;
  String email;
  String phone;
  String address;
  String bankName;
  String bankAccountNumber;
  String bankIfsc;
  String bankBranch;

  Party({
    this.id,
    required this.partyName,
    required this.type,
    required this.gstin,
    required this.pan,
    required this.tan,
    required this.upi,
    required this.email,
    required this.phone,
    required this.address,
    required this.bankName,
    required this.bankAccountNumber,
    required this.bankIfsc,
    required this.bankBranch,
  });

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      id: json['id'],
      partyName: json['partyName'] ?? '',
      type: json['type'] ?? '',
      gstin: json['gstin'] ?? '',
      pan: json['pan'] ?? '',
      tan: json['tan'] ?? '',
      upi: json['upi'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      bankName: json['bankName'] ?? '',
      bankAccountNumber: json['bankAccountNumber'] ?? '',
      bankIfsc: json['bankIfsc'] ?? '',
      bankBranch: json['bankBranch'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'partyName': partyName,
      'type': type,
      'gstin': gstin,
      'pan': pan,
      'tan': tan,
      'upi': upi,
      'email': email,
      'phone': phone,
      'address': address,
      'bankName': bankName,
      'bankAccountNumber': bankAccountNumber,
      'bankIfsc': bankIfsc,
      'bankBranch': bankBranch,
    };
  }
}
