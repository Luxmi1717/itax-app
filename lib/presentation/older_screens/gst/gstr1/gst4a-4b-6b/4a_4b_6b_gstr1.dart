
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/sqflite_local_database.dart';
import 'package:itax/config_old/theme/app_decoration.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/cubits/business_profile_cubit.dart';
import 'package:itax/models/business_profile_model.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/providers/providers_old/gst_onlinelist_add.dart';
import 'package:itax/providers/providers_old/gstr1_json_pro.dart';
import 'package:itax/providers/providers_old/rate_percent_calculation.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';




class Table4a_gstr1 extends StatefulWidget {
  final BusinessProfile data;
   const Table4a_gstr1({super.key, required this.data, });

  @override
  State<Table4a_gstr1> createState() => _Table4a_gstr1State();
}

class _Table4a_gstr1State extends State<Table4a_gstr1> {
  TextEditingController gstn =TextEditingController();
  TextEditingController POS =TextEditingController();
  TextEditingController InvoicNO =TextEditingController();
  TextEditingController Rate =TextEditingController();
  TextEditingController InvoicDate =TextEditingController();
  TextEditingController InvoicValue =TextEditingController();
  TextEditingController SGSTAmount =TextEditingController();
  TextEditingController CgstAmount =TextEditingController();
  TextEditingController IgstAmount =TextEditingController();
  TextEditingController Nature =TextEditingController();
  TextEditingController  recieptDetails=TextEditingController();
  TextEditingController Trade_Legal =TextEditingController();
  TextEditingController Tax_payer = TextEditingController();
  TextEditingController Processed_record = TextEditingController();
  TextEditingController pendingInvoice = TextEditingController();
  TextEditingController AddInvoice = TextEditingController();
  TextEditingController Source = TextEditingController();


  final dbhelper2=Databasehelper.instance;
   insert()   async{
    Map<String,dynamic> row={
      Databasehelper.columnGsrn:gstn.text,
      Databasehelper.columnPos:POS.text,
      Databasehelper.columnInvoiceNo:InvoicNO.text,
      Databasehelper.columnInvoiceDate:InvoicDate.text,
      Databasehelper.columnInvoiceValue:InvoicValue.text,
      Databasehelper.columnCgst:CgstAmount.text,
      Databasehelper.columnSgst:SGSTAmount.text,
      Databasehelper.columnRate:Rate.text,
      Databasehelper.columnNature:Nature.text,
      Databasehelper.columnSource:Source.text,

    } ;
    final id =await dbhelper2.insert2(row);
  }

  void quaryall()async{
    var allrows=await dbhelper2.queryAll2();
    for (var row in allrows) {
      print(row);

    }

  }
  String? gstinNumber;
  String? FyearValue;
  String? PeriodValue;
  String? month_number;
  String?  yearValue;
  String? fb;
  late final token;

  @override
  void initState() {


    super.initState();
    init();


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



  String selectedState = 'Select';
  int stateCode = 0;

  final List<String> indianStates = [
    'Select',
    '37 Andhra Pradesh',
    '12 Arunachal Pradesh',
    '18 Assam',
    '10 Bihar',
    '22 Chhattisgarh',
    '30 Goa',
    '24 Gujarat',
    '6 Haryana',
    '02 Himachal Pradesh',
    '20 Jharkhand',
    '29 Karnataka',
    '32 Kerala',
    '23 Madhya Pradesh',
    '27 Maharashtra',
    '14 Manipur',
    '17 Meghalaya',
    '15 Mizoram',
    '13 Nagaland',
    '21 Odisha',
    '03 Punjab',
    '08 Rajasthan',
    '11 Sikkim',
    '33 Tamil Nadu',
    '36 Telangana',
    '16 Tripura',
    '09 Uttar Pradesh',
    '05 Uttarakhand',
    '19 West Bengal',
    '35 Andaman and Nicobar Islands',
    '04 Chandigarh',
    '26 Dadra and Nagar Haveli and Daman and Diu',
    '31 Lakshadweep',
    '07 Delhi',
  ];


  final List<String> rateValue = [
    '0%',
    '0.1%',
    '0.25%',
    '1%',
    '1.5%',
    '3%',
    '5%',
    '6%',
    '7.5%',
    '12%',
    '18%',
    '20%',
  ];

  String ratevalue='0%';
  String supplyType = "";
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    final gstr1=Provider.of<MyDataModel>(context, listen: false);
    if(gstr1.myData!=null)
      {
     final b2b=gstr1.myData?.b2b[gstr1.selectinvoice!-1];
    print('page row +${gstr1.selectinvoice}');

    final inv=b2b!.inv.first;
    gstn.value = TextEditingValue(text: b2b.ctin.toString() ?? '',);
    POS.value =
        TextEditingValue(text: inv.pos.toString() ?? '',);
    InvoicValue.value =
        TextEditingValue(text: inv.val.toString() ?? '',);
    InvoicDate.value =
        TextEditingValue(text: inv.idt.toString() ?? '',);
    InvoicNO.value =
        TextEditingValue(text: inv.inum.toString() ?? '',);
    Nature.value =
        TextEditingValue(text: '${inv.invTyp}:-Regular' ?? '',);



    print('IDT: ${inv.idt}');
    print('VAL: ${inv.val}');
    print('POS: ${inv.pos}');
    print('RCHRG: ${inv.rchrg}');
    for (var itm in inv.itms) {
      print('NUM: ${itm.num}');
      print('TX_VAL: ${itm.itmDet.txVal}');
      print('RT: ${itm.itmDet.rt}');
      Rate.value =
          TextEditingValue(
            text: '${itm.itmDet.rt}% Rate item' ?? '',);
      print('CAMT: ${itm.itmDet.camt}');
      print('SAMT: ${itm.itmDet.samt}');
      SGSTAmount.value =
          TextEditingValue(text: itm.itmDet.samt.toString() ?? '',);
      print('CSAMT: ${itm.itmDet.csamt}');
      CgstAmount.value =
          TextEditingValue(text: itm.itmDet.camt.toString() ?? '',);
    }
}


    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocConsumer<BusinessProfileCubit, BusinessProfileState>(
  listener: (context, state) {
    if (state is BusinessProfileErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
    } else if (state is BusinessProfileLoadedState) {
      final data = state.businessProfile;

    }
  },

  builder: (context, state) {
    return SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                _buildUserInfo(context,widget.data),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 20,),
                      SizedBox(
                        width: size.width,

                        child: Consumer<RatePercentCalculation>(builder: (BuildContext context ,data ,child ,){
                          return DataTable(
                          columnSpacing: 55,
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
                              label: Text('sr No'),

                              numeric: false,
                            ),

                            DataColumn(
                              label: Text('1'),

                              numeric: false,
                            ),

                          ],

                          rows: [

                            DataRow(

                                cells: [

                                  const DataCell(Text('GSRN',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                  DataCell(


                                    SizedBox(
                                      width: size.width*.6,
                                    child: TextField(
                                          controller: gstn,

                                        decoration: const InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,


                                        )),

                                  ),),
                                ]),
                            DataRow(
                              cells: [
                                const DataCell(Text('POS',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(

                                        decoration: BoxDecoration(
                                          color: appTheme.whiteA700,
                                          border: Border.all(
                                            color: appTheme.black900,
                                            width: 1.h,
                                            strokeAlign: strokeAlignOutside,


                                          ),
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: selectedState,

                                            onChanged: (value) {
                                              setState(() {
                                                selectedState = value!;
                                              });
                                              if(value!.length>=2){
                                                stateCode= int.tryParse(value.substring(0,2))??-1;
                                              }

                                              print(stateCode);
                                              String? resVal;
                                              if (widget.data.result!.gstNo != null && widget.data.result!.gstNo!.length >= 2) {
                                                resVal = widget.data.result!.gstNo!.substring(0, 2); // Get the first two characters
                                              }
                                              print(resVal);
                                              if(resVal == stateCode.toString()){
                                                supplyType = "inter state";
                                                print(supplyType);
                                              }else {
                                                supplyType = "intra state";
                                                print(supplyType);
                                              }
                                            },
                                            items: indianStates.map<DropdownMenuItem<String>>((String state) {
                                              return DropdownMenuItem<String>(
                                                value: state,
                                                child: Text(state,style: const TextStyle(color: Colors.black),),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                const DataCell(Text('Invoice No.',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(SizedBox(
                                  width: size.width*.6,
                                  child: TextField(
                                    controller: InvoicNO,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,

                                        fillColor: Colors.white,

                                      )),
                                ),),


                              ],

                            ),
                            DataRow(
                              cells: [
                                const DataCell(Text('Invoice Date',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(SizedBox(
                                  width: size.width*.6,
                                  child: TextField(
                                    controller: InvoicDate,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,


                                      )),
                                ),),


                              ],
                            ),
                            DataRow(
                              cells: [
                                const DataCell(Text('Invoice value',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(Container(
                                  child: TextField(
                                    controller: InvoicValue ,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,


                                      )),
                                ),),


                              ],
                            ),

                            DataRow(
                              cells: [
                                const DataCell(Text('Rate ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(

                                    decoration: BoxDecoration(
                                      color: appTheme.whiteA700,
                                      border: Border.all(
                                        color: appTheme.black900,
                                        width: 1.h,
                                        strokeAlign: strokeAlignOutside,


                                      ),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: ratevalue,
                                        onChanged: (value) {
                                          setState(() {
                                            ratevalue = value!;

                                            double convertedValue = Utils().convertPercentageToDouble(value);
                                            print('Converted Rate: $convertedValue');
                                            double invoiceValue = 0.0;
                                            try {
                                              invoiceValue = double.tryParse(InvoicValue.text) ?? 0.0;

                                              data.Ratecalculate(convertedValue,invoiceValue);
                                            } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter the Value')));


                                            }

                                          });
                                          },
                                        items: rateValue.map<DropdownMenuItem<String>>((String rate) {
                                          return DropdownMenuItem<String>(
                                            value: rate,
                                            child: Text(rate),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),),


                              ],
                            ),
                            DataRow(
                              cells: [
                                const DataCell(Text('Nature',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(SizedBox(
                                  width: size.width*.6,
                                  child: TextField(
                                    controller: Nature,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,


                                      )),
                                ),),


                              ],
                            ),
                            DataRow(
                              cells: [
                                const DataCell(Text('Source',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(SizedBox(
                                  width: size.width*.6,
                                  child: TextField(
                                    controller: Source,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,


                                      )),
                                ),),


                              ],
                            ),
                          DataRow(
                              cells: [
                                const DataCell(Text('Supply Type',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(
                                  SizedBox(
                                    width: size.width*.6,
                                    child: TextField(
                                      enabled: false,
                                       controller: TextEditingController(text: supplyType),
                                        style: const TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,
                                      )),
                                  ),
                                ),


                              ],
                            ),
                            if (supplyType == "inter state")
                            DataRow(
                              cells: [
                                const DataCell(Text('CGST ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(SizedBox(
                                  width: size.width*.6,
                                  child: TextField(
                                      enabled: false,
                                      controller: TextEditingController(text: (data.calculaterValue/2).toString()),
                                      style: const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,


                                      )),
                                ),),


                              ],
                              selected: false,
                            ),
                            if (supplyType == "inter state")
                            DataRow(
                              cells: [
                                const DataCell(Text('SGST ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(SizedBox(
                                  width: size.width*.6,
                                  child: TextField(
                                      enabled: false,
                                      controller:TextEditingController(text: (data.calculaterValue/2).toString()),
                                      style: const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,


                                      )),
                                ),),


                              ],
                            ),

                            if (supplyType == "intra state")
                            DataRow(
                              cells: [
                                const DataCell(Text('IGST ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(SizedBox(
                                  width: size.width*.6,
                                  child: TextField(
                                    enabled: false,
                                      style: const TextStyle(color: Colors.black),
                                      controller: TextEditingController(text: data.calculaterValue.toString()),
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,


                                      )),
                                ),),


                              ],
                            ),

                            DataRow(
                              cells: [
                                const DataCell(Text('Cess ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(SizedBox(
                                  width: size.width*.6,
                                  child: TextField(
                                      enabled: false,
                                      controller: SGSTAmount,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,


                                      )),
                                ),),


                              ],
                            ),

                            // more rows here
                          ],
                        );}),
                      ),
                      // Row(
                      //
                      //
                      //   children: [
                      //     const Text('Action',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 15)),
                      //     const SizedBox(width: 170,),
                      //     ElevatedButton(onPressed: (){}, child:const Icon(Icons.delete)),
                      //     const SizedBox(width: 10,),
                      //     ElevatedButton(onPressed: (){}, child:const Icon(Icons.edit)),
                      //   ],
                      // )
                    ],
                  ),

                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    CustomButton(onTap: () {
                      quaryall();
                    },
                      width: size.width*0.4, child: const Center(child: Text('Bach',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))),),

    Consumer<RecordProvider>(
    builder: (context, datalistpro, child) {
      return CustomButton(onTap: () async {
         insert();
         context.read<RecordProvider>().loadData();
        Navigator.pop(context);
        }, width: size.width * 0.4, child: const Center(
        child: Text('Add', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        )),
      ),);
    }),

                  ],
                ),
              ],
            ),
          ),

        ),
      );
  },
),
    );
  }
  Widget _buildUserInfo(BuildContext context, BusinessProfile data) {


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
                    widget.data.result!.gstNo ?? "",
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
      text: "Outword and Reverse charge inward",
    ),
  );
}

