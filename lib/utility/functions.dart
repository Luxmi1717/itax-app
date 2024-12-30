import 'package:flutter/material.dart';

void openBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        child: content,
      );
    },
  );
}
