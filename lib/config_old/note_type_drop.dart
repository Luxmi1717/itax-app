import 'package:flutter/material.dart';

class NoteDropdown extends StatefulWidget {
  const NoteDropdown({super.key});

  @override
  _NoteDropdownState createState() => _NoteDropdownState();
}

class _NoteDropdownState extends State<NoteDropdown> {
  String selectedState = 'Credit';

  final List<String> indianStates = [
    'Credit',
    'Dedit'


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