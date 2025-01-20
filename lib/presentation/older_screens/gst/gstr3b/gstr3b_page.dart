
import 'package:flutter/material.dart';
import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/app_decoration.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/presentation/older_screens/gst/gstr3b/table3.1.1_gstr3b.dart';
import 'package:itax/presentation/older_screens/gst/gstr3b/table3.1_table.dart';
import 'package:itax/presentation/older_screens/gst/gstr3b/table3.2_gstr3b.dart';
import 'package:itax/presentation/older_screens/gst/gstr3b/table4_gstr3b.dart';
import 'package:itax/presentation/older_screens/gst/gstr3b/table5.1_gstr3b.dart';
import 'package:itax/presentation/older_screens/gst/gstr3b/table5_gstr3b.dart';
import 'package:itax/presentation/older_screens/gst/gstr3b/table6.1_gstr3B.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/presentation/older_widgets/widgets/gst_card3.dart';
import 'package:itax/providers/providers_old/bussiness_data.dart';
import 'package:itax/providers/providers_old/gstr3b_provider.dart';
import 'package:itax/utility/size_utils.dart';


import 'package:provider/provider.dart';



class GSTR3b extends StatefulWidget {
  const GSTR3b({super.key});

  @override
  State<GSTR3b> createState() => _GSTR3bState();
}

class _GSTR3bState extends State<GSTR3b> {

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
  String LigalName='';
  String Gstin ='';

  String? gstinNumber;
  String? FyearValue;
  String? PeriodValue;
  String? month_number;
  String?  yearValue;
  String? fb;
  String ? tradeName;
  @override
void initState() {
    // TODO: implement initState
    super.initState();
init();

  }

  @override
  Widget build(BuildContext context) {

      var size =MediaQuery.of(context).size;
      return Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child:
              Consumer<GstBussinessData>(builder: (BuildContext context,data,child ){
         return Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _buildUserInfo(context,FyearValue,PeriodValue),
                  const SizedBox(height: 30,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
    Consumer<GSTR3B>(builder: (context,value,child) {
      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>  GSTRTable1(data: data.BusinessProfiledata, year: FyearValue, periods: PeriodValue,)));
                        },
                        child: Card3(
                            text: ' 3.1 Tax on outword and reverse charge inward supplies',
                            widget:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(


                                children: [
                                  const Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [

                                          Text(
                                            'Intregrated Tax', style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,

                                            fontSize: 12,
                                          ),

                                          ),
                                          Text('Cental Tax', style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,

                                            fontSize: 12,
                                          ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Column(
                                    children: [
                                      const Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text('State/UT Tax', style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,

                                            fontSize: 12,
                                          ),

                                          ),
                                          Text('CESS ₹', style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,

                                            fontSize: 12,
                                          ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [

                                          Text('₹${value.StateTax.toString()}',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,

                                              fontSize: 12,
                                            ),

                                          ),
                                          Text('₹${value.Cess.toString()}',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,

                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                ],
                              ),
                            ),
                            width: size.width * 0.45,
                            height: size.height * 0.2),
                      );
                    }),

                        Consumer<GSTR3BCardNo2>(builder: (context,value,child){
                          return  GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Table2_3b(data: data.BusinessProfiledata, year: FyearValue, periods: PeriodValue)));
                            },
                            child: Card3(text: '3.1.1 supplies notified under section 9(5) of the CGST Act', widget:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(


                                children: [
                                  const Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Intregrated Tax', style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,

                                                fontSize: 12,
                                              ),

                                              ),
                                            ],
                                          ),
                                          Text('Cental Tax', style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('State/UT Tax', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,

                                        fontSize: 12,
                                      ),

                                      ),
                                      Text('CESS ₹', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,

                                        fontSize: 12,
                                      ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('₹${value.Intregated.toString()}', style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,


                                        fontSize: 12,
                                      ),

                                      ),
                                      Text('₹${value.Center.toString()}', style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,

                                        fontSize: 12,
                                      ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                                width: size.width*0.45, height:size.height*0.2),
                          );



                        }),




                      ],
                    ),


                  const SizedBox(height: 30,),


                  Consumer<GSTR3BCardNo2>(builder: (context,value,child){
                     return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(

                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Table3_gstr3b(data: data.BusinessProfiledata, year: FyearValue, periods: PeriodValue)));
                          },
                          child: Card3(text: '3.2 Inter-state supplies', widget:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(



                              children: [
                                const SizedBox(height: 22,),
                                Column(
                                  children: [
                                    const Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Intregrated Tax', style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),

                                        ),
                                        Text('Cental Tax', style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('₹${value.Intregated.toString()}', style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,

                                          fontSize: 12,
                                        ),

                                        ),
                                        Text('₹${value.Center.toString()}', style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,

                                          fontSize: 12,
                                        ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Column(
                                  children: [

                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('State/UT Tax', style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,

                                          fontSize: 12,
                                        ),

                                        ),
                                        Text('CESS ₹', style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,

                                          fontSize: 12,
                                        ),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('₹${value.Intregated.toString()}', style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,

                                          fontSize: 12,
                                        ),

                                        ),
                                        Text('₹${value.Center.toString()}', style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,

                                          fontSize: 12,
                                        ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          ),
                              width: size.width*0.45, height:size.height*0.2),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Table4_gstr3b(data: data.BusinessProfiledata, year: FyearValue, periods: PeriodValue)));
                          },
                          child: Card3(text: '4 Eligible ITC', widget:
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(


                              children: [
                                SizedBox(height: 22,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Intregrated Tax', style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),

                                    ),
                                    Text('Cental Tax', style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('State/UT Tax', style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),

                                    ),
                                    Text('CESS ₹', style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                              width: size.width*0.45, height:size.height*0.2),
                        ),



                      ],
                    );
                  }),

                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Table5a_gstr3b(data: data.BusinessProfiledata, year: FyearValue, periods: PeriodValue)));
                        },
                        child: Card3(text: '5.1.Interest and late fee for preview tax period', widget:
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(


                            children: [
                              SizedBox(height: 22,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Intregrated Tax', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.clip,
                                    fontSize: 12,
                                  ),

                                  ),
                                  Text('Cental Tax', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                  ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('State/UT Tax', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.clip,

                                    fontSize: 12,
                                  ),

                                  ),
                                  Text('CESS ₹', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                  ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                            width: size.width*0.45, height:size.height*0.2),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Table5_gstr3b(data: data.BusinessProfiledata, year: FyearValue, periods: PeriodValue)));
                        },
                        child: Card3(text: '5. Exempt, nill and Non GST inward suppliers', widget:
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(



                            children: [
                              SizedBox(height: 22,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Intregrated Tax', style: TextStyle(
                                    color: Colors.black,

                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  ),
                                  Text('Cental ', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.fade,
                                    fontSize: 12,
                                  ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('State/UT Tax', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,

                                    fontSize: 12,
                                  ),

                                  ),
                                  Text('CESS ₹', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,

                                    fontSize: 12,
                                  ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                            width: size.width*0.45, height:size.height*0.2),
                      ),




                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      GestureDetector(

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Table6_gstr3b(data: data.BusinessProfiledata, year: FyearValue, periods: PeriodValue)));
                        },

                        child: Card3(text: '6.1 Payment of tax', widget:
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(


                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Balance Liability', style: TextStyle(
                                    color: Colors.black,

                                    fontSize: 12,
                                  ),

                                  ),

                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Paid thought Credit', style: TextStyle(
                                    color: Colors.black,

                                    fontSize: 12,
                                  ),

                                  ),

                                ],
                              ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Paid throght Cash', style: TextStyle(
                                color: Colors.black,

                                fontSize: 12,
                              )),
                            ],
                          ),
                            ],
                          ),
                        ),
                            width: size.width*0.45, height:size.height*0.2),
                      ),



                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      CustomButton(onTap: () {

                      }, width: size.width*0.3, child: const Center(child: Text('SAVE 3B',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))),),
                      CustomButton(onTap: () {  }, width: size.width*0.3, child: const Center(
                        child: Text('Download',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                      ),),
                      CustomButton(onTap: () {  }, width: size.width*0.3, child: const Center(
                        child: Text('Generated',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                      ),),
                    ],
                  ),









                ],
              ),
            ),

          );
         }
        ),
        )
      );
    }
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
      text: "GSTR-3 Monthly Return",
    ),
  );
}