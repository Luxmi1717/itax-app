import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlueTextField extends StatefulWidget {
  const BlueTextField(
      {super.key,
      this.icon,
      required this.controller,
      required this.hintText,
      this.validator,
      this.change,
      this.initialValue,
      this.multiline = false,
      this.keyboardType = TextInputType.text,
      this.capitalization = TextCapitalization.none,
      this.maxLength,
      this.verified,
      this.nextController});

  final TextEditingController controller;
  final String hintText;
  final Icon? icon;
  final String? Function(String?)? validator;
  final String? Function(String?)? change;
  final String? initialValue;
  final bool multiline;
  final TextInputType keyboardType;
  final TextCapitalization capitalization;
  final int? maxLength;
  final TextEditingController? nextController;
  final bool? verified;

  @override
  State<BlueTextField> createState() => _BlueTextFieldState();
}

class _BlueTextFieldState extends State<BlueTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 2,
            // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        enabled: widget.verified != null
            ? widget.verified!
                ? false
                : true
            : true,
        inputFormatters: widget.maxLength != null
            ? [LengthLimitingTextInputFormatter(widget.maxLength)]
            : [],
        onChanged: widget.change,
        // onChanged: (text) {
        //   print("text");
        //   if (widget.hintText == "Gstin" && text.length > 2) {
        //     widget.nextController!.text = text.length > 12
        //         ? text.substring(2, 12).toUpperCase()
        //         : text.substring(2, text.length).toUpperCase();
        //   }
        //   if (widget.hintText == "Gstin" ||
        //       widget.hintText == "TAN" ||
        //       widget.hintText == "Name" ||
        //       widget.hintText == "Bank IFSC") {
        //     widget.controller.value = TextEditingValue(
        //         text: text.toUpperCase(),
        //         selection: widget.controller.selection);
        //   }
        // },
        textCapitalization: widget.capitalization,
        keyboardType: widget.keyboardType,
        maxLines: widget.multiline ? 5 : 1,
        minLines: widget.multiline ? 3 : 1,
        controller: widget.controller,

        validator: (value) {
          print("value");
          // if (value == null || value.isEmpty) {
          //   return 'Please enter some text';
          // }
          return null;
        },
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: widget.icon,
          hintText: widget.hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
