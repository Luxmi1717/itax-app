
import 'package:flutter/material.dart';
import 'package:itax/presentation/older_screens/gst/withopt_gstr4a.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/providers/providers_old/gst_api.dart';
import 'package:itax/providers/providers_old/nav_provider.dart';

import 'package:provider/provider.dart';


class gstr4a extends StatefulWidget {
  const gstr4a({super.key});

  @override
  State<gstr4a> createState() => _gstr4aState();
}

class _gstr4aState extends State<gstr4a> {
  final bool _isChecked=false;
  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size.width;
    final navProvider = Provider.of<NavProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        navProvider.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GSTR4A'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,

                child: Center(
                  child: Column(
                    children: [
                      CustomButton(onTap: (){


                        _showErrorDialogLiability();

                      }, width:size*0.6, child:
                      const Center(child: Text('With OTP',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                      const SizedBox(height: 20,),
                      const Text('OR',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                      const SizedBox(height: 20,),
                      CustomButton(onTap: (){
                        navProvider.navigate('/Gstr4awithoutotp');
                        }, width:size*0.6, child:
                      const Center(child: Text('Without OTP',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),

                    ],
                  ),
                )
              ),
            ),
          ),
        ),

      ),
    );
  }

  void _showErrorDialogLiability() {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        return AlertDialog(
          title: const Text('Do you want to Download GSTR-4a',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
    Consumer<GstSection>(builder: (BuildContext context, pro, child) {
           return Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: pro.isChecked,
                      onChanged: (value) {
                        setState(() {
                          pro.setisChecked(value!);
                        });

                      },
                    ),
                    const Text('Get B2B Amendment[4A]',style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 14,),
                Row(
                  children: [
                    Checkbox(
                      value:pro.isChecked ,
                      onChanged: (value) {
                        setState(() {
                          pro.setisChecked(value!);
                        });
                      },
                    ),
                    const Text('Get B2B Invoice[4A]',style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 14,),
                Row(
                  children: [
                    Checkbox(
                      value: pro.isChecked,
                      onChanged: (value) {
                        setState(() {
                          pro.setisChecked(value!);
                        });
                      },
                    ),
                    const Text('Get CDNR[4A]',style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 14,),
                Row(
                  children: [
                    Checkbox(
                      value:pro.isChecked,
                      onChanged: (value) {
                        setState(() {
                          pro.setisChecked(value!);
                        });
                      },
                    ),
                    const Text('Get CDNR Amendment[4A]',style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 14,),
                Row(
                  children: [
                    Checkbox(
                      value: pro.isChecked,
                      onChanged: (value) {
                        setState(() {
                          pro.setisChecked(value!);
                        });
                      },
                    ),
                    const Text('Get TDS details[4A]',style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),



              ],

            );
           }),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 10,),

    Consumer<GstSection>(builder: (BuildContext context, pro, child) {
      return ElevatedButton(
        child: const Text(
          'OK',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        onPressed: () {
          if (pro.isChecked == true) {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const WithotpGstr()));

          }
        },
      );
    }),
              ],
            ),
          ],
        );
      },
    );
  }
}

