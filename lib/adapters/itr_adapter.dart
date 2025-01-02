import 'package:hive/hive.dart';
import 'package:itax/models/itr_model.dart';

class ITRModelAdapter extends TypeAdapter<ITRModel> {
  @override
  final typeId = 3; // Unique identifier for the adapter

  @override
  ITRModel read(BinaryReader reader) {
    // Read the object fields from the binary reader
    final data = reader.readMap().cast<String, dynamic>();

    // Create a new AadhaarModel instance and return it
    return ITRModel.fromJSON({'data': data});
  }

  @override
  void write(BinaryWriter writer, ITRModel obj) {
    // Write the object fields to the binary writer
    writer.writeMap(obj.toJSON());
  }
}
