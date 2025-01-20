import 'package:flutter/material.dart';

class DateInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const DateInputField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Adjust as needed
      lastDate: DateTime(2100), // Adjust as needed
    );
    if (pickedDate != null) {
      setState(() {
        widget.controller.text = pickedDate.toIso8601String().split('T')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        suffixIcon: const Icon(Icons.calendar_today),
      ),
    );
  }
}
