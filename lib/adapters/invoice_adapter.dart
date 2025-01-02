import 'package:hive/hive.dart';

import '../models/invoice_model.dart';

class InvoiceModelAdapter extends TypeAdapter<InvoiceModel> {
  @override
  final typeId = 2; // Unique identifier for the adapter

  @override
  InvoiceModel read(BinaryReader reader) {
    // Read the object fields from the binary reader
    final data = reader.readMap().cast<String, dynamic>();

    // Create a new InvoiceModel instance and return it
    return InvoiceModel(
      data: Data.fromJson(data),
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceModel obj) {
    // Write the object fields to the binary writer
    writer.writeMap(obj.data!.toJson());
  }
}
