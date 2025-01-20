import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/app_decoration.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/models/business_profile_model.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/providers/providers_old/gst_onlinelist_add.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:provider/provider.dart';


import '8a_8b_8c_8d_invoice_result.dart';



class Gst8a_8b_8c_8d extends StatefulWidget {
  final BusinessProfile data;
  const Gst8a_8b_8c_8d({super.key, required this.data});

  @override
  State<Gst8a_8b_8c_8d> createState() => _Gst8a_8b_8c_8dState();
}

class _Gst8a_8b_8c_8dState extends State<Gst8a_8b_8c_8d> {



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
                      Gst8a_8b_8c_8d_Result(data: widget.data,)));

                }, style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        appTheme.blue800Af)
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
                      DataColumn(label: Text('Place of Supply ',style: TextStyle(color: Colors.white),)),
                      DataColumn(label: Text('Rate',style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('Total Taxable',style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('Integrated',style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('Central Tax',style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('State Tax',style: TextStyle(color: Colors.white))),

                      DataColumn(label: Text('Cess',style: TextStyle(color: Colors.white))),
                      // DataColumn(label: Text('Add invoice')),
                    ],
                    rows: datalistpro.dataListGst7_b2c.map((data) => DataRow(
                      onSelectChanged: (value){

                      },
                      cells: [
                        DataCell(Text(data.Place_of_supply.toString())),
                        DataCell(Text(data.Rate.toString())),

                        DataCell(Text(data.Total_taxable.toString())),
                        DataCell(Text(data.Integrated.toString())),
                        DataCell(Text(data.central_tax.toString())),
                          DataCell(Text(data.State_tax.toString())),
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


  Widget _buildUserInfo(BuildContext context) {


    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.gradientBlueToBlueAf.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
          Padding(
            padding: EdgeInsets.only(
              left: 7.h,
              right: 4.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GSTN :",
                  style: CustomTextStyles.labelLargeMedium,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    " ",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const Spacer(),
                Text(
                  '',
                  style: CustomTextStyles.labelLargeMedium,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text(
                    "     ",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),

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