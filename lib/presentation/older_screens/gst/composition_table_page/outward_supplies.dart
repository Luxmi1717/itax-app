
import 'package:flutter/material.dart';
import 'package:itax/providers/providers_old/gst_calculation_outward.dart';
import 'package:provider/provider.dart';


class OutwardSupplies extends StatefulWidget {
  const OutwardSupplies({super.key});

  @override
  State<OutwardSupplies> createState() => _OutwardSuppliesState();
}

class _OutwardSuppliesState extends State<OutwardSupplies> {
  TextEditingController Igst = TextEditingController();
  TextEditingController cgst = TextEditingController();
  TextEditingController sgst = TextEditingController();
  TextEditingController cess = TextEditingController();


  bool _showSidebar = false;
  @override
  Widget build(BuildContext context) {
    final gstCal = Provider.of<GstCalculation>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outward Supplies Details for current Quarter'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GestureDetector(
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
                          Stack(
                            children: [



                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: DataTable(
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
                                      label: Text('Turnover'),

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

                                  ],
                                  rows:  [
                                    DataRow(


                                        cells: [


                                          const DataCell(Text('0%',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                          DataCell(TextField(
                                              controller: Igst,
                                              enabled: false,

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
                                              enabled: false,

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

                                              enabled: false,
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
                                        const DataCell(Text('1%',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                        DataCell(TextField(
                                          onChanged: (value){
                                            gstCal.setPercent();
                                            gstCal.set1present();
                                            gstCal.settotalPercent();
                                            gstCal.settotalpresent();
                                          },

                                          controller: gstCal.turnover1,
                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          ),

                                        ),),
                                        DataCell(TextField(
                                            controller: gstCal.cgst1,
                                            enabled: false,


                                            decoration: const InputDecoration(
                                              hintText: '',
                                              border: OutlineInputBorder(),
                                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),isDense: true,
                                              filled: true,
                                              fillColor: Color(0xFFECEFF1),


                                            )),),
                                        DataCell(TextField(
                                            controller: gstCal.sgst1,
                                            enabled: false,


                                            decoration: const InputDecoration(
                                              hintText: '',
                                              border: OutlineInputBorder(),
                                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                              isDense: true,
                                              filled: true,
                                              fillColor: Color(0xFFECEFF1),


                                            )),),




                                      ],
                                    ),

                                    DataRow(
                                      cells: [
                                        const DataCell(Text('2%',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                        DataCell(TextField(
                                          onChanged: (value){
                                            gstCal.set2Percent();
                                            gstCal.set2present();
                                            gstCal.settotalPercent();
                                            gstCal.settotalpresent();
                                          },
                                          controller: gstCal.turnover2,
                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          ),

                                        ),),
                                        DataCell(TextField(
                                            controller: gstCal.cgst2,
                                            enabled: false,


                                            decoration: const InputDecoration(
                                              hintText: '',
                                              border: OutlineInputBorder(),
                                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                              isDense: true,
                                              filled: true,
                                              fillColor: Color(0xFFECEFF1),


                                            )),),
                                        DataCell(TextField(
                                            controller: gstCal.sgst2,
                                            enabled: false,


                                            decoration: const InputDecoration(
                                              hintText: '',
                                              border: OutlineInputBorder(),
                                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                              isDense: true,
                                              filled: true,
                                              fillColor: Color(0xFFECEFF1),


                                            )),),




                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(Text('5%',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                        DataCell(TextField(
                                          onChanged: (value){
                                            gstCal.set5Percent();
                                            gstCal.set5present();
                                            gstCal.settotalPercent();
                                            gstCal.settotalpresent();
                                          },
                                          controller: gstCal.turnover5,
                                          decoration: const InputDecoration(
                                            hintText: '',
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                            isDense: true,
                                            filled: true,
                                            fillColor: Color(0xFFECEFF1),


                                          ),

                                        ),),
                                        DataCell(TextField(
                                            controller: gstCal.gst5,
                                            enabled: false,


                                            decoration: const InputDecoration(
                                              hintText: '',
                                              border: OutlineInputBorder(),
                                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                              isDense: true,
                                              filled: true,
                                              fillColor: Color(0xFFECEFF1),


                                            )),),
                                        DataCell(TextField(
                                            controller: gstCal.sgst5,
                                            enabled: false,


                                            decoration: const InputDecoration(
                                              hintText: '',
                                              border: OutlineInputBorder(),
                                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                              isDense: true,
                                              filled: true,
                                              fillColor: Color(0xFFECEFF1),


                                            )),),




                                      ],
                                    ),
                                    DataRow(


                                        cells: [


                                          const DataCell(Text('Total',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                          DataCell(TextField(
                                              controller: gstCal.turnovertotal,
                                              enabled: false,


                                              decoration: const InputDecoration(
                                                hintText: '',
                                                border: OutlineInputBorder(),
                                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                isDense: true,
                                                filled: true,
                                                fillColor: Color(0xFFECEFF1),


                                              )),),

                                          DataCell(TextField(
                                            enabled: false,
                                              controller: gstCal.cgsttotal,


                                              decoration: const InputDecoration(
                                                hintText: '',
                                                border: OutlineInputBorder(),
                                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                isDense: true,
                                                filled: true,
                                                fillColor: Color(0xFFECEFF1),


                                              )),),

                                          DataCell(TextField(
                                            enabled: false,
                                              controller: gstCal.sgsttotal,


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
                              ),
                              if (_showSidebar) Positioned(
                                left: 0,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  color: Colors.grey,
                                  width: 200,
                                  child: const Column(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(13),
                                            child: Align(alignment:Alignment.bottomRight,child: Icon(Icons.close, size: 25,),),

                                          ),


                                          SizedBox(height: 29,),
                                          Text('Intra-state supplies',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                          SizedBox(height: 29,),
                                          Text('Intra-state supplies',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                          SizedBox(height: 20,),

                                          Text('Intra-state supplies',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),),

                                          SizedBox(height: 20,),
                                          Text('Intra-state supplies',style: TextStyle(
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
                        ],
                      ),
                    ),

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