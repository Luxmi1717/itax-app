import 'package:flutter/material.dart';

class StateDropdown extends StatefulWidget {
  const StateDropdown({super.key});

  @override
  _StateDropdownState createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  String selectedState = '0%';

  final List<String> indianStates = [
  '0%',
  '0.1%',
  '0.25%',
  '1%',
  '1.5%',
  '3%',
  '5%',
  '6%',
  '7.5%',
  '12%',
  '18%',
  '28%',


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
