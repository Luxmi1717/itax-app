import 'package:flutter/material.dart';

class StateDropdown extends StatefulWidget {
  const StateDropdown({super.key});

  @override
  _StateDropdownState createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  String selectedState = '37 Andhra Pradesh';

  final List<String> indianStates = [
    '37 Andhra Pradesh',
    '12 Arunachal Pradesh',
    '18 Assam',
    '10 Bihar',
    '22 Chhattisgarh',
    '30 Goa',
    '24 Gujarat',
    '6 Haryana',
    '02 Himachal Pradesh',
    '20 Jharkhand',
    '29 Karnataka',
    '32 Kerala',
    '23 Madhya Pradesh',
    '27 Maharashtra',
    '14 Manipur',
    '17 Meghalaya',
    '15 Mizoram',
    '13 Nagaland',
    '21 Odisha',
    '03 Punjab',
    '08 Rajasthan',
    '11 Sikkim',
    '33 Tamil Nadu',
    '36 Telangana',
    '16 Tripura',
    '09 Uttar Pradesh',
    '05 Uttarakhand',
    '19 West Bengal',
    '35 Andaman and Nicobar Islands',
    '04 Chandigarh',
    '26 Dadra and Nagar Haveli and Daman and Diu',
    '31 Lakshadweep',
    '07 Delhi',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedState,
      onChanged: (value) {
        setState(() {
          selectedState = value!;
        });
      },
      items: indianStates.map<DropdownMenuItem<String>>((String state) {
        return DropdownMenuItem<String>(
          value: state,
          child: Text(state),
        );
      }).toList(),
    );
  }
}