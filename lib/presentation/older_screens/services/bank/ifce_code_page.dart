import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/presentation/older_widgets/widgets/primary_button.dart';
import 'package:itax/presentation/older_widgets/widgets/text_decoration.dart';
import 'package:itax/providers/providers_old/bank_api.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';


class IFCSCode extends StatefulWidget {
  const IFCSCode({super.key});

  @override
  State<IFCSCode> createState() => _IFCSCodeState();
}

class _IFCSCodeState extends State<IFCSCode> {
  TextEditingController controller=TextEditingController();
  TextEditingController ifsc =TextEditingController();
  final bool _ifscValid = true;
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(
                  height: 20,
                ),

                 const textdecoration(
                  text: 'IFSC Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                BlueTextField(
                  controller:ifsc,
                  initialValue:ifsc.text,
                  capitalization: TextCapitalization.characters,
                  hintText: 'Enter IFSC code',
                ),
                const SizedBox(
                  height: 15,
                ),
            Consumer<BankApi>(builder: (BuildContext context, pro, child) {
              return PrimaryButton(

                onTap: () {
                  bool isValid = isValidIFSC(ifsc.text);
                  {
                    if (isValid) {
                      Map data = {
                        "ifsc":ifsc.text,
                      };
                      pro.IFCSValidationProvider(data, context);

                    } else {
                      Utils.flushbarErrorMessage('IFSC code is invalid', context);
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
              ],
            ),
          ),
        ),

    );
  }
  bool isValidIFSC(String ifscCode) {
    if (ifscCode.isEmpty) {
      return false;
    }

    // Ensure that the IFSC code is 11 characters long
    if (ifscCode.length != 11) {
      return false;
    }

    // Ensure that the first four characters are alphabets
    String firstFourChars = ifscCode.substring(0, 4);
    RegExp alphabetsRegex = RegExp(r'[a-zA-Z]+');
    if (!alphabetsRegex.hasMatch(firstFourChars)) {
      return false;
    }

    // Ensure that the fifth character is a zero
    if (ifscCode[4] != '0') {
      return false;
    }

    // Ensure that the remaining six characters are alphanumeric
    String remainingChars = ifscCode.substring(5);
    RegExp alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!alphanumericRegex.hasMatch(remainingChars)) {
      return false;
    }

    return true;
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
      text: "Ifsc Code Finder",
    ),
  );
}



