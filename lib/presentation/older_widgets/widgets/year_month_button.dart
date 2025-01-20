import 'package:flutter/material.dart';

class YearButton extends StatelessWidget {
  final void Function(bool) onChanged2;
  final bool value;

  const YearButton({
    super.key,
    required this.onChanged2,
    this.value = true,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

   
    double buttonWidth = width * 0.3;
    double buttonHeight = height * 0.06;


    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 1.0), 
      child: Container(
        height: buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4), 
            ),
          ],
        ),
        child: LiteRollingSwitch(
          width: buttonWidth,
          value: value,
          textOn: 'Month',
          textOff: 'Years',
          textOnColor: Colors.white,
          textOffColor: Colors.white,
          colorOn: const Color.fromARGB(255, 33, 150, 243),
          colorOff: const Color.fromARGB(255, 87, 161, 222),
          iconOn: Icons.calendar_month, 
          iconOff: Icons.calendar_month_outlined, 
          textSize: 12.0, 
          onChanged: onChanged2,
          onTap: () {},
          onDoubleTap: () {},
          onSwipe: () {},
        ),
      ),
    );
  }
}
