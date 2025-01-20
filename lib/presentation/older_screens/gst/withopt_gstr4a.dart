
import 'package:flutter/material.dart';
import 'package:itax/providers/providers_old/nav_provider.dart';
import 'package:provider/provider.dart';


class WithotpGstr extends StatefulWidget {
  const WithotpGstr({super.key});

  @override
  State<WithotpGstr> createState() => _WithotpGstrState();
}

class _WithotpGstrState extends State<WithotpGstr> {


    TextEditingController Igst = TextEditingController();
    TextEditingController cgst = TextEditingController();
    TextEditingController sgst = TextEditingController();
    TextEditingController cess = TextEditingController();
    @override
    Widget build(BuildContext context) {
      var size =MediaQuery.of(context).size;


      final navProvider = Provider.of<NavProvider>(context);
      return WillPopScope(
          onWillPop: () async {
        navProvider.pop();
        return false;
      },child:Scaffold(
        appBar: AppBar(
          title: const Text('GSTR4A'),
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
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width,
                          child: DataTable(
                            columnSpacing: 8,
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
                                label: Text('GSTIN'),

                                numeric: false,
                              ),
                              DataColumn(
                                label: Text('By Us'),

                                numeric: false,
                              ),
                              DataColumn(
                                label: Text('By Cp'),

                                numeric: false,
                              ),

                              DataColumn(
                                label: Text('Total'),

                                numeric: false,
                              ),

                            ],
                            rows:  [
                              DataRow(
                                cells: [
                                  const DataCell(Text('Count',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    controller: cgst,
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



                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('value',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    controller: cgst,
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



                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('Texable',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    controller: cgst,
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



                                ],
                              ),
                              DataRow(
                                  cells: [


                                    const DataCell(Text('IGST',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

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
                                  const DataCell(Text('CGST',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    controller: cgst,
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



                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('SGST',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                      controller: sgst,
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


                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('CESS',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                      controller: cess,
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



                                ],
                              ),













                              // more rows here
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
      ));
    }
  }

