

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itax/config_old/theme/theme_helper.dart';

class textdecoration extends StatelessWidget {
  final String text;
  final double size;

  const textdecoration({super.key, required this.text,  this.size=18,  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        color:appTheme.blue800Af,
        // fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}

