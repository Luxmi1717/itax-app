import 'package:flutter/material.dart';

class TypeDropdown extends StatefulWidget {
  const TypeDropdown({super.key});

  @override
  _TypeDropdownState createState() => _TypeDropdownState();
}

class _TypeDropdownState extends State<TypeDropdown> {
  String selectedState = 'B2CL';

  final List<String> indianStates = [
    'B2CL',
    'Exports with payment',
    'Export Without payment'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(

        decoration: BoxDecoration(

          border: Border.all(color: Colors.black), // Set your border color
          borderRadius: BorderRadius.circular(8.0), // Set your border radius
          color: const Color(0xFFECEFF1), // Set your background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropdownButton<String>(
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
          ),
        ),
      ),
    );
  }
}