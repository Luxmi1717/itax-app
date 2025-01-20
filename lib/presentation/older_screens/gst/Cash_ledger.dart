
import 'package:flutter/material.dart';
import 'package:itax/providers/providers_old/gst_api.dart';
import 'package:provider/provider.dart';


class CashLadger extends StatefulWidget {
  const CashLadger({super.key});

  @override
  State<CashLadger> createState() => _CashLadgerState();
}

class _CashLadgerState extends State<CashLadger> {
  TextEditingController Igst = TextEditingController();
  TextEditingController cgst = TextEditingController();
  TextEditingController sgst = TextEditingController();
  TextEditingController cess = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    final cashledg = Provider.of<GstSection>(context);
    Igst.value =
        TextEditingValue(text: cashledg.CashLedger.data!.company.data.cashBal.igstTotBal.toString());
    cgst.value =
        TextEditingValue(text: cashledg.CashLedger.data!.company.data.cashBal.cessTotBal.toString());
    sgst.value =
        TextEditingValue(text: cashledg.CashLedger.data!.company.data.cashBal.sgstTotBal.toString());
    cess.value =
        TextEditingValue(text: cashledg.CashLedger.data!.company.data.cashBal.sgstTotBal.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronic Liability Register'),
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
                              label: Text('Ledger Bal'),

                              numeric: false,
                            ),
                            DataColumn(
                              label: Text('1'),

                              numeric: false,
                            ),

                          ],
                          rows:  [
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
    );
  }
}


