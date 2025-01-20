

import 'package:flutter/material.dart';
import 'package:itaxeasy/utility/size_utils.dart';

import 'package:provider/provider.dart';

import '../../../config/image_constant.dart';
import '../../../providers/mca_api.dart';
import '../../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';



class DirectorDetails extends StatefulWidget {
  const DirectorDetails({super.key});

  @override
  State<DirectorDetails> createState() => _DirectorDetailsState();
}

class _DirectorDetailsState extends State<DirectorDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: _buildAppBar(context),
        body:Consumer<mca>(builder: (BuildContext context, pro, child) {
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
                                    "Director Name :-",
                                    style: TextStyle(

                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      fontSize: 17.5,
                                    ),
                                  ),

                                  Text(pro.dirctorDetails.data!.results.data.directorData.name
                                      .toString()),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(

                                children: [
                                  const Text(
                                    "Din No. :-",
                                    style: TextStyle(

                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      fontSize: 17.5,
                                    ),
                                  ),

                                  Text(pro.dirctorDetails.data!.results.data.directorData.din
                                      .toString()),
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
        /*floatingActionButton: FloatingActionButton(
          onPressed: () async {

          final pdfFile = await generatePDF();
          FileHandleApi.openFile(pdfFile);

        },
          child: Icon(Icons.download),
          backgroundColor: Colors.deepPurple,
        ),*/
      );
  }
  /*Future<File> generatePDF() async {
    final pro = Provider.of<mca>(context,listen: false);
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [

                  pw.Row(

                    children: [
                      pw. Text(
                        "Director Name :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.dirctorDetails.data!.results.data.directorData.name
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Row(

                    children: [
                      pw. Text(
                        "Din No :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.dirctorDetails.data!.results.data.directorData.din
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                ]),
          );
        })); //
    // image = (await rootBundle.load("assets/images/itax.png")).buffer.asUint8List();

    return FileHandleApi.saveDocument(name: 'Director Details', pdf: pdf);
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
      text: "Director Details",
    ),
  );
}