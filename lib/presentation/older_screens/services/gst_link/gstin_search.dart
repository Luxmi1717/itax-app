import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/presentation/older_widgets/widgets/primary_button.dart';
import 'package:itax/presentation/older_widgets/widgets/text_decoration.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';

import '../../../../providers/providers_old/services_gst_links.dart';




class GstLink extends StatefulWidget {
  const GstLink({super.key});

  @override
  State<GstLink> createState() => _GstLinkState();
}

class _GstLinkState extends State<GstLink> {
  TextEditingController controller=TextEditingController();
  TextEditingController gstin =TextEditingController();
  final bool _ifscValid = true;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:_buildAppBar(context),
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
                  text: 'GSTIN Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                BlueTextField(
                  controller:gstin,
                  initialValue:gstin.text,
                  capitalization: TextCapitalization.characters,
                  hintText: 'Enter GSTIN code',
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<gstinLink>(builder: (BuildContext context, pro, child) {
                  return PrimaryButton(

                    onTap: () {
                      bool isValid = validateGSTIN(gstin.text);
                      {
                        if (isValid) {
                          Map data = {
                            "ifsc":gstin.text,
                          };
                          pro.GstinLinkProv(gstin.text, context);

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
              ],
            ),
          ),
        ),

      );
  }
  bool validateGSTIN(String gstin) {
    final gstinPattern = RegExp(
      r"^\d{2}[A-Z]{5}\d{4}[A-Z]{1}[1-9A-Z]{1}[Z]{1}[A-Z\d]{1}$",
    );

    return gstinPattern.hasMatch(gstin);
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
      text: "Search by gstin",
    ),
  );
}