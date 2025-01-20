import 'package:flutter/material.dart';

class TextView extends StatelessWidget{
  final String text;
  final Color ?color;
  final TextStyle ?textStyle;
  final double ?width;
  final double ?height;
  final bool ?overflow;
  final void Function()? onTap;
  final int ?maxLines;
  final TextAlign ?textAlign;
  const TextView({super.key,
    required this.text,
    this.textStyle,
    this.color,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.width,
    this.height,
    this.onTap
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign:textAlign,
        overflow: overflow==true?TextOverflow.ellipsis:null,
        maxLines:maxLines,
        style: textStyle,

      ),
    );
  }

}