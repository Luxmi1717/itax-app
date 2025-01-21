import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/primary_button.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/text-decoration-widget.dart';
import 'package:itax/providers/services-old/services_incometax_links.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:provider/provider.dart';



class SearchTanPage extends StatefulWidget {
  const SearchTanPage({super.key});

  @override
  State<SearchTanPage> createState() => _SearchTanPageState();
}

class _SearchTanPageState extends State<SearchTanPage> {
  TextEditingController controller=TextEditingController();
  TextEditingController Tan =TextEditingController();
  final bool _ifscValid = true;

 bool isVisibleValue = false;
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () async{
          context.read<SearchTan>().setVisible(false);
          return true;
        },
        child: Scaffold(
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
                    text: 'Tan Number',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlueTextField(
                    controller:Tan,
                    initialValue:Tan.text,
                    capitalization: TextCapitalization.characters,
                    hintText: 'Enter Pan Number',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Consumer<SearchTan>(builder: (BuildContext context, pro, child) {

                    return PrimaryButton(

                      onTap: () {
                        bool isValid = validateGSTIN(Tan.text);
                        {
                          if (isValid) {

                            pro.PanSearchProv(Tan.text, context);

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
                   Consumer<SearchTan>(builder: (BuildContext context, result, child) {
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

                                              "Name -",
                                              style: TextStyle(
                                                // fontFamily: "Poppins",
                                                // fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(height: 4,),


                                            Text(result.TanSearchDetails.data!.data.nameOrgn.toString() ,style: const TextStyle(



                                              fontSize: 10,
                                            )),
                                            const SizedBox(height: 40,),

                                          ]),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(height: 20,),
                                            const Text(

                                              "Address:-",
                                              style: TextStyle(
                                                // fontFamily: "Poppins",
                                                // fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(height: 4,),


                                            Text(result.TanSearchDetails.data!.data.addLine1.toString() +result.TanSearchDetails.data!.data.addLine2.toString()+result.TanSearchDetails.data!.data.addLine3.toString()+result.TanSearchDetails.data!.data.addLine5.toString(),style: const TextStyle(



                                              fontSize: 10,
                                            )),
                                            const SizedBox(height: 40,),

                                          ]),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(height: 20,),
                                            const Text(

                                              "Pin:-",
                                              style: TextStyle(
                                                // fontFamily: "Poppins",
                                                // fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(height: 4,),


                                            Text(result.TanSearchDetails.data!.data.pin.toString() ,style: const TextStyle(



                                              fontSize: 10,
                                            )),
                                            const SizedBox(height: 40,),

                                          ]),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(height: 20,),
                                            const Text(

                                              "Phone Number :-",
                                              style: TextStyle(
                                                // fontFamily: "Poppins",
                                                // fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(height: 4,),


                                            Text(result.TanSearchDetails.data!.data.phoneNum.toString() ,style: const TextStyle(



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


                                            Text(result.TanSearchDetails.data!.data.emailId1.toString() ,style: const TextStyle(



                                              fontSize: 10,
                                            )),
                                            const SizedBox(height: 40,),

                                          ]),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(height: 20,),
                                            const Text(

                                              "State code:-",
                                              style: TextStyle(
                                                // fontFamily: "Poppins",
                                                // fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(height: 4,),


                                            Text(result.TanSearchDetails.data!.data.stateCd.toString() ,style: const TextStyle(



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

        ),
      );
  }
  bool validateGSTIN(String gstin) {
    final gstinPattern = RegExp(
      r"^^[A-Z]{4}\d{5}[A-Z]{1}$",
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
      text: "Tan details",
    ),
  );
}