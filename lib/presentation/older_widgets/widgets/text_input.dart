import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,  this.errorcode,




  });

  final void Function(String?)? onChanged;

  final TextEditingController controller;
  final hintText;
  final String? errorcode;



  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
          hintText: hintText,
          errorText: errorcode
        ),
        cursorColor: Colors.deepPurple,
      ),
    );
  }
}
