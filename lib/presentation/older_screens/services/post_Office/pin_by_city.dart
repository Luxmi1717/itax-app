import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/presentation/older_screens/services/gst_link/pdfview/pdf_view_screen.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/primary_button.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/text-decoration-widget.dart';
import 'package:itax/providers/services-old/services_post_office_link.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:pdf/pdf.dart';

import 'package:provider/provider.dart';

import 'package:pdf/widgets.dart' as pw;


import '../pdf_service.dart';

class PinbyCityPage extends StatefulWidget {
  const PinbyCityPage({super.key});

  @override
  State<PinbyCityPage> createState() => _PinbyCityPageState();
}

class _PinbyCityPageState extends State<PinbyCityPage> {
  TextEditingController controller=TextEditingController();
  TextEditingController CityName =TextEditingController();




  final bool _ifscValid = true;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(
                  height: 20,
                ),

                const textdecoration(
                  text: 'City name',
                ),
                const SizedBox(
                  height: 15,
                ),
                BlueTextField(
                  controller:CityName,
                  initialValue:CityName.text,
                  capitalization: TextCapitalization.characters,



                  hintText: 'Enter City Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<PincodeByCity>(builder: (BuildContext context, pro, child) {
                  return PrimaryButton(

                    onTap: () {
                      bool isValid = validateGSTIN(CityName.text);
                      {
                        if (isValid) {
                          print(CityName.text.toString());

                          pro.PinCodeByCityProv(CityName.text, context);

                        } else {
                          Utils.flushbarErrorMessage('Pan code is invalid', context);
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
                const SizedBox(height: 20,),
                Consumer<PincodeByCity>(builder: (BuildContext context, result, child) {

                  return Visibility(
                    visible: result.visible,
                    child: SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Card(
                                child: Column(children: [
                                  DataTable(
                                      columnSpacing: 2,
                                      headingRowColor: WidgetStateColor.resolveWith((states) => appTheme.blue800Af),
                                      dataRowColor: WidgetStateColor.resolveWith((states) => appTheme.blue800Af.withOpacity(0.1),),
                                      columns: const [
                                        DataColumn(
                                            label: Text('OfficeName',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.bold))),
                                        DataColumn(
                                            label: Text('PinCode',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.bold))),
                                        DataColumn(
                                            label: Text('Taluk',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.bold))),
                                        DataColumn(
                                            label: Text('DistrictName',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.bold))),
                                        DataColumn(
                                            label: Text('StateName',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.bold))),
                                      ],
                                      rows: result.PincodebyCityDetails.data!.data.map((e) {
                                        return DataRow(cells: [
                                          DataCell(Text(e.officeName.toString(),style: const TextStyle(
                                              fontSize: 8,
                                              ))),
                                          DataCell(Text(e.pincode.toString(),style: const TextStyle(
                                            fontSize: 8,
                                          ))),
                                          DataCell(Text(e.taluk.toString(),style: const TextStyle(
                                            fontSize: 8,
                                          ))),
                                          DataCell(Text(e.districtName.toString(),style: const TextStyle(
                                            fontSize: 8,
                                          ))),
                                          DataCell(Text(e.stateName.toString(),style: const TextStyle(
                                            fontSize: 8,
                                          ))),
                                        ]);
                                      }).toList()),

                                ]),
                              ),
                            );
                          }),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        floatingActionButton: Consumer<PincodeByCity>(builder: (BuildContext context, result, child) {
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

      );
  }

  Future<File> generatePDF(BuildContext context) async {

    final result = Provider.of<PincodeByCity>(context, listen: false);

    final pdf = pw.Document();
    //  final customFont = pw.Font.ttf(await rootBundle.load('fonts/PoppinsRegular'));
    final ByteData data1 = await rootBundle.load('assets/images/logo.png');
    final Uint8List backgroundImageBytes = data1.buffer.asUint8List();


    final tableHeaders = [
      'OfficeName',
      'Pincode',
      'Taluk',
      'DistrictName',
      'stateName',

    ];
    List<List<dynamic>> tableData = result.PincodebyCityDetails.data!.data.map((e) => [
      e.officeName.toString(),
      e.pincode.toString(),
      e.taluk.toString(),
      e.districtName.toString(),
      e.stateName.toString(),
    ]).toList();


    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          children: [
            pw.SizedBox(height: 110),


            pw.Text(

              ' PIN BY CITY DETAILS', // Replace with your company name
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                  color: PdfColors.grey
                // Text color

                // Text size
              ),
            ),
            pw.SizedBox(
              width: 300,
              child: pw.Divider(color: PdfColors.grey, thickness: 2),
            ),
            pw.SizedBox(height: 10),

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
                                  height: 90,
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
    return FileHandleApi.saveDocument(name: 'PinCode Information', pdf: pdf);
  }
  bool validateGSTIN(String gstin) {
    final gstinPattern = RegExp(
      r"^^[A-Za-z\s'-]+$",
    );

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
        text: "Pin Code Details",
      ),
    );
  }
}
