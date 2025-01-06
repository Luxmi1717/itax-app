import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class YearButton extends StatelessWidget {
  final void Function(bool) onChanged2; // Callback to handle changes
  final bool value; // Current value: true for "Years", false for "Months"

  const YearButton({
    Key? key,
    required this.onChanged2,
    this.value = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    double buttonWidth = width * 0.6; // Adjust width of the toggle
    double buttonHeight = height * 0.06;

    return Center(
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedToggleSwitch<String>.dual(
          current: value ? 'Years' : 'Months', // Current toggle value
          first: 'Months', // First option
          second: 'Years', // Second option
          height: buttonHeight,
          borderWidth: 1.5,
          textBuilder: (value) => Center(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: value == 'Years' ? Colors.white : Colors.blue,
              ),
            ),
          ),
          onChanged: (newValue) {
            onChanged2(newValue == 'Years');
          },
          iconBuilder: (value) => Icon(Icons.calendar_today), 
        ),
      ),
    );
  }
}
