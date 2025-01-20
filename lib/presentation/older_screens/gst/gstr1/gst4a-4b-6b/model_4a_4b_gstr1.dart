class Model_of_record_details {
  String recept_details;
  String legal_name;
  String Taxpayer_type;
  String processed_records;
  String pending_errored_invoice;
  String AddInvoice;

  Model_of_record_details({required this.recept_details,
    required this.legal_name,
    required this.Taxpayer_type,
    required this.processed_records,
    required this.pending_errored_invoice,
    required this.AddInvoice,
  });

  factory Model_of_record_details.fromJson(Map<String, dynamic> json) {
    return Model_of_record_details(
      recept_details :json['recept_details'],
      legal_name: json['legal_name'],
      Taxpayer_type: json['Taxpayer_type'],
      pending_errored_invoice :json['pending_errored_invoice'],
      processed_records :json['processed_records'],
      AddInvoice :json['AddInvoice'],
    );
  }
}