
import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/app_decoration.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/models/business_profile_model.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/providers/providers_old/bussiness_data.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:provider/provider.dart';



class Table5_gstr3b extends StatefulWidget {
  final BusinessProfile data;
  final String? year;
  final String? periods;
  const Table5_gstr3b({super.key, required this.data, required this.year, required this.periods});

  @override
  State<Table5_gstr3b> createState() => _Table5_gstr3bState();
}

class _Table5_gstr3bState extends State<Table5_gstr3b> {
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _buildUserInfo(context,widget.year,widget.periods),
                const SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.all(10),
                  color:appTheme.blue800Af,
                  child: const Text('5. Values of emempt, nill rated and non-GST INword supplies',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                ),


                const SizedBox(height: 10,),


                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 8,
                    sortColumnIndex: 0,
                    sortAscending: true,
                    headingRowColor: WidgetStateColor.resolveWith((states) => appTheme.blue800Af),
                    dataRowColor: WidgetStateColor.resolveWith((states) => appTheme.blue800Af.withOpacity(0.1),),

                    dataRowHeight: 80,

                    headingTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    columns: const [
                      DataColumn(
                        label: Text('Nature of Supplies'),

                        numeric: false,
                      ),
                      DataColumn(
                        label: Text('Inter-state ₹'),

                        numeric: false,
                      ),
                      DataColumn(
                        label: Text('intra-state ₹'),

                        numeric: false,
                      ),


                    ],
                    rows: const [
                      DataRow(
                          cells: [

                            DataCell(Text('From a supplier under compo-\nsition schema Exempt and Nil',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                            DataCell(TextField(
                                decoration: InputDecoration(
                                  hintText: '',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color(0xFFECEFF1),


                                )),),
                            DataCell(TextField(
                                decoration: InputDecoration(
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
                          DataCell(Text('Non GST supply',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                          DataCell(TextField(
                              decoration: InputDecoration(
                                hintText: '',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                isDense: true,
                                filled: true,
                                fillColor: Color(0xFFECEFF1),


                              )),),
                          DataCell(TextField(
                              decoration: InputDecoration(
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
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    CustomButton(onTap: () {  }, width: size.width*0.4, child: const Center(child: Text('CANCEL',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))),),
                    CustomButton(onTap: () {  }, width: size.width*0.4, child: const Center(
                      child: Text('CONFORM',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                    ),),

                  ],
                ),





              ],
            ),
          ),

        ),
      ),
    );
  }
  Widget _buildUserInfo(BuildContext context,year,period) {
    return Consumer<GstBussinessData>(builder: (BuildContext context,data,child)
    {
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
                    "User Name :",
                    style: CustomTextStyles.labelLargeMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      data.BusinessProfiledata.result!.businessName ?? "",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Trade Name :',
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
            SizedBox(height: 5.v),
            Padding(
              padding: EdgeInsets.only(left: 7.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "GSTIN : ",
                    style: CustomTextStyles.labelLargeMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      data.BusinessProfiledata.result!.gstNo ?? "",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Period: ",
                    style: CustomTextStyles.labelLargeMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.h),
                    child: Text(
                      '${period??'April'}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),

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
                    "FY :",
                    style: CustomTextStyles.labelLargeMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text('${year??'2023'}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Status : ',
                    style: CustomTextStyles.labelLargeMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.h),
                    child: Text("Regular",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
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
      text: "Exempt Nil and Non GST",
    ),
  );
}

