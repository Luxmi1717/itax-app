
import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/app_decoration.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/models/business_profile_model.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/providers/providers_old/bussiness_data.dart';
import 'package:itax/providers/providers_old/gstr3b_provider.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:provider/provider.dart';


import '../../../older_widgets/widgets/app_bar/appbar_title.dart';


class GSTRTable1 extends StatefulWidget {
  final BusinessProfile data;
  final String? year;
  final String? periods;
  const GSTRTable1({super.key, required this.data, required this.year, required this.periods});

  @override
  State<GSTRTable1> createState() => _GSTRTableState();
}

class _GSTRTableState extends State<GSTRTable1> {
  bool _showSidebar = false;
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    final gstr3b = Provider.of<GSTR3B>(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),

            child: Column(
              children: [
                _buildUserInfo(context,widget.year,widget.periods),



                const SizedBox(height: 30,),
                 Text('3.1 Details of Outward Supplies and inward supplies liable to revers charge',style: TextStyle(
                  color: appTheme.blue800Af,
                  fontWeight: FontWeight.bold,
                ),),





                Container(
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

                              const SizedBox(height: 10,),
                              Stack(
                                children: [


                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        columnSpacing: 9,
                                        sortColumnIndex: 0,
                                        sortAscending: true,
                                        headingRowColor: WidgetStateColor.resolveWith((states) => appTheme.blue800Af),
                                        dataRowColor: WidgetStateColor.resolveWith((states) => appTheme.blue800Af.withOpacity(0.1),),
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
                                            label: Text('Value'),

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
                                            label: Text('CESSS'),

                                            numeric: false,
                                          ),
                                        ],
                                        rows:  [
                                          DataRow(


                                              cells: [


                                                const DataCell(Text('(a)',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                                DataCell(TextField(
                                                  controller: gstr3b.value,



                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),
                                                    )),),

                                                DataCell(TextField(
                                                    controller: gstr3b.igst,



                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),

                                                DataCell(TextField(
                                                    controller: gstr3b.cgst,


                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),
                                                DataCell(TextField(
                                                    controller: gstr3b.sgst,


                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),
                                                DataCell(TextField(
                                                    controller: gstr3b.cess,


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


                                                const DataCell(Text('(b)',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                                DataCell(TextField(
                                                    controller: gstr3b.valueB,




                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),

                                                DataCell(TextField(
                                                    controller: gstr3b.igstB,


                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),

                                                DataCell(TextField(
                                                    controller: gstr3b.cgstB,
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
                                                    controller: gstr3b.sgstB,

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
                                                    controller: gstr3b.cessB,


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


                                                const DataCell(Text('(c)',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                                DataCell(TextField(

                                                  controller: gstr3b.valueC,




                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),

                                                DataCell(TextField(
                                                    controller: gstr3b.igstC,
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
                                                    controller: gstr3b.cgstC,

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
                                                    controller: gstr3b.sgstC,

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
                                                    controller: gstr3b.cessC,

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


                                                const DataCell(Text('(d)',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                                DataCell(TextField(
                                                    controller: gstr3b.valueD,



                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),

                                                DataCell(TextField(
                                                    controller: gstr3b.igstD,

                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),

                                                DataCell(TextField(
                                                    controller: gstr3b.cgstD,


                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),
                                                DataCell(TextField(
                                                    controller: gstr3b.sgstD,


                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),
                                                DataCell(TextField(
                                                    controller: gstr3b.cessD,


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


                                                const DataCell(Text('(e)',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                                DataCell(TextField(
                                                    controller: gstr3b.valueE,



                                                    decoration: const InputDecoration(
                                                      hintText: '',
                                                      border: OutlineInputBorder(),
                                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Color(0xFFECEFF1),


                                                    )),),

                                                DataCell(TextField(
                                                    controller: gstr3b.igstE,
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
                                                    controller: gstr3b.cgstE,

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
                                                    controller: gstr3b.sgstE,

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
                                                    controller: gstr3b.cessE,

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




                                          // more rows here
                                        ],
                                      ),
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


                                              SizedBox(height: 10,),
                                              Text('(a)Outward taxable supplies (other then zero rated, nil rated and exempted',style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              SizedBox(height: 10,),
                                              Text('(b) Outward taxable supplies (zero rated)',style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              SizedBox(height: 10,),

                                              Text('(c) Other outward supplies (Nil rated, Exempted',style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),),

                                              SizedBox(height: 10,),
                                              Text('(d) Inward supplies (liable to reverse charge)',style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              SizedBox(height: 10,),
                                              Text(' (e) Non-GST outward supplies',style: TextStyle(
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


                      ],
                    ),
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
                    CustomButton(onTap: () {
                      gstr3b.setgstvalue();
                    }, width: size.width*0.4, child: const Center(
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
      text: "GSTR 3B",
    ),
  );
}
