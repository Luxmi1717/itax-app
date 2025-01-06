import 'package:flutter/material.dart';
import 'package:itax/models/aadhaar_model.dart';


class AadhaarTable extends StatelessWidget {
  final AadhaarModel aadhaarData;

  const AadhaarTable({super.key, required this.aadhaarData});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: [
        _buildTableRow('Name', aadhaarData.data?.name ?? ''),
        _buildTableRow('Gender', aadhaarData.data?.gender ?? ''),
        _buildTableRow('Year of Birth', aadhaarData.data?.yearOfBirth ?? ''),
        _buildTableRow('Aadhaar Number', aadhaarData.data?.aadhaarNumber ?? ''),
      ],
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value),
        ),
      ],
    );
  }
}
