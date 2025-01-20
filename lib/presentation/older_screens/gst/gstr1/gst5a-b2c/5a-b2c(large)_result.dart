import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/sqflite_local_database.dart';
import 'package:itax/config_old/theme/app_decoration.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/providers/providers_old/gst_calculation_outward.dart';
import 'package:itax/providers/providers_old/gst_onlinelist_add.dart';
import 'package:itax/providers/providers_old/rate_percent_calculation.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';


import '../../../../../models/business_profile_model.dart';
import 'mode_list_record.dart';

class gst5a_b2c_result extends StatefulWidget {
  final BusinessProfile data;
  const gst5a_b2c_result({super.key, required this.data, });

  @override
  State<gst5a_b2c_result> createState() => _gst5a_b2c_resultState();
}

class _gst5a_b2c_resultState extends State<gst5a_b2c_result> {


  TextEditingController POS =TextEditingController();
  TextEditingController InvoicNO =TextEditingController();
  TextEditingController SupllyType =TextEditingController();
  TextEditingController InvoicDate =TextEditingController();
  TextEditingController InvoicValue =TextEditingController();
  TextEditingController TotalInvoiceValue =TextEditingController();
  TextEditingController IGST =TextEditingController();
  TextEditingController Cess =TextEditingController();
  TextEditingController TotalTaxvalue =TextEditingController();

  TextEditingController Igst = TextEditingController();
  TextEditingController cgst = TextEditingController();
  TextEditingController sgst = TextEditingController();
  TextEditingController cess = TextEditingController();


  final bool _showSidebar = false;


  final dbhelper=Databasehelper.instance;
  void insert()async{

    final gstCal = Provider.of<GstCalculation>(context,listen: false);
    Map<String,dynamic> row={

    Databasehelper.columnPos5A:POS.text,
    Databasehelper.columnSupplyType7B:SupllyType.text,
    Databasehelper.columnRate7B:SupllyType.text,

    Databasehelper.columnInvoiceData5A:InvoicDate.text,
    Databasehelper.columnInvoiceValue5A:InvoicValue.text,
    Databasehelper.columnCgst5A:gstCal.cgsttotal.text,

      Databasehelper.columnSgst5A:gstCal.sgsttotal.text,
      Databasehelper.columnTurnover:gstCal.turnovertotal.text,


    } ;
    final id=await dbhelper.insert5A_B2C(row);
    print(id);
    setState(() {

    });
  }

  void quaryall()async{
    var allrows=await dbhelper.queryAll5A_B2C();
    for (var row in allrows) {
      print(row);

    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quaryall();
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
    final gstCal = Provider.of<GstCalculation>(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _buildUserInfo(context),
                const SizedBox(height: 13,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      SizedBox(
                        width: size.width,
                        child: Consumer<RatePercentCalculation>(builder: (BuildContext context ,data ,child ,) {
                          return DataTable(
                            columnSpacing: 50,
                            sortColumnIndex: 0,
                            sortAscending: true,
                            headingRowColor: WidgetStateColor.resolveWith((
                                states) => appTheme.blue800Af),
                            dataRowColor: WidgetStateColor.resolveWith((
                                states) =>
                                appTheme.blue800Af.withOpacity(0.1),),
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
                                  const DataCell(Text('POS', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,),)),
                                  DataCell(
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.5,
                                        decoration: BoxDecoration(
                                          color: appTheme.whiteA700,
                                          border: Border.all(
                                            color: appTheme.black900,


                                            strokeAlign: strokeAlignOutside,


                                          ),
                                          borderRadius: BorderRadius.circular(
                                              3),
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
                                              if (value!.length >= 2) {
                                                stateCode = int.tryParse(
                                                    value.substring(0, 2)) ??
                                                    -1;
                                              }

                                              print(stateCode);
                                              String? resVal;
                                              if (widget.data.result!.gstNo != null &&
                                                  widget.data.result!.gstNo!.length >=
                                                      2) {
                                                resVal = widget.data.result!.gstNo!
                                                    .substring(0,
                                                    2); // Get the first two characters
                                              }
                                              print(resVal);
                                              if (resVal ==
                                                  stateCode.toString()) {
                                                supplyType = "inter state";
                                                print(supplyType);
                                              } else {
                                                supplyType = "intra state";
                                                print(supplyType);
                                              }
                                            },
                                            items: indianStates.map<
                                                DropdownMenuItem<String>>((
                                                String state) {
                                              return DropdownMenuItem<String>(
                                                value: state,
                                                child: Text(state,
                                                  style: const TextStyle(
                                                      color: Colors.black),),
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
                                  const DataCell(Text('Invoice no',
                                    style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                      controller: InvoicNO,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),


                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('Supply Type',
                                    style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                      controller: SupllyType,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),


                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('Invoice data',
                                    style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                      controller: InvoicDate,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),


                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('Invoice value',
                                    style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                      controller: InvoicValue,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),


                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('Total invoice val ',
                                    style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                      controller: TotalInvoiceValue,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),


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
                                                invoiceValue = double.tryParse(TotalInvoiceValue.text) ?? 0.0;

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
                                  const DataCell(Text('Supply Type',
                                    style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.bold,),)),
                                  DataCell(
                                    TextField(
                                        enabled: false,
                                        controller: TextEditingController(
                                            text: supplyType),
                                        style: const TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets
                                              .symmetric(
                                              vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,
                                        )),
                                  ),


                                ],
                              ),
                              if (supplyType == "inter state")
                                DataRow(
                                  cells: [
                                    const DataCell(Text('CGST ',
                                      style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold,),)),
                                    DataCell(TextField(
                                        enabled: false,
                                        controller: TextEditingController(
                                            text: (data.calculaterValue / 2)
                                                .toString()),
                                        style: const TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets
                                              .symmetric(
                                              vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,


                                        )),),


                                  ],
                                  selected: false,
                                ),
                              if (supplyType == "inter state")
                                DataRow(
                                  cells: [
                                    const DataCell(Text('SGST ',
                                      style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold,),)),
                                    DataCell(TextField(
                                        enabled: false,
                                        controller: TextEditingController(
                                            text: (data.calculaterValue / 2)
                                                .toString()),
                                        style: const TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets
                                              .symmetric(
                                              vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,


                                        )),),


                                  ],
                                ),

                              if (supplyType == "intra state")
                                DataRow(
                                  cells: [
                                    const DataCell(Text('IGST ',
                                      style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold,),)),
                                    DataCell(TextField(
                                        enabled: false,
                                        style: const TextStyle(color: Colors.black),
                                        controller: TextEditingController(
                                            text: data.calculaterValue
                                                .toString()),
                                        decoration: const InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets
                                              .symmetric(
                                              vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,


                                        )),),


                                  ],
                                ),

                              DataRow(
                                cells: [
                                  const DataCell(Text('Cess ', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                      enabled: false,
                                      controller: cess,
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,


                                      )),),


                                ],
                              ),


                              // more rows here
                            ],
                          );
                        }),
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


                    },
                      width: size.width*0.4, child: const Center(child: Text('Bach',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))),),

                    Consumer<RecordProvider>(
                        builder: (context, datalistpro, child) {
                          return CustomButton(onTap: () {
                            insert();
                            datalistpro.addRecord5A_b2c(Gst5aModel(
                             Invoice_no: InvoicNO.text, Invoice_data: InvoicDate.text, Total_invoice: TotalInvoiceValue.text, Integrate_tax:gstCal.cgsttotal.text, Total_taxable: gstCal.TotalTurnover.toString(), cess: gstCal.cgsttotal.text));
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
      text: 'Outword and Reverse charge inward',
    ),
  );
}
