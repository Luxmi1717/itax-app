import 'package:flutter/material.dart';
import 'package:itax/providers/providers_new/salaried-profile-provider.dart';
import 'package:provider/provider.dart';

class PanPage extends StatelessWidget {
  final TextEditingController panNumberController = TextEditingController();
  final TextEditingController aadhaarNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SalariedAadhaarPANProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PAN Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: panNumberController,
              decoration: InputDecoration(labelText: 'PAN Number'),
            ),
            
              
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Check PAN-Aadhaar Link'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => provider.panCard.name = value,
              controller: TextEditingController(text: provider.panCard.name),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Father\'s Name'),
              onChanged: (value) => provider.panCard.fatherName = value,
              controller:
                  TextEditingController(text: provider.panCard.fatherName),
            ),  
            TextField(
              decoration: InputDecoration(labelText: 'DOB'),
              onChanged: (value) => provider.panCard.dob = value,
              controller: TextEditingController(text: provider.panCard.dob),
            ),
            ElevatedButton(
              onPressed: () {
                provider.savePanCard(provider.panCard);
              },
              child: Text('Save PAN Data'),
            ),
          ],
        ),
      ),
    );
  }
}
