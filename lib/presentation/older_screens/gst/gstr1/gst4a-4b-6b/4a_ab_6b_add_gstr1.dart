import 'package:flutter/material.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/models/business_profile_model.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/providers/providers_old/gst_onlinelist_add.dart';
import 'package:itax/providers/providers_old/gstr1_json_pro.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:provider/provider.dart';

import '../../../../../config_old/image_constant.dart';

import '4a_4b_6b_gstr1.dart';
import 'model_4a_4b_gstr1.dart';


class Table_gstr1_4a extends StatefulWidget {

  final BusinessProfile data;

  const Table_gstr1_4a({super.key, required this.data,});

  @override
  State<Table_gstr1_4a> createState() => _Table_gstr1_4aState();
}

class _Table_gstr1_4aState extends State<Table_gstr1_4a> {


  TextEditingController recieptDetails = TextEditingController();
  TextEditingController Trade_Legal = TextEditingController();
  TextEditingController Tax_payer = TextEditingController();
  TextEditingController Processed_record = TextEditingController();
  TextEditingController pendingInvoice = TextEditingController();
  TextEditingController AddInvoice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final gstr1 = Provider.of<MyDataModel>(context, listen: false);
    if (gstr1.myData == null ||
        gstr1.myData!.b2b.isEmpty) {
      return  OnlineIvoice4a(data: widget.data,);
    }

    return Scaffold(
      appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Table4a_gstr1(data: widget.data,)));
                  } ,style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue)
                  ),child: const Text('Add Record'),),
                  const SizedBox(height: 15,),
                  const Text('GSTIN :- ',style: TextStyle(fontSize: 22),),
                ],
              ),
            ),

            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                child: Column(

                    children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 20,
                        headingRowColor: WidgetStateColor.resolveWith((states) => Colors.blue),
                        columns: const [
                          DataColumn(label: Text('Reciept ',style: TextStyle(color: Colors.white),)),
                          DataColumn(label: Text('Reg/Comp',style: TextStyle(color: Colors.white))),
                          DataColumn(label: Text('Records',style: TextStyle(color: Colors.white))),
                          DataColumn(label: Text('Pending Invoice',style: TextStyle(color: Colors.white))),

                          // DataColumn(label: Text('Add invoice')),
                        ],
                          rows: gstr1.myData!.b2b.asMap().entries.map((entry) {
                            final index=entry.key+1;
                            final b2bData=entry.value;
                            final invData=b2bData.inv.first;
                              return DataRow(

                                onSelectChanged: (value)
                              {
                                  gstr1.setMyInvoice(index);
                                  print('row table ,$index');
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Table4a_gstr1(data: widget.data,)));


                                },
                                  cells: [
                                DataCell(Text(b2bData.ctin)),
                                DataCell(Text(invData.inum)),
                                DataCell(Text(invData.pos)),

                                DataCell(Text(invData.itms.first.itmDet.rt.toString())),


                              ]);

                          }).toList(), ),
                    ))
                ]),
              ),
            ),

          ],
      ),
        ),
    );
  }
}

  class MyDataRow {
  final String inum;

  MyDataRow({required this.inum});
  }



  class OnlineIvoice4a extends StatefulWidget {
    final BusinessProfile data;
    const OnlineIvoice4a({super.key, required this.data});

    @override
    State<OnlineIvoice4a> createState() => _OnlineIvoice4aState();
  }

  class _OnlineIvoice4aState extends State<OnlineIvoice4a> {
    List<Model_of_record_details> lst = [];


    TextEditingController recieptDetails =TextEditingController();
    TextEditingController Trade_Legal =TextEditingController();
    TextEditingController Tax_payer = TextEditingController();
    TextEditingController Processed_record = TextEditingController();
    TextEditingController pendingInvoice = TextEditingController();
    TextEditingController AddInvoice = TextEditingController();



//loading database gstr 4a
//     final dbHelper = Databasehelper.instance;
//     Future<void> loadData() async {
//
//       final allRows = await dbHelper.queryAll2();
//
//
//
//
//         // Update the text field controller with the name value
//         setState(() {
//           _dataList = List.generate(
//             allRows.length,
//                 (index) => Model_of_record_details(recept_details: allRows[index]['gsrn'].toString(), legal_name: allRows[index]['gsrn'].toString(), Taxpayer_type: allRows[index]['InvoiceNo'].toString(), processed_records: allRows[index]['InvoiceDate'].toString(), pending_errored_invoice: '', AddInvoice: '',
//             ),
//           );
//
//         });
//
//
//     }



    //delet data base funtion for gstr 4a

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RecordProvider>().loadData();

  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                children: [

         ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
               Table4a_gstr1(data: widget.data,)));

        }, style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
                 appTheme.blue800Af )
        ), child: const Text('Add Record',style: TextStyle(color: Colors.white),),),

                  const SizedBox(height: 15,),
                  const Text('Record Details ',style: TextStyle(fontSize: 22),),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Consumer<RecordProvider>(
      builder: (context, datalistpro, child) {

         return   SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                headingRowColor: WidgetStateColor.resolveWith((states) => appTheme.blue800Af),
                columns: const [
                  DataColumn(label: Text('Recipient Details ',style: TextStyle(color: Colors.white),)),
                  DataColumn(label: Text('Tade/Legal Name',style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('Taxpayer type',style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('processed Records',style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('pending/Errored',style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('pending/Errored',style: TextStyle(color: Colors.white))),
                  // DataColumn(label: Text('Add invoice')),
                ],
                rows: datalistpro.dataList2.asMap().entries.map((entry) {
                  final index = entry.key+1;
                  final data = entry.value;
                  return DataRow(
                    onSelectChanged: (value) {},
                    cells: [
                      DataCell(Text(data.recept_details.toString())),
                      DataCell(Text(data.Taxpayer_type.toString())),
                      DataCell(Text(data.processed_records.toString())),
                      DataCell(Text(data.pending_errored_invoice.toString())),
                      DataCell(Text(data.legal_name.toString())),
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {

                            datalistpro.delet(index);
                            print('no$index');
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
         }),

            // SizedBox(
            //   height: 500,
            //   child: ListView.builder(
            //       itemCount:  lst.length,
            //       itemBuilder: (content ,index){
            //         return SingleChildScrollView(
            //           scrollDirection: Axis.horizontal,
            //           child: Row(
            //             children: [
            //
            //               Text(lst[index].recept_details),
            //               Text(lst[index].legal_name),
            //               Text(lst[index].Taxpayer_type),
            //               Text(lst[index].processed_records),
            //               Text(lst[index].pending_errored_invoice),
            //               Text(lst[index].AddInvoice),
            //             ],
            //           ),
            //         );
            //   }),
            // )

          ],
        ),
      );
    }
  }
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 38.h,
    leading: AppbarLeadingIconbutton(
      onTap: (){
        Navigator.pop(context);
      },
      imagePath: ImageConstant.imgGoBack,
      margin: EdgeInsets.only(
        left: 13.h,
        top: 15.v,
        bottom: 15.v,
      ),
    ),
    centerTitle: true,
    title: AppbarTitle(
      text: "GSTR 1",
    ),
  );
}



