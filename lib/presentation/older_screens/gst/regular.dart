


import 'package:flutter/material.dart';
import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/sqflite_local_database.dart';
import 'package:itax/config_old/theme/app_decoration.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/models/business_profile_model.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/presentation/older_widgets/widgets/gst_card.dart';
import 'package:itax/providers/providers_old/bussiness_data.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:provider/provider.dart';


import 'gst9_credit_debit_unRegisted/gst9_credit_debit_unRegisted_page.dart';
import 'gstr1/gst11a1_11a2_tax/gst11a1_11a2_tax_invoice_result.dart';
import 'gstr1/gst4a-4b-6b/4a_ab_6b_add_gstr1.dart';
import 'gstr1/gst5a-b2c/5a-b2c(large)_invoice.dart';
import 'gstr1/gst6a_export_invoice/6a_export_invoice.dart';
import 'gstr1/gst7b-b2c/7-b2c-invoice.dart';
import 'gstr1/gst8a_8b_8c_8d/8a_8b_8c_8d_invoice_result.dart';
import 'gstr1/gst9c_credut_debit_registed/9c_credut_debit_invoice_result.dart';

class RegularPage extends StatefulWidget {
  const RegularPage({super.key});

  @override
  State<RegularPage> createState() => _RegularPageState();
}

class _RegularPageState extends State<RegularPage> {

  late List<Map<String, dynamic>> _personList;
  final dbhelper=Databasehelper.instance;

  var _isChecked;
  bool _isExpanded = false;
  String LigalName='';
  String Gstin ='';

  String? gstinNumber;
  String? FyearValue;
  String? PeriodValue;
  String? month_number;
  String?  yearValue;
  String? fb;
  String ? tradeName;



  void quaryall()async{
    var allrows=await dbhelper.quaryall();
    for (var row in allrows) {
      print(row);
    }

  }


  Future init() async {
    final gstin=await UserSecureStorage.getGSTIN();
    final year=await UserSecureStorage.getFYear();

    final period=await UserSecureStorage.getPeriod();
    final Fyear = year?.split('-')[0];
    Map<String, String> monthMapping = {
      "January": "01",
      "February": "02",
      "March": "03",
      "April": "04",
      "May": "05",
      "June": "06",
      "July": "07",
      "August": "08",
      "September": "09",
      "October": "10",
      "November": "11",
      "December": "12",
    };


    String? monthNumber = monthMapping[period];

    setState(() {
      gstinNumber=gstin;
      FyearValue=year;
      PeriodValue=period;
      month_number=monthNumber;
      yearValue=Fyear;
    });

  }



  Future<void> loadData() async {
    final dbHelper = Databasehelper.instance;
    final allRows = await dbHelper.quaryall();

    if (allRows.isNotEmpty) {
      final firstRow = allRows.first;
      final name = firstRow[Databasehelper.columnName];
      final gst = firstRow[Databasehelper.columnGst];

      // Update the text field controller with the name value
      setState(() {
        LigalName = name.toString();
        Gstin=gst.toString();


      });

    }
  }

  late final token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    quaryall();

    init();


  }



  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Consumer<GstBussinessData>(builder: (BuildContext context,data,child){
        return SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _buildUserInfo(context,data.BusinessProfiledata ),


                const SizedBox(height: 20,),
                ExpansionTile(
                  backgroundColor: appTheme.blue800.withOpacity(0.1),
                  collapsedBackgroundColor: appTheme.blue800.withOpacity(0.1),

                  title: const Text('ADD RECORD DETAILS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),


                  initiallyExpanded: false,
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Table_gstr1_4a(data: data.BusinessProfiledata,)));
                                  },
                                  child: Card1(text: '4A,4B,6B,6C-B2B Invoices')),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Gst4a_B2C(data: data.BusinessProfiledata,)));
                                },
                                  child: Card1(text: '5A-B2C (Large invoices)')),

                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Gst6a_export(data: data.BusinessProfiledata,)));
                                  },
                                  child: Card1(text: '6A-Export invoice')),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Gst7_b2c(data: data.BusinessProfiledata,)));
                                  },
                                  child: Card1(text: '7-B2C(OThers)')),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Gst8a_8b_8c_8d_Result(data: data.BusinessProfiledata,)));
                                  },

                                  child: Card1(text: '8A,8B,8C,8D-Nil Rated Supplies')),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Gst9c_credut_debit_Result(data: data.BusinessProfiledata,)));
                                  },
                                  child: Card1(text: '9B-Credut/Debit Notes (Registed)')),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Gst9CrDtUnRegisted(data: data.BusinessProfiledata,)));
                                  },
                                  child: Card1(text: '9B-Credut/Debit Notes (unRegisted)')),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Gst11a1TaxInvoice(data: data.BusinessProfiledata,)));
                                  },
                                  child: Card1(text: '11A(1),11A(2)-Tax Liability(advances Received')),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Gst7_b2c(data: data.BusinessProfiledata,)));
                                  },
                                  child: Card1(text: '11B(1),11B(2)-Adjustment of(advances)')),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Gst7_b2c(data: data.BusinessProfiledata,)));
                                  },
                                  child: Card1(text: '12-HSN-wise summary of outword supplies')),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card1(text: 'Document Issued'),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                ExpansionTile(
                  backgroundColor: appTheme.blue800.withOpacity(0.1),
                  collapsedBackgroundColor: appTheme.blue800.withOpacity(0.1),

                  title: const Text('AMEND RECORD DETAILS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),


                  initiallyExpanded: false,
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card1(text: '9A-Amended B2B Invoices'),
                              Card1(text: '9A-Amended B2C (Large) Invoices'),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card1(text: '9A-Amended Exports Invoices'),
                              Card1(text: '9A-Amended Credit/Debit Notes (Registered)'),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card1(text: '9A-Amended Credit/Debit Notes (UnRegistered)'),
                              Card1(text: '10-Amendedv B2C(others'),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card1(text: '11A-Amended Tax Liability (advances Received'),
                              Card1(text: '11A-Amended of Adjustment of Advances Received'),
                            ],
                          ),




                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                ExpansionTile(
                  backgroundColor: appTheme.blue800.withOpacity(0.1),
                  collapsedBackgroundColor: appTheme.blue800.withOpacity(0.1),

                  title: const Text('E-INVOICE DOWNLOAD HISTORY',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),


                  initiallyExpanded: false,
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [

                    Card1(text: 'availble for download'),
                    const SizedBox(height: 10,)

                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(onTap: () {  }, width: size.width*0.44,
                      child:
                      const Center(child: Text('VIEW',
                        style: TextStyle(fontWeight:FontWeight.bold,

                          color: Colors.white,
                        ),),
                      ),),
                    CustomButton(onTap: () {}, width: size.width*0.44,
                      child:
                      const Center(child: Text('DOWNLOAD',
                        style: TextStyle(fontWeight:FontWeight.bold,

                          color: Colors.white,
                        ),),
                      ),),
                  ],
                ),


              ],
            ),
          ),

        ),
      );}),

    );
  }



  Widget _buildUserInfo(BuildContext context, BusinessProfile  data) {

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
                    data.result!.businessName??   'sethi@231',
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const Spacer(),
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
                    data.result!.gstNo??'23BNJPS3408M1ZP',
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
                    " ${PeriodValue??' Unselect'}  ",
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
                  child: Text(yearValue??' Unselect',
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const Spacer(),
                Text(
                  'Status :',
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
      text: "GSTR-1/IFF",
    ),
  );
}


