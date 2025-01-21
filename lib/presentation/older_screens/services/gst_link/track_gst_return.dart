import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/presentation/older_screens/services/gst_link/pdfview/pdf_view_screen.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/presentation/older_widgets/widgets/primary_button.dart';
import 'package:itax/presentation/older_widgets/widgets/text_decoration.dart';
import 'package:itax/providers/providers_old/services_gst_links.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:pdf/pdf.dart';

import 'package:provider/provider.dart';


import '../pdf_service.dart';
import 'package:pdf/widgets.dart' as pw;



class TrackGSTReturnPage extends StatefulWidget {
  const TrackGSTReturnPage({super.key});

  @override
  State<TrackGSTReturnPage> createState() => _TrackGSTReturnPageState();
}

class _TrackGSTReturnPageState extends State<TrackGSTReturnPage> {
  TextEditingController controller=TextEditingController();
  TextEditingController gstinNumber =TextEditingController();
  TextEditingController financialYear=TextEditingController();

  List<String> financialYears = [
    '2020-21',
    '2021-22',
    '2022-23',
    '2023-24',
    // Add more financial years as needed
  ];

  String? selectedFinancialYear;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return
      WillPopScope(
        onWillPop: () async {
          context.read<GSTINTrackReturn>().setVisible(false);
          return true;
        },
        child: Scaffold(
          appBar:_buildAppBar(context),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 20,
                  ),

                  const textdecoration(
                    text: 'GSTIN Number',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlueTextField(
                    controller:gstinNumber,
                    initialValue:gstinNumber.text,
                    capitalization: TextCapitalization.characters,
                    hintText: 'Enter GSTIN Number',

                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const textdecoration(
                    text: 'financialYear',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 55,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                        ),]
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButton<String>(
                          underline: const SizedBox(),
                          isExpanded: true,
                          hint: const Text("Select Year"),
                          value: selectedFinancialYear,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedFinancialYear = newValue!;
                            });
                          },
                          items: financialYears.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // BlueTextField(
                  //   controller:financialYear,
                  //   initialValue:financialYear.text,
                  //
                  //   hintText: 'Enter gst_state_code code',
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<GSTINTrackReturn>(builder: (BuildContext context, pro, child) {
                    return PrimaryButton(

                      onTap: () {
                        bool isValid = validateGSTIN(gstinNumber.text);
                        {
                          if (isValid) {
                            Map data={
                              "gstin": gstinNumber.text,
                              "financialYear": "FY $selectedFinancialYear"
                              // "financialYear": financialYear.text
                            };

                            pro.GSTINTrackProv(data, context);

                          } else {
                            Utils.flushbarErrorMessage('GSTIN code is invalid', context);
                          }
                        }

                      },
                      child: Center(
                          child: !pro.loading
                              ?const Text(
                            'Search',
                            style: TextStyle(color: Colors.white,fontSize: 15),
                          ):  const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),)),
                    );
                  }),
                 SizedBox(height: height/40),
                  Consumer<GSTINTrackReturn>(builder: (BuildContext context, result, child) {
                    return Visibility(
                      visible: result.visible,
                      child: SizedBox(
                        width: double.infinity,
                        child: StreamBuilder<Object>(
                            stream: null,
                            builder: (context, snapshot) {
                              return Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: result.GSTINTrackDetails.data!.data!.eFiledlist!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        width: width/1.5,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow:[
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5), //color of shadow
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(height: height/50),
                                            Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("ARN No : -",style: TextStyle(fontSize: height/50),),
                                                Text(result.GSTINTrackDetails.data!.data!.eFiledlist?[index].arn ?? "",style: TextStyle(fontSize: height/50),),
                                              ],
                                            ),
                                            const Divider(),
                                            Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Mode of Filing :- ",style: TextStyle(fontSize: height/50),),
                                                Text(result.GSTINTrackDetails.data!.data!.eFiledlist?[index].mof ?? "",style: TextStyle(fontSize: height/50),),
                                              ],
                                            ),
                                            const Divider(),
                                            Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Return Period:- ",style: TextStyle(fontSize: height/50),),
                                                Text(result.GSTINTrackDetails.data!.data!.eFiledlist?[index].retPrd ?? "",style: TextStyle(fontSize: height/50),),
                                              ],
                                            ),
                                            const Divider(),
                                            Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Valid:- ",style: TextStyle(fontSize: height/50),),
                                                Text(result.GSTINTrackDetails.data!.data!.eFiledlist?[index].valid ?? "",style: TextStyle(fontSize: height/50),),
                                              ],
                                            ),
                                            SizedBox(height: height/100),
                                            const Divider(),
                                            SizedBox(height: height/100),
                                            ElevatedButton(onPressed: () {

                                            }, child: Text("Status : - ${result.GSTINTrackDetails.data!.data!.eFiledlist?[index].status ?? ""}"))
                                          ],
                                        ),
                                      ),
                                    );
                                  },),
                              );
                              // return SingleChildScrollView(
                              //   scrollDirection: Axis.horizontal,
                              //   child: Card(
                              //     child: Column(children: [
                              //       DataTable(
                              //           columnSpacing: 8,
                              //           columns: const [
                              //             DataColumn(
                              //                 label: Text('Valid',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.bold))),
                              //             DataColumn(
                              //                 label: Text('Returntype',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.bold))),
                              //             DataColumn(
                              //                 label: Text('Mode of filling',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.bold))),
                              //             DataColumn(
                              //                 label: Text('Return period',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.bold))),
                              //             DataColumn(
                              //                 label: Text('din Number',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.bold))),
                              //             DataColumn(
                              //                 label: Text('Status',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.bold))),
                              //           ],
                              //           rows: result.GSTINTrackDetails.data!.data!.eFiledlist!.map((e) {
                              //             return DataRow(cells: [
                              //               DataCell(Text(e.valid.toString())),
                              //               DataCell(Text(e.rtntype.toString())),
                              //               DataCell(Text(e.mof.toString())),
                              //               DataCell(Text(e.retPrd.toString())),
                              //               DataCell(Text(e.arn.toString())),
                              //               DataCell(Text(e.status.toString())),
                              //             ]);
                              //           }).toList()),
                              //     ]),
                              //   ),
                              // );
                            }),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          floatingActionButton: Consumer<GSTINTrackReturn>(builder: (BuildContext context, result, child) {
          return Visibility(
            visible: result.visible,
            child: FloatingActionButton(onPressed: () async {

              final pdfFile = await generatePDF(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      PdfViewScreens(
                        urlPath: pdfFile.path,
                      ),
                ),
              );

            },
              backgroundColor: appTheme.blue800Af,
              child: const Icon(Icons.download),
            ),
          );
          }),
        ),

      );
  }

  Future<File> generatePDF(BuildContext context) async {

    final result = Provider.of<GSTINTrackReturn>(context, listen: false);

    final pdf = pw.Document();
  //  final customFont = pw.Font.ttf(await rootBundle.load('fonts/PoppinsRegular'));
    final ByteData data1 = await rootBundle.load('assets/images/logo.png');
    final Uint8List backgroundImageBytes = data1.buffer.asUint8List();


    final tableHeaders = [
      'Valid',
      'Return Type',
      'Mode of Filing',
      'Return Period',
      'DIN Number',
      'Status'
    ];
    List<List<dynamic>> tableData = result.GSTINTrackDetails.data!.data!.eFiledlist!
        .map((e) => [
      e.valid.toString(),
      e.rtntype.toString(),
      e.mof.toString(),
      e.retPrd.toString(),
      e.arn.toString(),
      e.status.toString(),
    ]).toList();


    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          children: [
            pw.SizedBox(height: 140),


            pw.Text(

              ' GST RETURN DETAILS', // Replace with your company name
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 25,
                color: PdfColors.grey
                // Text color

                // Text size
              ),
            ),
            pw.SizedBox(
              width: 300,
              child: pw.Divider(color: PdfColors.grey, thickness: 2),
            ),
            pw.SizedBox(height: 30),

            pw.Table.fromTextArray(
              headers: tableHeaders,
              data: tableData,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration:
              const pw.BoxDecoration(
                  color: PdfColors.grey),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
                4: pw.Alignment.centerRight,
              },
            ),
            ],



        ),
        pageTheme: pw.PageTheme(

          theme: pw.ThemeData.withFont(

          ),
          buildBackground: (context) => pw.FullPage(
            ignoreMargins: true,
            child: pw.Container(
              margin: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                    color: PdfColors.black, width: 1),
              ),
              child: pw.Container(
                margin: const pw.EdgeInsets.all(5),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(
                      color: const PdfColor.fromInt(0XAF2057CE), width: 5),
                ),
                width: double.infinity,
                height: double.infinity,
                child: pw.Stack(
                  alignment: pw.Alignment.center,
                  children: [

                    pw.Positioned(
                      right: 5,
                      top: 30,
                      child: pw.Transform(
                        transform: Matrix4.diagonal3Values(1, 1, 1),
                        adjustLayout: true,
                        child:    pw.Padding(
                          padding:  const pw.EdgeInsets.all(25.0),
                          child: pw.Column(
                              children:[
                                pw.Text(

                                  'iTaxEasy', // Replace with your company name
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 25,
                                    // Text color

                                    // Text size
                                  ),
                                ),

                                pw.Text(

                                  'Indias Most Trusted Accounting And Financial Platform', // Replace with your company name
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 8,
                                    // Text color

                                    // Text size
                                  ),
                                ),
                              ]
                          ),),

                      ),
                    ),

                    pw.Positioned(
                      top: 5,
                      left: 35,

                      child: pw.Transform(
                        transform: Matrix4.diagonal3Values(1, 1, 1,),
                        adjustLayout: true,
                        child: pw.Container(
                          height: 150,

                          // rSet the header background color
                          padding: const pw.EdgeInsets.symmetric(vertical: 0), // Adjust padding as needed
                          child:pw. Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              // Company Logo (Replace with your logo image)
                              pw.Padding(
                                padding:  const pw.EdgeInsets.all(0.0),
                                child:pw.Container(
                                  height: 100,
                                  width: 180,
                                  child: pw.Image(
                                    pw.MemoryImage(backgroundImageBytes),

                                  ),
                                ),
                              ),
                              pw.SizedBox(width: 150),

                            ],
                          ),
                        ),

                      ),
                    ),
                    pw.Positioned(
                      bottom: 5,
                      left: 140,
                      child: pw.Transform(
                        transform: Matrix4.diagonal3Values(1, 1, 1),
                        adjustLayout: true,
                        child:
                        pw.Column(
                            children:[
                              pw.Text(
                                ' Sat 1 ,Flat - 811, Logix Zest Blossom, Sector 143, Noida 201306 ( U.P)', style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10,
                                // Text color

                                // Text size
                              ),),



                              pw.Text(
                                'support@itaxeasy.com', style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18,
                                // Text color

                                // Text size
                              ),),]),

                      ),
                    ),
                    pw.Positioned(
                      bottom: 5,
                      right: 5,
                      child: pw.Transform(
                        transform: Matrix4.diagonal3Values(-1, -1, 1),
                        adjustLayout: true,

                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(
                        top: 10,
                        left: 80,
                        right: 80,
                        bottom: 80,
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Save or display the PDF as needed
    return FileHandleApi.saveDocument(name: 'gst_details', pdf: pdf);
  }

}
bool validateGSTIN(String gstin) {
  final gstinPattern = RegExp(r"^\d{2}[A-Z]{5}\d{4}[A-Z]{1}\d[Z]{1}[A-Z\d]{1}$",);

  return gstinPattern.hasMatch(gstin);
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
      text: "Track Gst Return",
    ),
  );
}