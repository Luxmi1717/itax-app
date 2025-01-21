
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/presentation/older_screens/services/gst_link/pdfview/pdf_view_screen.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/providers/providers_old/bank_api.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';

import '../../services/pdf_service.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class IfceDetailView extends StatefulWidget {
  const IfceDetailView({super.key});

  @override
  State<IfceDetailView> createState() => _IfceDetailViewState();
}

class _IfceDetailViewState extends State<IfceDetailView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: _buildAppBar(context),
        body:Consumer<BankApi>(builder: (BuildContext context, pro, child) {
          var size =MediaQuery.of(context).size;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding:
              const EdgeInsetsDirectional.all(12),
              width: double.infinity,
              height: SizeUtils.height*0.4,
              decoration: BoxDecoration(
                color: appTheme.blue800Af.withOpacity(0.4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                  Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CITY',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('BRANCH',style:theme.textTheme.titleMedium!.copyWith(
                        color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('DISTRICT',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('ADDRESS',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('UPI',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('STATE',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),

                        const SizedBox(height: 4,),
                        Text('BANK CODE',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('CONTACT',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('IMPS',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('RTGS',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('NEFT',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 4,),
                        Text('IFSC',style:theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.gray800,
                          fontSize: 15,
                        ),),
                    ],
                    ),
                  ),
                    const SizedBox(width: 20,),

                    Container(
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [





                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(pro.ifcsbank.data!.data.city
                                  .toString(), style: const TextStyle(
                                        fontSize: 12,
                                      )),
                            ],
                          ),
                          const SizedBox(height: 8,),




                                  Text(pro.ifcsbank.data!.data.branch.toString(), style: const TextStyle(
                                    fontSize: 12,
                                  ),),
                          const SizedBox(height: 8,),
                                      Text(pro.ifcsbank.data!.data.district.toString(), style: const TextStyle(
                                    fontSize: 12,
                                  )),
                          const SizedBox(height: 8,),
                          FittedBox(fit: BoxFit.fill,
                            child: Text(pro.ifcsbank.data!.data.address.toString(),
                                overflow: TextOverflow.fade,

                                maxLines: 3,
                                style: const TextStyle(fontSize: 12,)),
                          ),
                          const SizedBox(height: 8,),

                          Text(pro.ifcsbank.data!.data.upi.toString(), style: const TextStyle(
                            fontSize: 12,
                          )),
                          const SizedBox(height: 8,),
                          Text(pro.ifcsbank.data!.data.state.toString(),

                              style: const TextStyle(
                            fontSize: 12,
                          )),
                          const SizedBox(height: 8,),
                          Text(pro.ifcsbank.data!.data.bank.toString(), style: const TextStyle(
                            fontSize: 12,
                          )),
                          const SizedBox(height: 8,),
                          Text(pro.ifcsbank.data!.data.contact.toString(), style: const TextStyle(
                            fontSize: 12,
                          )),
                          const SizedBox(height: 8,),
                          Text(pro.ifcsbank.data!.data.bankcode.toString(), style: const TextStyle(
                            fontSize: 12,
                          )),
                          const SizedBox(height: 8,),
                          Text(pro.ifcsbank.data!.data.imps.toString(), style: const TextStyle(
                            fontSize: 12,
                          )),
                          const SizedBox(height: 8,),
                          Text(pro.ifcsbank.data!.data.neft.toString(), style: const TextStyle(
                            fontSize: 12,
                          )),
                          const SizedBox(height: 8,),
                          Text(pro.ifcsbank.data!.data.ifsc.toString(), style: const TextStyle(
                            fontSize: 12,
                          )),


                        ]
                              ),
                    ),
                  ],
                ),
              ),
            ),
          );


        }),
        floatingActionButton: FloatingActionButton(onPressed: () async {

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
  }


  Future<File> generatePDF(BuildContext context) async {

    final pro = Provider.of<BankApi>(context,listen: false);

    final pdf = pw.Document();
    //  final customFont = pw.Font.ttf(await rootBundle.load('fonts/PoppinsRegular'));
    final ByteData data1 = await rootBundle.load('assets/images/logo.png');
    final Uint8List backgroundImageBytes = data1.buffer.asUint8List();


    final tableHeaders = [
      'IFSC INFORMATION',
      '',

    ];



    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          children: [
            pw.SizedBox(height: 110),


            pw.Text(

              'IFSC DETAILS', // Replace with your company name
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

            pw.Row(

              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [



                pw.Container(

                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [

                    ],
                  ),
                ),
                pw.SizedBox(width: 20,),

                pw.Container(
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [

                        pw.Text('CITY', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('BRANCH', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('DISTRICT', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('ADDRESS', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('UPI', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('STATE', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('BANK CODE', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('CONTACT', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('IMPS', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('RTGS', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('NEFT', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text('IFSC', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),

  ]),),
                pw.SizedBox(width: 25,),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [

                            pw.Text(pro.ifcsbank.data!.data.city.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(pro.ifcsbank.data!.data.branch.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(pro.ifcsbank.data!.data.district.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(
                              pro.ifcsbank.data!.data.address.toString(),
                              style: const pw.TextStyle(fontSize: 12),
                            ),
                            pw.Text(pro.ifcsbank.data!.data.upi.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(pro.ifcsbank.data!.data.state.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(pro.ifcsbank.data!.data.bankcode.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(pro.ifcsbank.data!.data.contact.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(pro.ifcsbank.data!.data.imps.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(pro.ifcsbank.data!.data.rtgs.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(pro.ifcsbank.data!.data.neft.toString(), style: const pw.TextStyle(fontSize: 12)),
                            pw.Text(pro.ifcsbank.data!.data.ifsc.toString(), style: const pw.TextStyle(fontSize: 12)),

                      ]
                  ),

              ],
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

  /*Future<File> generatePDF() async {
    final hrpcalcul = Provider.of<BankApi>(context,listen: false);
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(

                  children: [
                    pw. Text(
                      "City :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.city
                        .toString()),
                  ],
                ),
                pw. SizedBox(
                  height: 10,
                ),
                pw.Row(

                  children: [
                    pw. Text(
                      "Branch :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.branch.toString()),
                  ],
                ),
                pw. SizedBox(
                  height: 10,
                ),
                pw.Row(
                  children: [
                    pw. Text(
                      "District :-",
                      style: pw.TextStyle(

                        fontWeight:pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.district
                        .toString()),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                     pw.Text(
                      "Address :-",
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),
                    pw.SizedBox(height: 10,),
                    pw.Text(hrpcalcul.ifcsbank.data!.data.address.toString()),
                  ],
                ),
                pw .SizedBox(
                  height: 10,
                ),
                pw.Row(
                  children: [
                    pw.Text(
                      "UPI :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.upi
                        .toString()),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  children: [
                    pw. Text(
                      "State :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.state
                        .toString()),
                  ],
                ),
                pw. SizedBox(
                  height: 10,
                ),pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw. Text(
                      "Bank :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),
                    pw.SizedBox(height: 7,),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.bank.toString()),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  children: [
                    pw.Text(
                      "Contact :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.contact
                        .toString()),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw. Row(
                  children: [
                    pw.Text(
                      "Bank Code :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.bankcode
                        .toString()),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  children: [
                    pw.Text(
                      "IMPS :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.imps
                        .toString()),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),

                pw.Row(
                  children: [
                    pw.Text(
                      "NEFT :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.bankcode.toString()),
                  ],
                ),
                pw. SizedBox(
                  height: 10,
                ),

                pw.Row(
                  children: [
                     pw.Text(
                      "RTGS :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.bankcode
                        .toString()),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),

                pw.Row(
                  children: [
                    pw. Text(
                      "IFSC :-",
                      style: pw.TextStyle(

                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                    ),

                    pw.Text(hrpcalcul.ifcsbank.data!.data.ifsc
                        .toString()),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),



              ]);
        })); //
    // image = (await rootBundle.load("assets/images/itax.png")).buffer.asUint8List();

    return FileHandleApi.saveDocument(name: 'IFSC Varification', pdf: pdf);
  }*/
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
      text: "IFSC Information",
    ),
  );
}