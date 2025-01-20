import 'package:hive/hive.dart';

import '../models/profile-models/pan_model.dart';

class PanModelAdapter extends TypeAdapter<PanModel> {
  @override
  final typeId = 1; // Unique identifier for the adapter

  @override
  PanModel read(BinaryReader reader) {
    // Read the object fields from the binary reader
    final data = reader.readMap().cast<String, dynamic>();

    // Create a new PanModel instance and return it
    return PanModel(
      data: Data.fromJson(data),
    );
  }

  @override
  void write(BinaryWriter writer, PanModel obj) {
    // Write the object fields to the binary writer
    writer.writeMap(obj.data!.toJson());
  }
}
