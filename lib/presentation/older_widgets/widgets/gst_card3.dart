import 'package:flutter/material.dart';
import 'package:itax/config_old/theme/theme_helper.dart';


class Card3 extends StatelessWidget {
  final String text;
  final Widget widget;
  final double width;
  final double height;

  const Card3({super.key, required this.text, required this.widget, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
        height: height,
        width: width,
        decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],

          borderRadius: BorderRadius.circular(10),
          gradient:  LinearGradient(
            colors: [ appTheme.blue800Af, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 0.5],
          ),
        ),
        child: Column(
         
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(text,style: const TextStyle(fontWeight:FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              ),),
            ),

            widget,
           ],
        )

    );
  }
}
