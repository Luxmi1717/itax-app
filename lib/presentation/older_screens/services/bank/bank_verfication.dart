import 'dart:io';

import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/presentation/older_widgets/widgets/primary_button.dart';
import 'package:itax/presentation/older_widgets/widgets/text_decoration.dart';
import 'package:itax/providers/providers_old/bank_api.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';




import 'package:pdf/widgets.dart' as pw;

import '../../../older_widgets/widgets/app_bar/custom_app_bar.dart';
import '../pdf_service.dart';


class BankVerfiction extends StatefulWidget {
  const BankVerfiction({super.key});

  @override
  State<BankVerfiction> createState() => _BankVerfictionState();
}
final _formKey = GlobalKey<FormState>();

TextEditingController AccoutNo = TextEditingController();
TextEditingController IFSC = TextEditingController();
TextEditingController HolderName = TextEditingController();
TextEditingController  ModileNumber= TextEditingController();
class _BankVerfictionState extends State<BankVerfiction> {

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,

            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const textdecoration(
                      text: 'Account Number',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlueTextField(
                      controller:AccoutNo,
                      initialValue:AccoutNo.text,
                      validator: (value) {
                        if (validateBankAccount(value.toString())) {

                        }else {
                          return 'Bank account is invalid';
                        }
                        return null;
                      },



                      hintText: 'Enter Account Number',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const textdecoration(
                      text: 'IFSC Code',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlueTextField(
                      controller:IFSC,
                      initialValue:IFSC.text,
                      validator: (value) {
                            if (validateIFSCCode(value.toString())) {

                            } else {
                            return 'IFSC code is invalid.';
                            }
                            return null;},




                      hintText: 'Ifsc Code',
                    ),


                    const SizedBox(
                      height: 15,
                    ),
                    const textdecoration(
                      text: 'Ac Holder Name',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlueTextField(
                      controller:HolderName,
                      initialValue:HolderName.text,
                      validator: (value) {

                            if (validateName(value.toString())) {

                            } else {
                            return 'Name is invalid fist later is capital';
                            }
                            return null;},




                      hintText: 'Ifsc Code',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const textdecoration(
                      text: 'Mobile Number',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlueTextField(
                      controller:ModileNumber,
                      initialValue:ModileNumber.text,
                      validator: (value) {
                            if (validatePhoneNumber(value.toString())) {

                            } else {
                            return 'Phone number is invalid.';
                            }
                            return null;},



                      hintText: 'Enter Mobile Number',
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Consumer<BankApi>(builder: (BuildContext context, pro, child) {
                      return PrimaryButton(

                        onTap: (){

                   if (_formKey.currentState!.validate()) {
                        Map data = {
                          "accountNumber": AccoutNo.text,
                            "ifsc": IFSC.text,
                             "name": HolderName.text,
                           "mobile": int.parse(ModileNumber.text),
                             };
                        pro.BankValidationProvider(data, context);
                         }
                        },
                        child: Center(
                            child: !pro.loading1
                                ? const Text('Search', style: TextStyle(color: Colors.white,fontSize: 15),):  const SizedBox(height: 15, width: 15, child: CircularProgressIndicator(
                                color: Colors.white,
                              ),)),
                      );
                    }),
                    const SizedBox(height: 10,),
                    Consumer<BankApi>(builder: (BuildContext context, pro, child) {
                      return Visibility(
                        visible: pro.visible,
                        child: SizedBox(
                          width: double.infinity,
                          child: StreamBuilder<Object>(
                              stream: null,
                              builder: (context, snapshot) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10, bottom: 10),
                                    child:  Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Account Status",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 17.5,
                                            ),
                                          ),
                                          Text(pro.bankvalidation.data!.results!.data!.message.toString()),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            "Account Holder Name",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 17.5,
                                            ),
                                          ),
                                          Text(pro.bankvalidation.data!.results!.data!.nameAtBank
                                              .toString()),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            "Deposited amount",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 17.5,
                                            ),
                                          ),
                                          Text(pro.bankvalidation.data!.results!.data!.amountDeposited
                                              .toString()),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            "Utr Number",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 17.5,
                                            ),
                                          ),
                                          Text(pro.bankvalidation.data!.results!.data!.utr
                                              .toString()),
                                          const SizedBox(height: 5,),



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
          ),
        ),
        floatingActionButton: context.read<BankApi>().visible == false? const SizedBox() :  FloatingActionButton(onPressed: () async {


          final pdfFile = await generatePDF();
          FileHandleApi.openFile(pdfFile);

        },
          backgroundColor:  const Color.fromARGB(255, 33, 150, 243),
          child: const Icon(Icons.download),
        ),

    );
  }
  Future<File> generatePDF() async {
    final hrpcalcul = Provider.of<BankApi>(context,listen: false);
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  "Account Status",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                  ),
                ),
                pw.Text(hrpcalcul.bankvalidation.data!.results!.data!.message
                    .toString()),
                pw. SizedBox(
                  height: 10,
                ),
                pw. Text(
                  "Account Holder Name",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                  ),
                ),
                pw.Text(hrpcalcul.bankvalidation.data!.results!.data!.nameAtBank
                    .toString()),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Text(
                  "Deposited amount",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                  ),
                ),
                pw.Text(hrpcalcul.bankvalidation.data!.results!.data!.amountDeposited
                    .toString()),
                pw. SizedBox(
                  height: 10,
                ),
                pw. Text(
                  "Utr Number",
                  style: pw.TextStyle(

                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 17.5,
                  ),
                ),
                pw.Text(hrpcalcul.bankvalidation.data!.results!.data!.utr
                    .toString()),
                 pw.SizedBox(
                  height: 10,
                ),



              ]);
        })); //
    // image = (await rootBundle.load("assets/images/itax.png")).buffer.asUint8List();

    return FileHandleApi.saveDocument(name: 'Bank details', pdf: pdf);
  }
}

bool validateBankAccount(String accountNumber) {
  accountNumber = accountNumber.replaceAll(RegExp(r'\s+|-'), '');

  if (accountNumber.length < 6 || accountNumber.length > 20) {
    return false;
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(accountNumber)) {
    return false;
  }

  return true;
}
bool validateIFSCCode(String ifscCode) {

  ifscCode = ifscCode.replaceAll(RegExp(r'\s+|-'), '');
  if (!RegExp(r'^[A-Z]{4}[0-9]{7}$').hasMatch(ifscCode)) {
    return false;
  }

  return true;
}

bool validateName(String name) {

  if (!RegExp(r'^[A-Z][a-zA-Z]*$').hasMatch(name)) {
    return false;
  }

  return true;
}


bool validatePhoneNumber(String phoneNumber) {

  phoneNumber = phoneNumber.replaceAll(RegExp(r'\s+|-'), '');


  if (!RegExp(r'^[0-9]{10}$').hasMatch(phoneNumber)) {
    return false;
  }


  return true;
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
      text: "Bank Verification",
    ),
  );
}

