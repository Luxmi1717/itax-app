import 'package:flutter/material.dart';
import 'package:itax/config_old/theme/theme_helper.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.onTap,
      required this.child,
      this.width = double.infinity});

  final GestureTapCallback onTap;
  final Widget child;
  final double width;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: appTheme.blue800Af,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(padding: const EdgeInsets.all(16), child: child),
        ),
      ),
    );
  }
}
