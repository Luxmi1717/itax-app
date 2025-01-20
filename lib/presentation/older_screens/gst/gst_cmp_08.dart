
import 'package:flutter/material.dart';
import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/providers/providers_old/gst_calculation_outward.dart';
import 'package:itax/providers/providers_old/gstr4_cmp_80.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';


class GSTRtable extends StatefulWidget {
  const GSTRtable({super.key});

  @override
  State<GSTRtable> createState() => _GSTRtableState();
}

class _GSTRtableState extends State<GSTRtable> {
  String? gstinNumber;
  String? FyearValue;
  String? PeriodValue;
  String? month_number;
  String?  yearValue;
  String? fb;

  bool _isChecked=true;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Legal Name :- $month_number',style: const TextStyle(
                  color:Color.fromARGB(255, 33, 150, 243),
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(width: 100,),
                const Text('Trade Name :- ',style: TextStyle(
                  color: Color.fromARGB(255, 33, 150, 243),
                  fontWeight: FontWeight.bold,
                ),),

                Text('GSTIN :-   $gstinNumber',style: const TextStyle(
                  color: Color.fromARGB(255, 33, 150, 243),
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(width: 135,),

                Text('Period :-$PeriodValue',style: const TextStyle(
                  color: Color.fromARGB(255, 33, 150, 243),
                  fontWeight: FontWeight.bold,
                ),),
                Text('FY :-     $FyearValue',style: const TextStyle(
                  color: Color.fromARGB(255, 33, 150, 243),
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(width: 150,),

                const Text('Status:-',style: TextStyle(
                  color: Color.fromARGB(255, 33, 150, 243),
                  fontWeight: FontWeight.bold,
                ),),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked= value!;
                        });
                      },
                    ),
                    const Text('File Nil GST CMP',style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),

                const SizedBox(height: 10,),
                Consumer<GstCalculation>(
                  builder: (context, gstProvider, child) {

                    return Visibility(
                  visible: _isChecked==false?true:false,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 8,
                      sortColumnIndex: 0,
                      sortAscending: true,
                      headingRowColor: WidgetStateColor.resolveWith((states) => Colors.grey),
                      dataRowColor: WidgetStateColor.resolveWith((states) => Colors.white),
                      dataRowHeight: 60,

                      headingTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      columns: const [
                        DataColumn(
                          label: Text('Type'),

                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('Taxable '),

                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('IGST'),

                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('CGST'),

                          numeric: true,
                        ),
                        DataColumn(
                          label: Text('SGST'),

                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('Cess'),

                          numeric: false,
                        ),

                      ],
                      rows:  [
                        DataRow(
                          cells: [

                            const DataCell(Text('Outword',style:TextStyle(color: Color.fromARGB(255, 33, 150, 243),fontWeight: FontWeight.bold,),)),

                            DataCell(TextField(
                              controller: gstProvider.turnovertotal,

                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),
                            const DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),
                            DataCell(TextField(
                              controller: gstProvider.cgsttotal,

                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),
                            DataCell(TextField(

                              controller: gstProvider.sgsttotal,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),


                            const DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),

                          ],

                        ),
                        const DataRow(
                          cells: [
                            DataCell(Text('Inword RC',style:TextStyle(color: Color.fromARGB(255, 33, 150, 243),fontWeight: FontWeight.bold,),)),
                            DataCell(Text('',style: TextStyle(color: Colors.grey),)),
                            DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),
                            DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),

                            DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),
                            DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),

                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(Text('Total',style:TextStyle(color: Color.fromARGB(255, 33, 150, 243),fontWeight: FontWeight.bold,),)),
                            DataCell(TextField(
                              controller: gstProvider.turnovertotal,

                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),
                            const DataCell(TextField(


                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),
                            DataCell(TextField(
                              controller: gstProvider.cgsttotal,

                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),

                            DataCell(TextField(
                              controller: gstProvider.sgsttotal,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.0',

                              ),

                            )),
                            const DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.00',

                              ),

                            )),


                          ],
                        ),
                        const DataRow(
                          cells: [
                            DataCell(Text('Interest',style:TextStyle(color: Color.fromARGB(255, 33, 150, 243),fontWeight: FontWeight.bold,),)),
                            DataCell(TextField(


                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.00',

                              ),

                            )),
                            DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.00',

                              ),

                            )),
                            DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.00',

                              ),

                            )),

                            DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.00',

                              ),

                            )),
                            DataCell(TextField(

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: '0.00',

                              ),

                            )),


                          ],
                        ),

                        // more rows here
                      ],
                    ),

                  ),
                );
                    }),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    CustomButton(onTap: () {
                      Navigator.pop(context);
                    }, width: size.width*0.3, child: const Center(child: Text('Back',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))),),
                    CustomButton(onTap: () {

                    }, width: size.width*0.3, child: const Center(
                      child: Text('Download',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                    ),),
    Consumer<Gstr4CMP>(
    builder: (BuildContext context, pro, child) {
      return CustomButton(onTap: () {
        Map data = {
          "gstin": gstinNumber,
          "fp":'$month_number$yearValue',
          "txos": {
            "samt": 0,
            "rt": 0,
            "camt": 0,
            "trnovr":0,
          }
        };
        print('$month_number$yearValue');
        pro.Gstr4CMPProv(data, context);
      }, width: size.width * 0.3, child: const Center(
        child: Text('Filing', style: TextStyle(
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
      text: "Regular",
    ),
  );
}


