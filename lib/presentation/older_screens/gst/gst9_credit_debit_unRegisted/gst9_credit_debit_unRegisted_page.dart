import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/note_type_drop.dart';
import 'package:itax/config_old/percentage_dropdwon.dart';
import 'package:itax/config_old/theme/app_decoration.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/config_old/type_UnRegistrated.dart';
import 'package:itax/models/business_profile_model.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/providers/providers_old/gst_calculation_outward.dart';
import 'package:itax/providers/providers_old/gst_onlinelist_add.dart';
import 'package:itax/utility/size_utils.dart';


import 'package:provider/provider.dart';





class Gst9CrDtUnRegisted extends StatefulWidget {
  final BusinessProfile data;
  const Gst9CrDtUnRegisted({super.key, required this.data, });

  @override
  State<Gst9CrDtUnRegisted> createState() => _Gst9CrDtUnRegistedState();
}

class _Gst9CrDtUnRegistedState extends State<Gst9CrDtUnRegisted> {


  TextEditingController POS =TextEditingController();
  TextEditingController InvoicNO =TextEditingController();
  TextEditingController SupllyType =TextEditingController();
  TextEditingController InvoicDate =TextEditingController();
  TextEditingController InvoicValue =TextEditingController();
  TextEditingController TotalInvoiceValue =TextEditingController();
  TextEditingController IGST =TextEditingController();
  TextEditingController GSTPayment =TextEditingController();
  TextEditingController TotalTaxvalue =TextEditingController();

  TextEditingController Igst = TextEditingController();
  TextEditingController cgst = TextEditingController();
  TextEditingController sgst = TextEditingController();
  TextEditingController cess = TextEditingController();


  final bool _showSidebar = false;




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
                _buildUserInfo(context, widget.data),
                const SizedBox(height: 30,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [



                      SizedBox(
                        width: size.width,
                        child: DataTable(
                          columnSpacing: 8,
                          sortColumnIndex: 0,
                          sortAscending: true,
                          headingRowColor: WidgetStateColor.resolveWith((states) => appTheme.blue800Af),
                          dataRowColor: WidgetStateColor.resolveWith((states) => appTheme.blue800Af.withOpacity(0.1) ),
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

                            const DataRow(
                                cells: [

                                  DataCell(Text('Type',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                  DataCell(TypeDropdown(),),




                                ]),






                            DataRow(
                              cells: [
                                const DataCell(Text('Debit/Credit Note No.',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(TextField(
                                    controller: InvoicNO,
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
                                const DataCell(Text('Debit/Credit Note Date.',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(TextField(
                                    controller: SupllyType,
                                    decoration: const InputDecoration(
                                      hintText: '21/11/200',
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
                                const DataCell(Text('State Tax ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(TextField(
                                    controller: TotalInvoiceValue,
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
                            const DataRow(
                              cells: [
                                DataCell(Text('Note type',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(NoteDropdown(),),


                              ],
                            ),


                            DataRow(
                              cells: [
                                const DataCell(Text('Supply Type',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(TextField(
                                    controller: TotalInvoiceValue,
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


                            const DataRow(
                              cells: [
                                DataCell(Text('Item Details',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(Text('',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),


                              ],
                            ),

                            const DataRow(
                              cells: [
                                DataCell(Text('Select Rate (%)',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(StateDropdown()),



                              ],
                            ),
                            DataRow(
                              cells: [
                                const DataCell(Text('Note Value',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(TextField(
                                    controller:InvoicDate,
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
                                const DataCell(Text('State tax ₹',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(TextField(
                                    controller:InvoicDate,
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
                                const DataCell(Text('Central Tax ₹',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(TextField(
                                    controller:InvoicDate,
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
                                const DataCell(Text('Cess ₹ ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                DataCell(TextField(
                                    controller:InvoicDate,
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


                      Row(


                        children: [
                          const Text('Action',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(width: 170,),
                          ElevatedButton(onPressed: (){}, child:const Icon(Icons.delete)),
                          const SizedBox(width: 10,),
                          ElevatedButton(onPressed: (){}, child:const Icon(Icons.edit)),
                        ],
                      )
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
                            //datalistpro.addRecordgst11a1_11a2_tax(Modelgst11a1_11a2_tax(Place_of_supply: '', Rate: '', Total_taxable: '', Integrated: '', central_tax: '', State_tax: '', cess: ''

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
  Widget _buildUserInfo(BuildContext context,BusinessProfile data) {


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
      text: 'Outword and Reverse charge inward',
    ),
  );
}
