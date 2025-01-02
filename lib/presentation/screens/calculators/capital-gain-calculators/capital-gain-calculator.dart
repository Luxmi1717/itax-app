import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/date-input-widget.dart';


class CapitalGain extends StatefulWidget {
  const CapitalGain({super.key});

  @override
  State<CapitalGain> createState() => _CapitalGainsCalculatorState();
}

class _CapitalGainsCalculatorState extends State<CapitalGain> {
  final TextEditingController purchaseDateController = TextEditingController();
  final TextEditingController saleDateController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController salePriceController = TextEditingController();

  String? selectedAssetType;
  String? result;

  final List<String> assetTypes = [
    'Gold',
    'Unlisted Shares',
    'Listed Shares',
    'Immovable Property',
    'Debt Mutual Funds',
    'Other Assets'
  ];

  void calculateCapitalGains() {
    try {
      final double purchasePrice = double.parse(purchasePriceController.text);
      final double salePrice = double.parse(salePriceController.text);
      final DateTime purchaseDate = DateTime.parse(purchaseDateController.text);
      final DateTime saleDate = DateTime.parse(saleDateController.text);

      final Duration holdingPeriod = saleDate.difference(purchaseDate);
      final int holdingDays = holdingPeriod.inDays;
      final double gains = salePrice - purchasePrice;

      double taxRate = 0.0;
      String holdingClassification = '';

      if (selectedAssetType == null) {
        setState(() {
          result = 'Please select an asset type.';
        });
        return;
      }

      // Determine short-term or long-term classification
      if (selectedAssetType == 'Listed Shares') {
        if (holdingDays < 365) {
          holdingClassification = 'Short-term';
          taxRate = 15.0; // Short-term tax rate for listed shares
        } else {
          holdingClassification = 'Long-term';
          taxRate = 10.0; // Long-term tax rate for listed shares
        }
      } else if (selectedAssetType == 'Unlisted Shares' ||
          selectedAssetType == 'Immovable Property') {
        if (holdingDays < 730) {
          holdingClassification = 'Short-term';
          taxRate =
              12.5; // Short-term tax rate for unlisted shares & immovable property
        } else {
          holdingClassification = 'Long-term';
          taxRate = 12.5; // Long-term tax rate for these assets
        }
      } else {
        // Gold, Debt Mutual Funds, Other Assets
        if (holdingDays < 730) {
          holdingClassification = 'Short-term';
          taxRate = 30.0; // Short-term tax rate for other assets
        } else {
          holdingClassification = 'Long-term';
          taxRate = 12.5; // Long-term tax rate for other assets
        }
      }

      // Calculate tax
      final double tax = (gains * taxRate) / 100;

      setState(() {
        result =
            'Holding: $holdingClassification\nTax Rate: $taxRate%\nGains: ₹${gains.toStringAsFixed(2)}\nTax: ₹${tax.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        result = 'Invalid input! Please check the dates and amounts entered.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capital Gains Tax Calculator'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Asset Type',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedAssetType,
                onChanged: (value) {
                  setState(() {
                    selectedAssetType = value;
                  });
                },
                items: assetTypes.map((asset) {
                  return DropdownMenuItem(
                    value: asset,
                    child: Text(asset),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select Asset Type',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Purchase Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DateInputField(
                controller: purchaseDateController,
                hintText: 'Enter Purchase Date',
              ),
              const SizedBox(height: 20),
              const Text(
                'Sale Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DateInputField(
                controller: saleDateController,
                hintText: 'Enter Sale Date',
              ),
              const SizedBox(height: 20),
              const Text(
                'Purchase Price (₹)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              BlueTextField(
                controller: purchasePriceController,
                keyboardType: TextInputType.number,
                hintText: 'Enter Purchase Price',
              ),
              const SizedBox(height: 20),
              const Text(
                'Sale Price (₹)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              BlueTextField(
                controller: salePriceController,
                keyboardType: TextInputType.number,
                hintText: 'Enter Sale Price',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateCapitalGains,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 20),
              if (result != null)
                Text(
                  result!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
