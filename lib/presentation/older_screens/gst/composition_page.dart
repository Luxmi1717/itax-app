
import 'package:flutter/material.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/presentation/older_widgets/widgets/gst_card2.dart';


import 'gst_cmp_08.dart';
import 'gstr4a.dart';

class Composition extends StatefulWidget {
  const Composition({super.key});

  @override
  State<Composition> createState() => _CompositionState();
}

class _CompositionState extends State<Composition> {
  @override
  Widget build(BuildContext context) {

    var size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compostion Deshboard'),
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Card2(text: 'Statement for Payment of self-assessed tax GST CMP-80', Row:CustomButton(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const GSTRtable()));
              }, width: size.width*0.4,
                child:
                const Center(child: Text('ONLINE',
                  style: TextStyle(fontWeight:FontWeight.bold,

                    color: Colors.white,
                  ),),
                ),), ),
            ),
            const SizedBox(height: 20,),
            Card2(
              Row : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(onTap: () {
                   // navProvider.navigate('/gstr4a');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const gstr4a()));
                  }, width: size.width*0.2,
                    child:
                    const Center(child: Text('VIEW',
                      style: TextStyle(fontWeight:FontWeight.bold,

                        color: Colors.white,
                      ),),
                    ),),
                  CustomButton(onTap: () {

                  }, width: size.width*0.35,
                    child:
                    const Center(child: Text('DOWNLOAD',
                      style: TextStyle(
                        fontWeight:FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ),),
                ],
              ), text: 'Auto drafted details for registered person options opting composition levy GSTR4A',
            ),



          ],
        ),
      ),


    );
  }
}






