import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;

  const CustomDialog({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.green.withOpacity(0.3),
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
