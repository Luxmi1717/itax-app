import 'package:itax/utility/tax_calculators.dart';

import 'package:flutter/material.dart';

class IncomeTaxCalcResultTable extends StatelessWidget {
  final IncomeTaxCalcResult incomeTaxCalcResult;

  const IncomeTaxCalcResultTable(
      {super.key, required this.incomeTaxCalcResult});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(200),
        1: FlexColumnWidth(),
      },
      children: <TableRow>[
        _buildTableRow(
            'Total Income', incomeTaxCalcResult.totalIncome.toString()),
        _buildTableRow('Exempt Allowances',
            incomeTaxCalcResult.exemptAllowances.toString()),
        _buildTableRow('Standard Deduction',
            incomeTaxCalcResult.standardDeduction.toString()),
        _buildTableRow('Chapter VI A Deductions',
            incomeTaxCalcResult.chapterVIADeductions.toString()),
        _buildTableRow(
            'Taxable Income', incomeTaxCalcResult.taxableIncome.toString()),
        _buildTableRow('Income Tax', incomeTaxCalcResult.incomeTax.toString()),
        _buildTableRow('Health & Education Cess',
            incomeTaxCalcResult.healthAndEducationCess.toString()),
        _buildTableRow('Total Tax', incomeTaxCalcResult.totalTax.toString()),
      ],
    );
  }

  static TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
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
