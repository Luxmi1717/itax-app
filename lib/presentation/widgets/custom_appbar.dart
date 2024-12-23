import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingWidget;
  final List<Widget>? trailingWidgets;


  GradientAppBar({
    this.leadingWidget,
    this.trailingWidgets,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.mainGradient,
        ),
      ),
      
      leading: leadingWidget,
      actions: trailingWidgets,
    );
  }
}
