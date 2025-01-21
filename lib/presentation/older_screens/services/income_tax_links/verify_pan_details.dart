
import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/presentation/older_widgets/widgets/primary_button.dart';
import 'package:itax/presentation/older_widgets/widgets/text_decoration.dart';
import 'package:itax/providers/providers_old/services_incometax_links.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';



class PanVerifyDetails extends StatefulWidget {
  const PanVerifyDetails({super.key});

  @override
  State<PanVerifyDetails> createState() => _PanVerifyDetailsState();
}

class _PanVerifyDetailsState extends State<PanVerifyDetails> {
  TextEditingController controller=TextEditingController();
  TextEditingController Pan =TextEditingController();
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
                  text: 'PAN Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                BlueTextField(
                  controller:Pan,
                  initialValue:Pan.text,
                  capitalization: TextCapitalization.characters,



                  hintText: 'Enter Pan Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<PanVerify>(builder: (BuildContext context, pro, child) {
                  return PrimaryButton(

                    onTap: () {
                      bool isValid = validateGSTIN(Pan.text);
                      {
                        if (isValid) {

                          pro.PanVerifyProv(Pan.text, context);

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
                Consumer<PanVerify>(builder: (BuildContext context, result, child) {
                  return Visibility(
                    visible: result.visible,
                    child: SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(height: 20,),
                                          const Text(

                                            "Pan-",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),


                                          Text(result.PanVerifyDetails.data!.data.pan.toString() ,style: const TextStyle(



                                            fontSize: 10,
                                          )),
                                          const SizedBox(height: 40,),

                                        ]),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(height: 20,),
                                          const Text(

                                            "Last Name:-",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),


                                          Text(result.PanVerifyDetails.data!.data.lastName.toString() ,style: const TextStyle(



                                            fontSize: 10,
                                          )),
                                          const SizedBox(height: 40,),

                                        ]),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(height: 20,),
                                          const Text(

                                            "monthlyIncome:-",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),


                                          Text(result.PanVerifyDetails.data!.data.pan.toString() ,style: const TextStyle(



                                            fontSize: 10,
                                          )),
                                          const SizedBox(height: 40,),

                                        ]),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(height: 20,),
                                          const Text(

                                            "Full Name:-",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),


                                          Text(result.PanVerifyDetails.data!.data.fullName.toString() ,style: const TextStyle(



                                            fontSize: 10,
                                          )),
                                          const SizedBox(height: 40,),

                                        ]),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(height: 20,),
                                          const Text(

                                            "Status:-",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),


                                          Text(result.PanVerifyDetails.data!.data.status.toString() ,style: const TextStyle(



                                            fontSize: 10,
                                          )),
                                          const SizedBox(height: 40,),

                                        ]),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(height: 20,),
                                          const Text(

                                            "Adhaar Status:-",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),


                                          Text(result.PanVerifyDetails.data!.data.aadhaarSeedingStatus.toString() ,style: const TextStyle(



                                            fontSize: 10,
                                          )),
                                          const SizedBox(height: 40,),

                                        ]),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(height: 20,),
                                          const Text(

                                            "Catagory:-",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),


                                          Text(result.PanVerifyDetails.data!.data.category.toString() ,style: const TextStyle(



                                            fontSize: 10,
                                          )),
                                          const SizedBox(height: 40,),

                                        ]),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(height: 20,),
                                          const Text(

                                            "Last Update:-",
                                            style: TextStyle(
                                              // fontFamily: "Poppins",
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),


                                          Text(result.PanVerifyDetails.data!.data.lastUpdated.toString() ,style: const TextStyle(



                                            fontSize: 10,
                                          )),
                                          const SizedBox(height: 40,),

                                        ]),

                                  ],
                                ),
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

      );
  }
  bool validateGSTIN(String gstin) {
    final gstinPattern = RegExp(
      r"^[A-Z]{5}[0-9]{4}[A-Z]{1}$",
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
      text: "Pan Details",
    ),
  );
}