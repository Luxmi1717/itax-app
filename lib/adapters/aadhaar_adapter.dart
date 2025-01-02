import 'package:hive/hive.dart';

import '../models/aadhaar_model.dart';

class AadhaarModelAdapter extends TypeAdapter<AadhaarModel> {
  @override
  final typeId = 0; // Unique identifier for the adapter

  @override
  AadhaarModel read(BinaryReader reader) {
    // Read the object fields from the binary reader
    final data = reader.readMap().cast<String, dynamic>();

    // Create a new AadhaarModel instance and return it
    return AadhaarModel(
      data: Data.fromJson(data),
    );
  }

  @override
  void write(BinaryWriter writer, AadhaarModel obj) {
    // Write the object fields to the binary writer
    writer.writeMap(obj.data!.toJson());
  }
}
