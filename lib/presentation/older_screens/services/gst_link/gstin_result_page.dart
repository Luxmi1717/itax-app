
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/providers/providers_old/services_gst_links.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:pdf/pdf.dart';

import 'package:provider/provider.dart';


import '../pdf_service.dart';
import 'package:pdf/widgets.dart' as pw;

class GSTINResult extends StatefulWidget {
  const GSTINResult({super.key});

  @override
  State<GSTINResult> createState() => _GSTINResultState();
}

class _GSTINResultState extends State<GSTINResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_buildAppBar(context),
      body:Consumer<gstinLink>(builder: (BuildContext context, pro, child) {
        return SizedBox(
          width: double.infinity,
          child: StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, top: 10, bottom: 10),
                    child:  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: [
                                const Text(
                                  "GSTIN :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text(pro.GSTDetails.data!.data.data.gstin.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(

                              children: [
                                const Text(
                                  "Registration Date :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text(pro.GSTDetails.data!.data.data.rgdt.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Trade Name :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text(pro.GSTDetails.data!.data.data.tradeNam
                                    .toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Effective Date Of Registration :-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text(pro.GSTDetails.data!.data.data.rgdt.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Constitution of Business :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text(pro.GSTDetails.data!.data.data.ctb.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "GSTIN/UIN/Status :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text(pro.GSTDetails.data!.data.data.sts.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "TaxPayer Type :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),
                                const SizedBox(height: 7,),

                                Text(pro.GSTDetails.data!.data.data.dty.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "State Juridication :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text(pro.GSTDetails.data!.data.data.dty.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Administrative Office :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text("${pro.GSTDetails.data!.data.data.pradr.addr.bno} ${pro.GSTDetails.data!.data.data.pradr.addr.flno} ${pro.GSTDetails.data!.data.data.pradr.addr.dst}"),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "State  :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text(pro.GSTDetails.data!.data.data.pradr.addr.stcd.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Principal place of Business :-",
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 17.5,
                                  ),
                                ),

                                Text(pro.GSTDetails.data!.data.data.pradr.addr.stcd.toString()+pro.GSTDetails.data!.data.data.pradr.addr.pncd.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),



                          ]),
                    ),
                  ),
                );
              }),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: () async {

            final pdfFile = await generatePDF(context);
            FileHandleApi.openFile(pdfFile);

          },
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.download),
          ),
    );
  }
  Future<File> generatePDF(BuildContext context) async {

    final pro = Provider.of<gstinLink>(context,listen: false);

    final pdf = pw.Document();
    final customFont = pw.Font.ttf(await rootBundle.load('assets/fonts/Anton-Regular.ttf'));
    final ByteData data = await rootBundle.load('assets/images/logo.png');
    final Uint8List backgroundImageBytes = data.buffer.asUint8List();

    final headingFont = pw.Font.ttf(
        await rootBundle.load("assets/fonts/Anton-Regular.ttf"));

    final paragraphFont = pw.Font.ttf(
        await rootBundle.load("assets/fonts/Roboto-Black.ttf"));



    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          children: [
            pw.SizedBox(height: 140),


            pw.Text(

              'GSTIN DETAILS', // Replace with your company name
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 25,
                font: headingFont,
                // Text color

                // Text size
              ),
            ),
            pw.SizedBox(
              width: 300,
              child: pw.Divider(color: PdfColors.blue, thickness: 2),
            ),
            pw.SizedBox(height: 30),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "GSTIN ",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),

                pw.Text(pro.GSTDetails.data!.data.data.gstin.toString(), style: pw.TextStyle(
                  color: PdfColors.blue,
                  font: paragraphFont,
                  fontSize: 17,

                )),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw. Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw. Text(
                  "Registration Date ",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),

                pw.Text(pro.GSTDetails.data!.data.data.rgdt.toString(), style: pw.TextStyle(
                  color: PdfColors.blue,
                  font: paragraphFont,
                  fontSize: 17,

                )),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "Trade Name ",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),

                pw.Text(pro.GSTDetails.data!.data.data.tradeNam
                    .toString(), style: pw.TextStyle(
                  color: PdfColors.blue,
                  font: paragraphFont,
                  fontSize: 17,

                )),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  "Effective Date Of Registration ",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw. Text(pro.GSTDetails.data!.data.data.rgdt.toString(), style: pw.TextStyle(
                        color: PdfColors.blue,
                        font: paragraphFont,
                        fontSize: 17,

                      )),]),
              ],
            ),
            pw. SizedBox(
              height: 15,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "Constitution of Business ",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),

                pw. Text(pro.GSTDetails.data!.data.data.ctb.toString(), style: pw.TextStyle(
                  color: PdfColors.blue,
                  font: paragraphFont,
                  fontSize: 17,

                )),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "GSTIN/UIN/Status",
                  style: pw.TextStyle(

                    fontWeight:pw. FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),

                pw.Text(pro.GSTDetails.data!.data.data.sts.toString(), style: pw.TextStyle(
                  color: PdfColors.blue,
                  font: paragraphFont,
                  fontSize: 17,

                )),
              ],
            ),
            pw. SizedBox(
              height: 15,
            ),pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw. Text(
                  "TaxPayer Type ",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,

                  ),
                ),
                pw.SizedBox(height: 7,),

                pw.Text(pro.GSTDetails.data!.data.data.dty.toString(),style: pw.TextStyle(
                  color: PdfColors.blue,
                  font: paragraphFont,
                  fontSize: 17,

                )),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "State Juridication",
                  style:pw. TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),

                pw.Text(pro.GSTDetails.data!.data.data.dty.toString(),
                    style: pw.TextStyle(
                      color: PdfColors.blue,
                      font: paragraphFont,
                      fontSize: 17,

                    )),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  "Administrative Office ",
                  style:pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Text("${pro.GSTDetails.data!.data.data.pradr.addr.bno} ${pro.GSTDetails.data!.data.data.pradr.addr.flno} ${pro.GSTDetails.data!.data.data.pradr.addr.dst}", style: pw.TextStyle(
                        color: PdfColors.blue,
                        font: paragraphFont,
                        fontSize: 17,

                      )),]),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "State ",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),

                pw.Text(pro.GSTDetails.data!.data.data.pradr.addr.stcd.toString(), style: pw.TextStyle(
                  color: PdfColors.blue,
                  font: paragraphFont,
                  fontSize: 17,

                )),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  "Principal place of Business ",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                    font: headingFont,
                  ),
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Text(pro.GSTDetails.data!.data.data.pradr.addr.stcd.toString()+pro.GSTDetails.data!.data.data.pradr.addr.pncd.toString(), style: pw.TextStyle(
                        color: PdfColors.blue,
                        font: paragraphFont,
                        fontSize: 17,

                      )),]),
              ],
            ),
            pw. SizedBox(
              height: 10,
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
                      color: PdfColors.blue, width: 5),
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
                      child: pw.Text('hello'),

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
    return FileHandleApi.saveDocument(name: 'gstin_details', pdf: pdf);
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
      text: "Search by GSTIN",
    ),
  );
}