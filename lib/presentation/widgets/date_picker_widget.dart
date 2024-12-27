import 'package:flutter/material.dart';

class DateFieldPicker extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const DateFieldPicker({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  _DateFieldPickerState createState() => _DateFieldPickerState();
}

class _DateFieldPickerState extends State<DateFieldPicker> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true, // Ensures the user can't type in the field
      onTap: () async {
        // Show the date picker dialog when the field is tapped
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900), // Earliest date selectable
          lastDate: DateTime(2100), // Latest date selectable
        );

        if (pickedDate != null) {
          // Update the controller with the selected date
          setState(() {
            widget.controller.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          });
        }
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        suffixIcon: const Icon(
            Icons.calendar_today), // Calendar icon for the date picker
      ),
    );
  }
}
