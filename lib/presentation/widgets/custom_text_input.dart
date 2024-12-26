import 'package:flutter/material.dart';

class CustomTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool ifPasswordField;

  const CustomTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.ifPasswordField, required String? Function(dynamic value) validator,
  });

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.ifPasswordField ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0), // Updated radius
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0), // Updated radius
          borderSide: const BorderSide(
            color: Colors.grey, // Color for the border when not focused
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0), // Updated radius
          borderSide: const BorderSide(
            color: Colors.blue, // Color for the border when focused
            width: 2.0,
          ),
        ),
        suffixIcon: widget.ifPasswordField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
