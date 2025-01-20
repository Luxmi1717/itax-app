
import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/models/gstservice_model/pan_search.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/providers/providers_old/services_gst_links.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';



class PanSearchResult extends StatefulWidget {
  const PanSearchResult({super.key});

  @override
  State<PanSearchResult> createState() => _PanSearchResultState();
}

class _PanSearchResultState extends State<PanSearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_buildAppBar(context),
      body:Consumer<PanSearch>(builder: (BuildContext context, pro, child) {
        PanSearchModel panSearchModel = pro.PanSearchDetails.data!;
        Data data = panSearchModel.data.first.data;


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

                                Text(data.gstin),
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

                                Text(data.rgdt.toString()),
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

                                Text(data.tradeNam.toString()),
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

                                Text(data.rgdt.toString()),
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

                                Text(data.ctb.toString()),
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

                                Text(data.sts.toString()),
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

                                Text(data.dty.toString()),
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

                                Text(data.dty.toString()),
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

                                Text(data.pradr.addr.bno.toString()+data.pradr.addr.dst.toString()+data.pradr.addr.flno.toString()+data.pradr.addr.st.toString()+data.pradr.addr.stcd.toString()),
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

                                Text(data.pradr.addr.stcd.toString()+data.pradr.addr.pncd.toString()),
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
      /*floatingActionButton: FloatingActionButton(onPressed: () async {

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
                crossAxisAlignment:
                pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(

                    children: [
                     pw. Text(
                        "Company Name :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.companyName
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Row(

                    children: [
                       pw.Text(
                        "Class :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.classOfCompany
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Row(
                    children: [
                      pw. Text(
                        "Company Category :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw. Text(pro.companyDetails.data!.results.data.companyMasterData.companyCategory
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Email Id :-",
                        style:pw. TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.emailId.toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Row(
                    children: [
                      pw. Text(
                        "Number of Mem :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.numberOfMembersApplicableInCaseOfCompanyWithoutShareCapital
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Date Of The Last AGM :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.dateOfIncorporation
                          .toString()),
                    ],
                  ),
                  pw. SizedBox(
                    height: 10,
                  ),pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw. Text(
                        "Registered Address :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),
                      pw.SizedBox(height: 7,),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.registeredAddress
                          .toString()),
                    ],
                  ),
                  pw. SizedBox(
                    height: 10,
                  ),
                  pw.Row(
                    children: [
                      pw. Text(
                        "Address Other Then R/O :-",
                        style:pw. TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.addressOtherThanROWhereAllOrAnyBooksOfAccountAndPapersAreMaintained
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw. Row(
                    children: [
                      pw.Text(
                        "Active Compliance :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.activeCompliance
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw. Row(
                    children: [
                      pw. Text(
                        "Registration Number :-",
                        style: pw.TextStyle(

                          fontWeight:pw. FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.registrationNumber
                          .toString()),
                    ],
                  ),
                  pw. SizedBox(
                    height: 10,
                  ),

                  pw. Row(
                    children: [
                      pw.Text(
                        "Registration Number :-",
                        style: pw.TextStyle(

                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.registrationNumber
                          .toString()),
                    ],
                  ),
                  pw. SizedBox(
                    height: 10,
                  ),

                  pw.Row(
                    children: [
                      pw. Text(
                        "Paid Up Capital(rs) :-",
                        style: pw.TextStyle(

                          fontWeight:pw. FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.paidUpCapitalRs
                          .toString()),
                    ],
                  ), pw.SizedBox(
                    height: 10,
                  ),

                  pw.Row(
                    children: [
                       pw.Text(
                        "Whether Listed Or Not :-",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.whetherListedOrNot
                          .toString()),
                    ],
                  ),
                  pw. SizedBox(
                    height: 10,
                  ),

                  pw. Row(
                    children: [
                      pw.Text(
                        "Suspended At Stock Exchange :-",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.suspendedAtStockExchange
                          .toString()),
                    ],
                  ), pw.SizedBox(
                    height: 10,
                  ),

                  pw.Row(
                    children: [
                      pw.Text(
                        "Company Subcategory :-",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.companySubcategory
                          .toString()),
                    ],
                  ),
                  pw. SizedBox(
                    height: 10,
                  ),

                  pw. Row(
                    children: [
                      pw.Text(
                        "Authorised Capital(rs) :-",
                        style: pw.TextStyle(
                          fontWeight:pw. FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.authorisedCapitalRs
                          .toString()),
                    ],
                  ),
                  pw. SizedBox(
                    height: 10,
                  ),

                  pw.Row(
                    children: [
                      pw.Text(
                        "Company Status(For Efiling) :-",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.companyStatusForEfiling
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),

                  pw.Row(
                    children: [
                      pw. Text(
                        "Roc Code :-",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw. Text(pro.companyDetails.data!.results.data.companyMasterData.rocCode
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),

                  pw.Row(
                    children: [
                      pw. Text(
                        "Company Subcategory :-",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.companySubcategory
                          .toString()),
                    ],
                  ),
                  pw. SizedBox(
                    height: 10,
                  ),

                  pw.Row(
                    children: [
                      pw.Text(
                        "Date Of Balance Sheet :-",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw.Text(pro.companyDetails.data!.results.data.companyMasterData.dateOfBalanceSheet
                          .toString()),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),

                  pw.Row(
                    children: [
                      pw.Text(
                        "Date Of Incorporation :-",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 17.5,
                        ),
                      ),

                      pw. Text(pro.companyDetails.data!.results.data.companyMasterData.dateOfIncorporation
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

    return FileHandleApi.saveDocument(name: 'Company Details', pdf: pdf);
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
      text: "GSTIN Details",
    ),
  );
}