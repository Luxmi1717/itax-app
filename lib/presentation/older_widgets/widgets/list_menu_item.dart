import 'package:flutter/material.dart';

class ListMenuItem extends StatelessWidget {
  const ListMenuItem(
      {super.key, required this.onTap, required this.icon, required this.text});

  final GestureTapCallback onTap;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey[50],
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),

          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.navigate_next,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
