import 'package:flutter/material.dart';
import 'package:itax/config_old/theme/theme_helper.dart';



class Card2 extends StatelessWidget {
  final String text;
  final Widget Row;
  const Card2({super.key, required this.text, required this.Row});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
        height: size.height*0.25,
        width: size.width*0.75,
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
          gradient: LinearGradient(
            colors: [appTheme.blue800Af, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.5, 0.5],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(text,style: const TextStyle(fontWeight:FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              ),),
            ),

            Row,
           ],
        )

    );
  }
}
