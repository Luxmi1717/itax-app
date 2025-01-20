import 'package:flutter/material.dart';
import 'package:itax/models/profile-models/pan_model.dart';


class PanDetailsTable extends StatelessWidget {
  final PanModel panModel;

  const PanDetailsTable({super.key, required this.panModel});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey[300]!,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      children: [
        _buildTableRow('Name', panModel.data?.name ?? ''),
        _buildTableRow('Father Name', panModel.data?.fatherName ?? ''),
        _buildTableRow('DOB', panModel.data?.dob ?? ''),
        _buildTableRow('PAN', panModel.data?.pan ?? ''),
      ],
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
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
