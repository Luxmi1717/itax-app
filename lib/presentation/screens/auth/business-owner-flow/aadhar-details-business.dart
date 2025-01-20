import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/providers/providers_new/business-profile-provider.dart';
import 'package:provider/provider.dart';


class BusinessAadhaarPage extends StatelessWidget {
  final TextEditingController aadhaarNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BusinessProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Aadhaar Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: aadhaarNumberController,
              decoration: InputDecoration(labelText: 'Aadhaar Number'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.verifyAadhaar(aadhaarNumberController.text, );
              },
              child: Text('Verify Aadhaar'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => provider.aadhaar.name = value,
              controller: TextEditingController(text: provider.aadhaar.name),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Gender'),
              onChanged: (value) => provider.aadhaar.gender = value,
              controller: TextEditingController(text: provider.aadhaar.gender),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'DOB'),
              onChanged: (value) => provider.aadhaar.dob = value,
              controller: TextEditingController(text: provider.aadhaar.dob),
            ),
            BlueButton(
              onPressed: () {
               
              },
              title: 'Do OCR',
            ),
          ],
        ),
      ),
    );
  }
}
