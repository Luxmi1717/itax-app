import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/models/business_profile_model.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/providers/providers_old/gst_onlinelist_add.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:provider/provider.dart';

import '6a_export_invoice_result.dart';


class Gst6a_export extends StatefulWidget {

  final BusinessProfile data;
  const Gst6a_export({super.key, required this.data});

  @override
  State<Gst6a_export> createState() => _Gst6a_exportState();
}

class _Gst6a_exportState extends State<Gst6a_export> {



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
                       Gst6a_export_Result(data:widget.data,)));

                }, style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        appTheme.blue800Af)
                ),child: const Text('Add Record',style: TextStyle(color: Colors.white),),),

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
                      DataColumn(label: Text('Invoice no. ',style: TextStyle(color: Colors.white),)),
                      DataColumn(label: Text('Invoice data',style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('GST Payment',style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('Total Invoice val',style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('Total taxable val',style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('Integrate tax',style: TextStyle(color: Colors.white))),

                      DataColumn(label: Text('Cess',style: TextStyle(color: Colors.white))),
                      // DataColumn(label: Text('Add invoice')),
                    ],
                    rows: datalistpro.dataListGst6a_export.map((data) => DataRow(
                      onSelectChanged: (value){

                      },
                      cells: [
                        DataCell(Text(data.Invoice_no.toString())),
                        DataCell(Text(data.Invoice_data.toString())),
                        DataCell(Text(data.Total_invoice.toString())),
                        DataCell(Text(data.GSTPayment.toString())),
                        DataCell(Text(data.Total_taxable.toString())),
                        DataCell(Text(data.Integrate_tax.toString())),
                        DataCell(Text(data.cess.toString())),
                      ],
                    )).toList(),),
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
      text: "Page",
    ),
  );
}