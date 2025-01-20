import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlueBackButton extends StatelessWidget {
  final Color? color;

  const BlueBackButton({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back_outlined,
          color: color ?? Theme.of(context).iconTheme.color,
          size: 24,
        ),
      ),
      // child: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(50),
      //     color: Colors.grey
      //   ),
      //   child: IconButton(
      //     onPressed: () => context.pop(),
      //     icon: Icon(
      //       Icons.arrow_back_outlined,
      //       color: color ?? Theme.of(context).iconTheme.color,
      //       size: 24,
      //     ),
      //   ),
      // ),
    );
  }
}
