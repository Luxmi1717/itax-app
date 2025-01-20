import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  final IconData icon;
  final String label;
  final GestureTapCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var heigh = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(72),
      ),
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 72,
            height: 72,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: heigh/100
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
