import 'package:flutter/material.dart';

class InputTaxt extends StatelessWidget {
  final void Function(String?) onChanged;
  final TextEditingController controller;
  final hintText;
  final String? errorcode;
  final TextInputType keyboardType;

  const InputTaxt({
    super.key,
    required this.onChanged,
    required this.controller,
    this.hintText = '0',
    this.errorcode,
    this.keyboardType = TextInputType.number,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: errorcode != null ? 60.0 : 45.0,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: errorcode != null ? Colors.red : Colors.grey,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    errorText: errorcode),
              ),
            ),
          );
        },
      ),
    );
  }
}
