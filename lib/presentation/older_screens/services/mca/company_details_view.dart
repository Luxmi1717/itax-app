

import 'package:flutter/material.dart';
import 'package:itax/providers/services-old/mca_api.dart';
import 'package:itaxeasy/providers/mca_api.dart';
import 'package:itaxeasy/utility/size_utils.dart';

import 'package:provider/provider.dart';

import '../../../config/image_constant.dart';
import '../../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';

class CompanyDetailView extends StatefulWidget {
  const CompanyDetailView({super.key});

  @override
  State<CompanyDetailView> createState() => _CompanyDetailViewState();
}

class _CompanyDetailViewState extends State<CompanyDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Company Details'),
        elevation: 0,),
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
                                "Company Name :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.companyName.toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(

                            children: [
                              const Text(
                                "Class :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.classOfCompany
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Company Category :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.companyCategory
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Email Id :-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.emailId.toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Number of Mem :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.numberOfMembersApplicableInCaseOfCompanyWithoutShareCapital
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Date Of The Last AGM :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.dateOfIncorporation
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Registered Address :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),
                              const SizedBox(height: 7,),

                              Text(pro.companyDetails.data!.data.companyMasterData.registeredAddress
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Address Other Then R/O :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.addressOtherThanROWhereAllOrAnyBooksOfAccountAndPapersAreMaintained
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Active Compliance :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.activeCompliance
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Registration Number :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.registrationNumber
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Registration Number :-",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.registrationNumber
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Paid Up Capital(rs) :-",
                                style: TextStyle(
                                  // fontFamily: "Poppins",
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.paidUpCapitalRs
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Whether Listed Or Not :-",
                                style: TextStyle(
                                  // fontFamily: "Poppins",
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.whetherListedOrNot
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Suspended At Stock Exchange :-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.suspendedAtStockExchange
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Company Subcategory :-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.companySubcategory
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Authorised Capital(rs) :-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.authorisedCapitalRs
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Company Status(For Efiling) :-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.companyStatusForEfiling
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Roc Code :-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.rocCode
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Company Subcategory :-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.companySubcategory
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Date Of Balance Sheet :-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.dateOfBalanceSheet
                                  .toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              const Text(
                                "Date Of Incorporation :-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                              ),

                              Text(pro.companyDetails.data!.data.companyMasterData.dateOfIncorporation
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
      text: "Company Details",
    ),
  );
}