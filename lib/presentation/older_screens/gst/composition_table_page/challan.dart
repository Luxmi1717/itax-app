
import 'package:flutter/material.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/providers/providers_old/gst_calculation_outward.dart';
import 'package:provider/provider.dart';




class ChallanComposition extends StatefulWidget {
  const ChallanComposition({super.key});

  @override
  State<ChallanComposition> createState() => _ChallanCompositionState();
}

class _ChallanCompositionState extends State<ChallanComposition> {
  TextEditingController Igst = TextEditingController();
  TextEditingController cgst = TextEditingController();
  TextEditingController sgst = TextEditingController();
  TextEditingController cess = TextEditingController();


  bool _showSidebar = false;
  @override
  Widget build(BuildContext context) {
    final gstCal = Provider.of<GstCalculation>(context);
    var size=MediaQuery.of(context).size.width;







    return Scaffold(
      appBar: AppBar(
        title: const Text('Inward Supplies Details for current Quarter'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showSidebar = !_showSidebar;
                    });
                  },
                  child: Column(
                    children: [
                      const Text('Outward Supplies Details for Current Quarter',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),),
                      const SizedBox(height: 10,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Stack(
                          children: [



                            DataTable(
                              columnSpacing: 9,
                              sortColumnIndex: 0,
                              sortAscending: true,
                              headingRowColor: WidgetStateColor.resolveWith((states) => Colors.grey),
                              dataRowColor: WidgetStateColor.resolveWith((states) => Colors.white ),
                              dataRowHeight: 50,

                              headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              columns: const [
                                DataColumn(
                                  label: Icon(Icons.menu),

                                  numeric: false,
                                ),

                                DataColumn(
                                  label: Text('Supply value'),

                                  numeric: false,
                                ),
                                DataColumn(
                                  label: Text('IGST'),

                                  numeric: false,
                                ),
                                DataColumn(
                                  label: Text('CGST'),

                                  numeric: false,
                                ),
                                DataColumn(
                                  label: Text('SGST'),

                                  numeric: false,
                                ),
                                DataColumn(
                                  label: Text('CESS'),

                                  numeric: false,
                                ),


                              ],
                              rows:  [
                                DataRow(


                                    cells: [


                                      const DataCell(Text('',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,
                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),








                                    ]),
                                DataRow(


                                    cells: [


                                      const DataCell(Text('',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,
                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),








                                    ]),
                                DataRow(


                                    cells: [


                                      const DataCell(Text('',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,
                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),








                                    ]),
                                DataRow(


                                    cells: [


                                      const DataCell(Text('',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,
                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),








                                    ]),
                                DataRow(


                                    cells: [


                                      const DataCell(Text('',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,
                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),








                                    ]),
                                DataRow(


                                    cells: [


                                      const DataCell(Text('',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),

                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,
                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),
                                      DataCell(TextField(
                                          controller: Igst,


                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          )),),








                                    ]),



                                // more rows here
                              ],
                            ),
                            if (_showSidebar) Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                color: Colors.grey,
                                width: 200,
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(13),
                                          child: Align(alignment:Alignment.bottomRight,child: Icon(Icons.close, size: 25,),),

                                        ),


                                        const SizedBox(height: 8,),
                                        CustomButton(onTap: (){

                                        },width:size*0.45, child:
                                        const Center(child: Text('Taxable Supplies',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), ))),
                                        const SizedBox(height: 13,),

                                        CustomButton(onTap: (){

                                        },width:size*0.45, child:
                                        const Center(child: Text('Debit/Credit Notes',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), ))),
                                        const SizedBox(height: 13,),
                                        CustomButton(onTap: (){

                                        },width:size*0.45, child:
                                        const Center(child: Text('Advance Paid',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), ))),
                                        const SizedBox(height: 13,),
                                        CustomButton(onTap: (){

                                        },width:size*0.45, child:
                                        const Center(child: Text('Advances Adjusted ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), ))),

                                        const SizedBox(height: 20,),
                                        const Text('Inward Suppliy GST(1+2+3-4)',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        const Text('Less Supply reverse charge',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        const SizedBox(height: 20,),
                                        const Text('Tax Liability on inward charge',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),


                                      ],
                                    )

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
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