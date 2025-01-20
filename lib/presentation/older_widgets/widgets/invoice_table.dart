import 'package:flutter/material.dart';
import 'package:itax/models/invoice_model.dart';


class InvoiceDetailsWidget extends StatelessWidget {
  final InvoiceModel invoice;

  const InvoiceDetailsWidget({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Buyer Details',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          _buildBuyerTable(invoice.data?.buyer),
          const SizedBox(height: 16.0),
          const Text(
            'Supplier Details',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          _buildBuyerTable(invoice.data?.supplier),
          const SizedBox(height: 16.0),
          const Text(
            'Consignee Details',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          _buildBuyerTable(invoice.data?.consignee),
          const SizedBox(height: 16.0),
          const Text(
            'Invoice Details',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(3),
            },
            children: [
              _buildTableRow('Invoice No:', invoice.data?.invoiceNo),
              _buildTableRow('Date:', invoice.data?.date),
              _buildTableRow('Destination:', invoice.data?.destination),
              _buildTableRow('Chargeable Amount:',
                  invoice.data?.chargeableAmount?.toString()),
              _buildTableRow(
                  'Tax Amount:', invoice.data?.taxAmount?.toString()),
              _buildTableRow('Chargeable Amount in Words:',
                  invoice.data?.chargeableAmountInWords),
              _buildTableRow(
                  'Tax Amount in Words:', invoice.data?.taxAmountInWords),
              _buildTableRow('CGST:', invoice.data?.cgst?.toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBuyerTable(Buyer? buyer) {
    if (buyer == null) {
      return const Text('N/A');
    }

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(3),
      },
      children: [
        _buildTableRow('GSTIN:', buyer.gstin),
        _buildTableRow('State:', buyer.state?.stateName),
        _buildTableRow('State Code:', buyer.state?.stateCode),
        _buildTableRow('Address:', buyer.address),
      ],
    );
  }

  TableRow _buildTableRow(String label, String? value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(value ?? 'N/A'),
          ),
        ),
      ],
    );
  }
}
