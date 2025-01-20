
//import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/sqflite_local_database.dart';
import 'package:itax/config_old/theme/app_decoration.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/business_profile_cubit.dart';
import 'package:itax/presentation/older_screens/gst/check_page.dart';
import 'package:itax/presentation/older_screens/gst/composition_page.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/presentation/older_widgets/widgets/text_input.dart';
import 'package:itax/providers/providers_old/bussiness_data.dart';
import 'package:itax/providers/providers_old/gst_api.dart';
import 'package:itax/providers/providers_old/gst_calculation_outward.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';




import 'composition_table_page/challan.dart';
import 'composition_table_page/inwardSupplies.dart';
import 'composition_table_page/outward_supplies.dart';
import 'front_regular_page.dart';

class ReturnDeshboard extends StatefulWidget {
  const ReturnDeshboard({super.key});

  @override
  State<ReturnDeshboard> createState() => _ReturnDeshboardState();
}

class _ReturnDeshboardState extends State<ReturnDeshboard> {
  @override

  late final token;


  @override
  void initState(){
    super.initState();
    loadData();

    final user =
    BlocProvider.of<AuthCubit>(context, listen: false).getLoggedInUser();

    token = user.token;

    BlocProvider.of<BusinessProfileCubit>(context, listen: false)
        .getBusinessProfile(token,context);
  }


  TextEditingController form=TextEditingController();
  TextEditingController to =TextEditingController();
  TextEditingController Igst = TextEditingController();
  TextEditingController cgst = TextEditingController();
  TextEditingController sgst = TextEditingController();
  TextEditingController cess = TextEditingController();
  final List<String> items =
  [
    '2023-24',
    '2022-23',
    '2021-22',
    '2020-21',
    '2019-20',
    '2018-19',
    '20017-18',
  ];

  final List<String> months =
  [
    '(Apr-Jun)',
    '(Jul-Sep)',
    '(Oct-Dec)',
    '(Jan-Mar)'

  ];

  final List<String> periodical =
  [
    'April',
    'May',
    'June',

  ];
  final List<String> periodical2 = [
    'July',
    'August',
    'September',
  ];
  final List<String> periodical3 = [
    'October',
    'November',
    'December',

  ];
  final List<String> periodical4 = [


    'January',
    'February',
    'March',

  ];
  final List<String> regular = [
    'Regular',
    'Composition',

  ];
  final List<String> Composition1 = [
    'june',
  ];
  final List<String> Composition2 = [
    'sept',
  ];
  final List<String> Composition3 = [
    'Dec',
  ];
  final List<String> Composition4 = [
    'March',
  ];
  String? selectedValue='2023-24';
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  String? selectedValue5;
  String? selectedValue6;
  String? selectRC='Regular';
  String? CompositionA;
  String? CompositionB;
  String? CompositionC;
  String? CompositionD;


  bool isVisible = true;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisiblec = false;
  bool isVisiblec2 = false;
  bool isVisiblec3 = false;
  bool isVisiblec4 = false;
  TableRow buildRow ( List<String> cells,{ bool isHeader=false})=> TableRow(
      children: cells.map((cell) {
        final style=TextStyle(
          fontWeight: isHeader? FontWeight.bold:
              FontWeight.normal,
          fontSize: 15
        );
  return Padding(padding: const EdgeInsets.all(12),
    child: Center(child:Text(cell,style: style,),),
  );
  }).toList(),
  );
  List month1 =
  ['jan', 'feb', 'mar', 'apr', 'may','jun','jul','aug','sep','oct','nov','dec'];


  bool _showSidebar = false;
  final bool _tableVisbilte=false;
  String? LigalName;
  String? Gstin;
  String? Regular;


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

  final dbhelper2=Databasehelper.instance;

  /*void insert()   async{
    Map<String,dynamic> row={
      Databasehelper.columnYear:selectedValue.toString(),
      Databasehelper.columnRegularComposion:selectRC,
      Databasehelper.columnQuarter:selectedValue2.toString(),
    } ;
    final id =await dbhelper2.insertdeshbord(row);
  }*/

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _buildAppBar(context,size),
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
        child: Padding(
          padding:  const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              _buildUserInfo(context),

              const SizedBox(height: 15,),

              /*Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  const Text('Return Filing Preference',style: TextStyle(
                    color: Color.fromARGB(255, 33, 150, 243),
                  ),
                  ),
                  SizedBox(

                    width: MediaQuery.of(context).size.width*0.29,
                    child: CustomDropdownButton2(
                      hint: 'Select',
                      dropdownItems: regular,
                      value: selectRC,
                      onChanged: (value) {
                        setState(() {
                         selectRC = value;
                        });
                      },
                    ),
                  ),
                ],
              ),*/


              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(
                  //
                  //   width: MediaQuery.of(context).size.width*0.3,
                  //   child: CustomDropdownButton2(
                  //     hint: 'FYear',
                  //     dropdownItems: items,
                  //
                  //     value: selectedValue,
                  //     onChanged: (value) async{
                  //       await UserSecureStorage.saveFYear(value.toString());
                  //
                  //       setState(()  {
                  //         selectedValue = value;
                  //
                  //       });
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: DropdownButton2(
                      hint: const Text('FYear'),
                      //  dropdownItems: items,
                      value: selectedValue,
                      onChanged: (value) async{
                        await UserSecureStorage.saveFYear(value.toString());

                        setState(()  {
                          selectedValue = value;

                        });
                      },
                      items: items
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                  ),

                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width*0.29,
                  //   child: DropdownButton2(
                  //     hint: 'Quarter',
                  //     items: months,
                  //     value: selectedValue2,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         selectedValue2 = value;
                  //         if(selectRC=='Composition') {
                  //           setState(() {
                  //              isVisible = false;
                  //              isVisible2 = false;
                  //              isVisible3 = false;
                  //              isVisible4 = false;
                  //           });
                  //           if (selectedValue2 == "(Jul-Sep)" ||
                  //               selectedValue2 == '(Oct-Dec)' ||
                  //               selectedValue2 == '(Jan-Mar)') {
                  //             isVisiblec = false;
                  //           } else {
                  //             isVisiblec = true;
                  //
                  //           }
                  //           if (selectedValue2 ==
                  //               "(Jul-Sep)") {
                  //             isVisiblec2 = true;
                  //
                  //           } else {
                  //             isVisiblec2 = false;
                  //           }
                  //           if (selectedValue2 ==
                  //               "(Oct-Dec)") {
                  //             isVisiblec3 = true;
                  //
                  //           } else {
                  //             isVisiblec3 = false;
                  //
                  //           }
                  //           if (selectedValue2 ==
                  //               "(Jan-Mar)") {
                  //             isVisiblec4 = true;
                  //
                  //           } else {
                  //             isVisiblec4 = false;
                  //           }
                  //         }else{
                  //           setState(() {
                  //              isVisiblec = false;
                  //              isVisiblec2 = false;
                  //              isVisiblec3 = false;
                  //              isVisiblec4 = false;
                  //              isVisible = true;
                  //           });
                  //
                  //             if (selectedValue2 == "(Jul-Sep)" ||
                  //                 selectedValue2 == '(Oct-Dec)' ||
                  //                 selectedValue2 == '(Jan-Mar)') {
                  //               isVisible = false;
                  //             } else {
                  //               isVisible = true;
                  //
                  //             }
                  //             if (selectedValue2 ==
                  //                 "(Jul-Sep)") {
                  //               isVisible2 = true;
                  //             } else {
                  //               isVisible2 = false;
                  //             }
                  //             if (selectedValue2 ==
                  //                 "(Oct-Dec)") {
                  //               isVisible3 = true;
                  //             } else {
                  //               isVisible3 = false;
                  //             }
                  //             if (selectedValue2 ==
                  //                 "(Jan-Mar)") {
                  //               isVisible4 = true;
                  //             } else {
                  //               isVisible4 = false;
                  //             }
                  //
                  //
                  //         }
                  //       });
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: DropdownButton2(
                      hint: const Text('Quarter'),
                      //  dropdownItems: items,
                      value: selectedValue2,
                      onChanged: (value) {
                        setState(() {
                          selectedValue2 = value;
                          if(selectRC=='Composition') {
                            setState(() {
                              isVisible = false;
                              isVisible2 = false;
                              isVisible3 = false;
                              isVisible4 = false;
                            });
                            if (selectedValue2 == "(Jul-Sep)" ||
                                selectedValue2 == '(Oct-Dec)' ||
                                selectedValue2 == '(Jan-Mar)') {
                              isVisiblec = false;
                            } else {
                              isVisiblec = true;

                            }
                            if (selectedValue2 ==
                                "(Jul-Sep)") {
                              isVisiblec2 = true;

                            } else {
                              isVisiblec2 = false;
                            }
                            if (selectedValue2 ==
                                "(Oct-Dec)") {
                              isVisiblec3 = true;

                            } else {
                              isVisiblec3 = false;

                            }
                            if (selectedValue2 ==
                                "(Jan-Mar)") {
                              isVisiblec4 = true;

                            } else {
                              isVisiblec4 = false;
                            }
                          }else{
                            setState(() {
                              isVisiblec = false;
                              isVisiblec2 = false;
                              isVisiblec3 = false;
                              isVisiblec4 = false;
                              isVisible = true;
                            });

                            if (selectedValue2 == "(Jul-Sep)" ||
                                selectedValue2 == '(Oct-Dec)' ||
                                selectedValue2 == '(Jan-Mar)') {
                              isVisible = false;
                            } else {
                              isVisible = true;

                            }
                            if (selectedValue2 ==
                                "(Jul-Sep)") {
                              isVisible2 = true;
                            } else {
                              isVisible2 = false;
                            }
                            if (selectedValue2 ==
                                "(Oct-Dec)") {
                              isVisible3 = true;
                            } else {
                              isVisible3 = false;
                            }
                            if (selectedValue2 ==
                                "(Jan-Mar)") {
                              isVisible4 = true;
                            } else {
                              isVisible4 = false;
                            }


                          }
                        });
                      },  items: months
                        .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    ),
                  ),

                  Column(
                    children: [
                      Visibility(
                        visible: isVisible,

                        child:
                        // SizedBox(
                        //
                        //   width: MediaQuery.of(context).size.width*0.29,
                        //   child: CustomDropdownButton2(
                        //     hint: 'Period',
                        //     dropdownItems: periodical,
                        //
                        //     value: selectedValue3,
                        //     onChanged: (value) async {
                        //       await UserSecureStorage.savePeriod(value.toString());
                        //       setState(() {
                        //         selectedValue3 = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.6,
                          child: DropdownButton2(
                            hint: const Text('Period'),
                            //  dropdownItems: items,
                            value: selectedValue3,
                            onChanged: (value) {
                              setState(() {
                                selectedValue3= value;
                              });
                            },  items: periodical
                              .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisible2,

                        child:
                        // SizedBox(
                        //
                        //   width: MediaQuery.of(context).size.width*0.29,
                        //   child: CustomDropdownButton2(
                        //     hint: 'Period',
                        //     dropdownItems: periodical2,
                        //     value: selectedValue4,
                        //     onChanged: (value) async {
                        //       await UserSecureStorage.savePeriod(value.toString());
                        //       setState(() {
                        //         selectedValue4 = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.6,
                          child: DropdownButton2(
                            hint: const Text('Period'),
                            //  dropdownItems: items,
                            value: selectedValue4,
                            onChanged: (value) {
                              setState(() {
                                selectedValue4 = value;
                              });
                            },  items: periodical2
                              .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisible3,

                        child:
                        // SizedBox(
                        //
                        //   width: MediaQuery.of(context).size.width*0.29,
                        //   child: CustomDropdownButton2(
                        //     icon: const Icon(Icons.arrow_drop_down_sharp,size: 30,
                        //       color: Colors.deepPurple,
                        //     ),
                        //     hint: 'Period',
                        //     dropdownItems: periodical3,
                        //     value: selectedValue5,
                        //     onChanged: (value) async {
                        //       await UserSecureStorage.savePeriod(value.toString());
                        //       setState(() {
                        //         selectedValue5 = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.6,
                          child: DropdownButton2(
                            hint: const Text('Period'),
                            //  dropdownItems: items,
                            value: selectedValue5,
                            onChanged: (value) {
                              setState(() {
                                selectedValue5 = value;
                              });
                            },  items: periodical3
                              .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisible4,

                        child:
                        // SizedBox(
                        //
                        //   width: MediaQuery.of(context).size.width*0.29,
                        //   child: CustomDropdownButton2(
                        //     icon: const Icon(Icons.arrow_drop_down_sharp,size: 12,
                        //       color: Colors.deepPurple,
                        //     ),
                        //     hint: 'Period',
                        //     dropdownItems: periodical4,
                        //     value: selectedValue6,
                        //     onChanged: (value) async {
                        //       await UserSecureStorage.savePeriod(value.toString());
                        //       setState(() {
                        //         selectedValue6 = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.6,
                          child: DropdownButton2(
                            hint: const Text('Period'),
                            //  dropdownItems: items,
                            value: selectedValue6,
                            onChanged: (value) async {
                              await UserSecureStorage.savePeriod(value.toString());
                              setState(() {
                                selectedValue6 = value;
                              });
                            },
                            items: periodical4
                                .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisiblec,

                        child:
                        // SizedBox(
                        //
                        //   width: MediaQuery.of(context).size.width*0.29,
                        //   child: CustomDropdownButton2(
                        //     hint: 'Period',
                        //     dropdownItems: Composition1,
                        //
                        //     value:CompositionA,
                        //     onChanged: (value) async {
                        //       await UserSecureStorage.savePeriod(value.toString());
                        //       setState(() {
                        //         CompositionA = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.6,
                          child: DropdownButton2(
                            hint: const Text('Period'),
                            //  dropdownItems: items,
                            value:CompositionA,
                            onChanged: (value) async {
                              await UserSecureStorage.savePeriod(value.toString());
                              setState(() {
                                CompositionA = value;
                              });
                            },
                            items: Composition1
                                .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisiblec2,

                        child:
                        // SizedBox(
                        //
                        //   width: MediaQuery.of(context).size.width*0.29,
                        //   child: CustomDropdownButton2(
                        //     hint: 'Period',
                        //     dropdownItems: Composition2,
                        //
                        //     value:CompositionB,
                        //     onChanged: (value) async {
                        //       await UserSecureStorage.savePeriod(value.toString());
                        //       setState(() {
                        //         CompositionA = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.6,
                          child: DropdownButton2(
                            hint: const Text('Period'),
                            //  dropdownItems: items,
                            value:CompositionB,
                            onChanged: (value) async {
                              await UserSecureStorage.savePeriod(value.toString());
                              setState(() {
                                CompositionA = value;
                              });
                            },
                            items: Composition2
                                .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisiblec3,

                        child:
                        // SizedBox(
                        //
                        //   width: MediaQuery.of(context).size.width*0.29,
                        //   child:
                        //   CustomDropdownButton2(
                        //     hint: 'Period',
                        //     dropdownItems: Composition3,
                        //
                        //     value:CompositionC,
                        //     onChanged: (value) async {
                        //       await UserSecureStorage.savePeriod(value.toString());
                        //       setState(() {
                        //         CompositionC = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.6,
                          child: DropdownButton2(
                            hint: const Text('Select'),
                            //  dropdownItems: items,
                            value: CompositionC,
                            onChanged: (value)async {
                              await UserSecureStorage.savePeriod(value.toString());
                              setState(() {
                                CompositionC = value;
                              });
                            },  items: Composition3
                              .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisiblec4,

                        child:
                        // SizedBox(
                        //
                        //   width: MediaQuery.of(context).size.width*0.29,
                        //   child: CustomDropdownButton2(
                        //     hint: 'Period',
                        //     dropdownItems: Composition4,
                        //
                        //     value:CompositionD,
                        //     onChanged: (value) async {
                        //       await UserSecureStorage.savePeriod(value.toString());
                        //       setState(() {
                        //         CompositionD = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.6,
                          child: DropdownButton2(
                            hint: const Text('Period'),
                            //  dropdownItems: items,
                            value: CompositionD,
                            onChanged: (value)async {
                              await UserSecureStorage.savePeriod(value.toString());
                              setState(() {
                                CompositionD = value;
                              });
                            },  items: Composition4
                              .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          ),
                        ),

                      ),
                    ],

                  ),


                ],
              ),
              const SizedBox(height: 10,),
              Text('Table of  $selectRC',style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 10,),
              _buildTableRows(context),

              const SizedBox(height: 10,),
    Consumer<GstCalculation>(
    builder: (context, gstProvider, child) {
    return
    Visibility(
                visible: selectRC=='Composition'? true :false,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showSidebar = !_showSidebar;
                      });
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: size,
                          child: DataTable(
                            columnSpacing: 9,
                            sortColumnIndex: 0,
                            sortAscending: true,
                            headingRowColor: WidgetStateColor.resolveWith((states) => Colors.grey),
                            dataRowColor: WidgetStateColor.resolveWith((states) => Colors.white ),
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
                                label: Text('Supplier'),

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
                                label: Text('CESS'),

                                numeric: false,
                              ),

                            ],
                            rows:  const [
                              DataRow(


                                  cells: [


                                    DataCell(Text('A',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                    DataCell(TextField(
                                        // controller: gstProvider.turnovertotal,
                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Color(0xFFECEFF1),


                                        )),),
                                    DataCell(TextField(
                                        // controller: Igst,

                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Color(0xFFECEFF1),


                                        )),),

                                    DataCell(TextField(
                                        // controller: gstProvider.cgsttotal,

                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Color(0xFFECEFF1),


                                        )),),

                                    DataCell(TextField(
                                        // controller: gstProvider.sgsttotal,
                                        enabled: false,

                                        decoration: InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Color(0xFFECEFF1),


                                        )),),
                                    DataCell(TextField(
                                        // controller: Igst,

                                        enabled: false,
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
                                  DataCell(Text('B',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(


                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                    enabled: false,
                                    // controller: cgst,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
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

                              DataRow(
                                cells: [
                                  DataCell(Text('C',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                    enabled: false,
                                    // controller: cgst,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: gstProvider.cgsttotal,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: gstProvider.sgsttotal,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

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

                              DataRow(
                                cells: [
                                  DataCell(Text('D',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(


                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                    // controller: cgst,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: cgst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
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

                              DataRow(
                                cells: [
                                  DataCell(Text('E',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                    // controller: cgst,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: gstProvider.cgsttotal,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: gstProvider.sgsttotal,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
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

                              DataRow(
                                cells: [
                                  DataCell(Text('F',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                  DataCell(TextField(

                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                    enabled: false,
                                    // controller: cgst,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
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

                              DataRow(
                                cells: [
                                  DataCell(Text('G',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                  DataCell(TextField(

                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                    // controller: cgst,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: gstProvider.cgsttotal,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(

                                      // controller: gstProvider.sgsttotal,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

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
                        if (_showSidebar) Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            color: Colors.grey,
                            width: 200,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(13),
                                      child: Align(alignment:Alignment.bottomRight,child: Icon(Icons.close, size: 25,),),

                                    ),
                                    const SizedBox(height: 4,),
                                   ElevatedButton(onPressed: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const OutwardSupplies()));
                                   }, child:  const Text('Outward Supplies & tex',style: TextStyle(
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold,
                                   ),),),
                                    const SizedBox(height:2,),

                                    ElevatedButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const InwertSupplies()));
                                    }, child:  const Text('Inward Supplies & Tax',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),),),
                                    const SizedBox(height: 20,),
                                    const Text('Total Tax Liability (a+b)',style: TextStyle(


                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,

                                    ),),
                                    const SizedBox(height: 29,),
                                    const Text('Less:- TDS Credit Recived',style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    const SizedBox(height: 29,),
                                    const Text('Net Tax Liability:(C-D)',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [

                                         const Text('Less:tax paid',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        Expanded(
                                          child: ElevatedButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChallanComposition()));
                                          }, child: const Text('Challan',style: TextStyle(
                                            color: Colors.black,

                                          ),), ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    const Text('Balance GST Due:(E-F)',style: TextStyle(
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
                  ),
                ),
              );}),
             /* Visibility(
                visible: selectRC=='Regular'? true :false,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showSidebar = !_showSidebar;
                      });
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: size,
                          child: DataTable(
                            columnSpacing: 9,
                            sortColumnIndex: 0,
                            sortAscending: true,
                            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                            dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white ),
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
                                label: Text('IGST'),

                                numeric: false,
                              ),
                              DataColumn(
                                label: Text('CGST'),

                                numeric: false,
                              ),
                              DataColumn(
                                label: Text('SGCT'),

                                numeric: false,
                              ),
                              DataColumn(
                                label: Text('CESS'),

                                numeric: false,
                              ),

                            ],
                            rows:  const [
                              DataRow(


                                  cells: [


                                    DataCell(Text('A',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),

                                    DataCell(TextField(
                                        // controller: Igst,
                                      enabled: false,


                                        decoration: InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Color(0xFFECEFF1),


                                        )),),

                                    DataCell(TextField(
                                        // controller: Igst,
                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Color(0xFFECEFF1),


                                        )),),

                                    DataCell(TextField(
                                        // controller: Igst,

                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Color(0xFFECEFF1),


                                        )),),
                                    DataCell(TextField(
                                        // controller: Igst,
                                        enabled: false,

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
                                  DataCell(Text('B',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    enabled: false,
                                    // controller: cgst,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

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

                              DataRow(
                                cells: [
                                  DataCell(Text('C',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    enabled: false,
                                    // controller: cgst,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
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

                              DataRow(
                                cells: [
                                  DataCell(Text('D',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    // controller: cgst,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
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

                              DataRow(
                                cells: [
                                  DataCell(Text('E',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    // controller: cgst,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

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

                              DataRow(
                                cells: [
                                  DataCell(Text('F',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    enabled: false,
                                    // controller: cgst,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: Igst,
enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

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

                              DataRow(
                                cells: [
                                  DataCell(Text('G',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    // controller: cgst,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: Igst,
                                      enabled: false,

                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
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
                              DataRow(
                                cells: [
                                  DataCell(Text('H',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                                  DataCell(TextField(
                                    // controller: cgst,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Color(0xFFECEFF1),


                                    ),

                                  ),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color(0xFFECEFF1),


                                      )),),
                                  DataCell(TextField(
                                      // controller: Igst,

                                      enabled: false,
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
                        if (_showSidebar) Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            color: Colors.grey,
                            width: 220,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(13),
                                      child: Align(alignment:Alignment.bottomRight,child: Icon(Icons.close, size: 25,),),

                                    ),
                                    const SizedBox(height: 4,),
                                    ElevatedButton(onPressed: (){}, child:  const Text('Outward Liability(GSTR-1)',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),),),
                                    const SizedBox(height:2,),

                                    ElevatedButton(onPressed: (){}, child:  const Text('Inward       Credit(GSTR-2)',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),),),
                                    const SizedBox(height: 20,),
                                    const Text('Utilized ITC Balance',style: TextStyle(


                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,

                                    ),),
                                    const SizedBox(height: 23,),
                                    const Center(
                                      child: Text('Net Tax Liability and outward \n (A-B)',style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    const SizedBox(height: 29,),
                                    const Text('Net Tax Liability:(C-D)',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    const SizedBox(height: 27,),


                                    const Text('Total Tax Payable in Cah (D+E)',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [

                                        const Text('Less : tax paid',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        Expanded(
                                          child: ElevatedButton(onPressed: (){}, child: const Text('Challan',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),), ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    const Text('Balance GST Due:(F-G)',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),),



                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ),
              ),*/



              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
    Consumer<GstSection>(builder: (BuildContext context, pro, child) {
                return  CustomButton(


                    onTap: (){

                    _showErrorDialog2();


                  }, width:size*0.3, child:
                   Center(child: Text('Cash',style: CustomTextStyles.labelLargeWhiteA700,)));}),
                  const SizedBox (height: 20,),
                  CustomButton(onTap: (){
                    _showErrorDialogLiability();
                  }, width:size*.3, child:


                   Center(child: Text('Liablility',style: CustomTextStyles.labelLargeWhiteA700,)) ),
                  const SizedBox (height: 20,),
                  CustomButton(onTap: (){


                  },width:size*0.3, child:
                   Center(child: Text(
                    'Credit ',style: CustomTextStyles.labelLargeWhiteA700
                    , )) ),
                  const SizedBox (height: 20,),

                ],
              ),
              const SizedBox(height: 20,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(onTap: (){

                    if(selectRC=='Regular') {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegularCardPage()));
                      print('hello');
                    }
                    else if(selectRC=='Composition')
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Composition()));
                    }
                    else{
                      _showErrorDialog();

                    }



                  }, width:size*0.3, child:
                   Center(child: Text('File Returns',style: CustomTextStyles.labelLargeWhiteA700,))),

                  CustomButton(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CalculatorTabPage()));
                  },width:size*0.3, child:
                   Center(child: Text('Pav Tax ',style: CustomTextStyles.labelLargeWhiteA700, ))),

                ],
              ),



            ],
          ),
        ),
      );
  },
),


    );


  }
  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Pleas Select Regular and Compostion '),
          actions: [
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  void _showErrorDialog2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Inter all details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select the year',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 10,),
            Consumer<GstSection>(builder: (BuildContext context, pro, child) {
               return
                //  SizedBox(
                //  width: MediaQuery.of(context).size.width*0.6,
                //   child:
                //   CustomDropdownButton2(
                //     hint: 'FYear',
                //     dropdownItems:pro.cashyear,
                //
                //     value: pro.selectedCashyear,
                //     onChanged: (value) {
                //
                //     pro.YearSelect(value!);
                //
                //
                //     },
                //   ),
                //
                //
                // );
                 SizedBox(
                   height: 50,
                   width: MediaQuery.of(context).size.width*0.6,
                   child: DropdownButton2(
                     hint: const Text('FYear'),
                     //  dropdownItems: items,
                     value: pro.selectedCashyear,
                     onChanged: (value) {
                       pro.YearSelect(value!);


                     }, items: pro.cashyear
                       .map((item) => DropdownMenuItem(
                     value: item,
                     child: Text(
                       item,
                       style: const TextStyle(
                         fontSize: 14,
                       ),
                     ),
                   ))
                       .toList(),
                   ),
                 );
        }),
                const SizedBox(height: 10,),
                const Text(
                  'Select the Month',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
                Consumer<GstSection>(builder: (BuildContext context, pro, child) {
                  return
                  //   SizedBox(
                  //   width: MediaQuery.of(context).size.width*0.6,
                  //   child:
                  //   CustomDropdownButton2(
                  //     hint: 'FYear',
                  //     dropdownItems:pro.cashmonth,
                  //
                  //     value: pro.selectedCashmonth,
                  //     onChanged: (value) {
                  //
                  //       pro.MonthSelect(value!);
                  //
                  //
                  //     },
                  //   ),
                  //
                  //
                  //
                  // )
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.6,
                      child: DropdownButton2(
                        hint: const Text('Select'),
                        //  dropdownItems: items,
                        value: pro.selectedCashmonth,
                        onChanged: (value) {

                          pro.MonthSelect(value!);


                        }, items: pro.cashmonth
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      ),
                    );
                }),
                const Text(
                  'Select the Month',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
    const SizedBox(height: 10,),
    Consumer<GstSection>(builder: (BuildContext context, pro, child) {
     return TextInput(
       controller: pro.emailController,
       hintText: 'Inter GSTIN',
     );
    }),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 10,),
    Consumer<GstSection>(builder: (BuildContext context, pro, child) {
      return ElevatedButton(
        child: Center(
            child: !pro.loadingCash
                ?const Text(
              'Cash',
              style: TextStyle(color: Colors.white,fontSize: 15),
            ):  const SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),)),

        onPressed: () {
          String gstin = pro.emailController.text;
          int year=int.parse(pro.selectedCashyear);
          int month=int.parse(pro.selectedCashmonth);


          pro.LedgerCash(year, month, gstin, context);
        },
      );
    }),
              ],
            ),
          ],
        );
      },
    );
  }
  void _showErrorDialogLiability() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Inter all details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Date from',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                const SizedBox(height: 10,),


                TextInput(
                  controller: form,
                  hintText: '20/05/2022',
                ),
                const SizedBox(height: 10,),
                const Text(
                  'to Data',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
            TextInput(
              controller: to,
              hintText: '30/10/2022',
            ),

                const Text(
                  'Inter GSTIN ',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
                Consumer<GstSection>(builder: (BuildContext context, pro, child) {
                  return TextInput(
                    controller: pro.emailController,
                    hintText: 'Inter GSTIN',
                  );
                }),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 10,),
                Consumer<GstSection>(builder: (BuildContext context, pro, child) {
                  return ElevatedButton(
                    child: Center(
                        child: !pro.loadingCash
                            ?const Text(
                          'Liablility',
                          style: TextStyle(color: Colors.white,fontSize: 15),
                        ):  const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),)),

                    onPressed: () {
                      String gstin = pro.emailController.text;
                      int year=int.parse(pro.selectedCashyear);
                      int month=int.parse(pro.selectedCashmonth);


                      pro.LedgerCash(year, month, gstin, context);
                    },
                  );
                }),
              ],
            ),
          ],
        );
      },
    );
  }
  Widget _buildUserInfo(BuildContext context) {

    DateTime today = DateTime.now();

    String dateStr = "${today.day}-${month1[today.month-1]}-${today.year}";
    return Consumer<GstBussinessData>(builder: (BuildContext context, pro, child){
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
                      pro.BusinessProfiledata.result!.businessName??'sethi@231',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    dateStr,
                    style: theme.textTheme.bodySmall,
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
                    "GSTIN :",
                    style: CustomTextStyles.labelLargeMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      pro.BusinessProfiledata.result!.gstNo ??'23BNJPS3408M1ZP',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Return Type:",
                    style: CustomTextStyles.labelLargeMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.h),
                    child: Text(
                      "Regular",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );});
    }
  }





PreferredSizeWidget _buildAppBar(BuildContext context,size) {
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
      text: "Return Dashboard",
    ),
    actions: [
    Container(
    width: size*0.2,
    height: 22.h,
    decoration: BoxDecoration(
      color: appTheme.blue800Af,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          context.push('/gst');
        },
        child: Padding(padding: const EdgeInsets.all(0), child: Center(child: Text('Login',style: CustomTextStyles.labelLargeWhiteA700,))),
      ),
    ),
  )
    ],

  );
}





/// Section Widget
Widget _buildTableRows(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(
      left: 7.h,
      right: 4.h,
    ),
    decoration: AppDecoration.gradientBlueToBlueAf,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 33.h,
            vertical: 9.v,
          ),
          decoration: AppDecoration.gradientBlueToBlueAf,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(
                flex: 29,
              ),
              Text(
                "IGST",
                style: theme.textTheme.labelLarge,
              ),
              const Spacer(
                flex: 25,
              ),
              Text(
                "CGST",
                style: theme.textTheme.labelLarge,
              ),
              const Spacer(
                flex: 21,
              ),
              Text(
                "SGST",
                style: theme.textTheme.labelLarge,
              ),
              const Spacer(
                flex: 22,
              ),
              Text(
                "CESS",
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
        ),
        SizedBox(height: 5.v),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            right: 9.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
                child: Text(
                  "A",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              const Spacer(),
              Container(
                height: 25.v,
                width: 65.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.v),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            right: 9.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
                child: Text(
                  "B",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              const Spacer(),
              Container(
                height: 25.v,
                width: 65.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.v),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            right: 9.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
                child: Text(
                  "C",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              const Spacer(),
              Container(
                height: 25.v,
                width: 65.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.v),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            right: 9.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
                child: Text(
                  "D",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              const Spacer(),
              Container(
                height: 25.v,
                width: 65.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
        SizedBox(height: 5.v),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            right: 9.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
                child: Text(
                  "E",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              const Spacer(),
              Container(
                height: 25.v,
                width: 65.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.v),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            right: 9.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
                child: Text(
                  "F",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              const Spacer(),
              Container(
                height: 25.v,
                width: 65.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.v),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            right: 9.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
                child: Text(
                  "G",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              const Spacer(),
              Container(
                height: 25.v,
                width: 65.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.v),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            right: 8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
                child: Text(
                  "H",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              const Spacer(),
              Container(
                height: 25.v,
                width: 65.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.v,
                width: 65.h,
                margin: EdgeInsets.only(left: 3.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black9003f,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 13.v),
      ],
    ),
  );
}





