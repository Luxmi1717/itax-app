
import 'package:flutter/material.dart';
import 'package:itax/config_old/theme/theme_helper.dart';

class Card1 extends StatelessWidget {
  final String text;
  int? value=0;
   Card1({super.key, required this.text,this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width*0.42,
      decoration: BoxDecoration(
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
          stops: const [0.5, 0.5],
        ),
      ),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,style: const TextStyle(fontWeight:FontWeight.bold,
              fontSize: 12,
              color: Colors.white,
            ),

            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline),
              SizedBox(width: 9,),

              Text('0',style: TextStyle(fontWeight:FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),)

            ],
          ),
        ],
      ),





    );
  }
}
