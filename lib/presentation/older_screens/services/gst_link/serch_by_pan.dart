import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/primary_button.dart';
import 'package:itax/presentation/older_widgets/widgets/text_decoration.dart';
import 'package:itax/providers/providers_old/services_gst_links.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';

import '../../../older_widgets/widgets/form_widgets.dart';





class PanSearchPage extends StatefulWidget {
  const PanSearchPage({super.key});

  @override
  State<PanSearchPage> createState() => _PanSearchPageState();
}

class _PanSearchPageState extends State<PanSearchPage> {
  TextEditingController controller=TextEditingController();
  TextEditingController pan =TextEditingController();
  TextEditingController gstcode=TextEditingController();
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
                  text: 'Pan Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                BlueTextField(
                  controller:pan,
                  initialValue:pan.text,
                  capitalization: TextCapitalization.characters,



                  hintText: 'Enter Pan code',
                ),
                const SizedBox(
                  height: 15,
                ),
                const textdecoration(
                  text: 'gst_state_code',
                ),
                const SizedBox(
                  height: 15,
                ),
                BlueTextField(
                  controller:gstcode,
                  initialValue:gstcode.text,
                  keyboardType: TextInputType.number,
                  hintText: 'Enter gst_state_code code',
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<PanSearch>(builder: (BuildContext context, pro, child) {
                  return PrimaryButton(

                    onTap: () {
                      bool isValid = validateGSTIN(pan.text);
                      {
                        if (isValid) {

                          pro.PanSearchProv(pan.text,gstcode.text, context);

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
    final gstinPattern = RegExp(r"^[A-Z]{5}[0-9]{4}[A-Z]{1}$",);

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
        text: "Search by Pan",
      ),
    );
  }
}