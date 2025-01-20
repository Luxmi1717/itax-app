import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  const Spinner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(Colors.white),
      ),
    );
  }
}
