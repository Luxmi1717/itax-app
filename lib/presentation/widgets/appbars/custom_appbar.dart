import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/main.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingWidget;
  final List<Widget>? trailingWidgets;


  const GradientAppBar({super.key, 
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
      leadingWidth: 100.w,
      actions: trailingWidgets,
    );
  }
}
