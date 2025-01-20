import 'package:flutter/material.dart';
import 'package:itax/config_old/theme/theme_helper.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.child,
        this.height=35,
      required this.width});

  final GestureTapCallback onTap;
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: appTheme.blue800Af,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(padding: const EdgeInsets.all(8), child: child),
        ),
      ),
    );
  }
}
