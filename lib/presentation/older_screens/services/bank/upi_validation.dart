
import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/presentation/older_widgets/widgets/primary_button.dart';
import 'package:itax/presentation/older_widgets/widgets/text_decoration.dart';
import 'package:itax/providers/providers_old/bank_api.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:provider/provider.dart';



class UPIValidation extends StatefulWidget {
  const UPIValidation({super.key});

  @override
  State<UPIValidation> createState() => _UPIValidationState();
}

class _UPIValidationState extends State<UPIValidation> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController UpiAddress=TextEditingController();
  TextEditingController Name=TextEditingController();
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
            child:Form(
              key:_formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 20,
                  ),
                  const textdecoration(
                    text: ' UPI Address',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlueTextField(
                    controller:UpiAddress,
                    initialValue:UpiAddress.text,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }

                      return 'Please Enter  UPI Address';
                    },



                    hintText: 'Enter UPI Address',
                  ),
                  const SizedBox(height: 15,),
                  const textdecoration(text: 'Name',),
                  const SizedBox(height: 15,),
                  BlueTextField(
                    controller:Name,
                    initialValue:Name.text,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }

                      return 'Please Enter Full Name';
                    },



                    hintText: 'Enter Name',
                  ),

                  const SizedBox(height: 15,),

                  Consumer<BankApi>(builder: (BuildContext context, pro, child) {
                    return PrimaryButton(

                      onTap: () {

                         if (_formKey.currentState!.validate()) {
                                Map data = {
                                     "virtual_payment_address": UpiAddress.text,
                                      "name": Name.text
                                      };
                                pro.UPIValidationProvider(data, context);
                              }
                      },
                      child: Center(
                          child: !pro.loading2 ?const Text('Search', style: TextStyle(color: Colors.white,fontSize: 15),
                          ):  const SizedBox(height: 15, width: 15, child: CircularProgressIndicator(color: Colors.white,),)),
                    );
                  }),
                  const SizedBox(height: 15,),
                  Consumer<BankApi>(builder: (BuildContext context, pro, child) {
                    return Visibility(
                      visible: pro.visible1,
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
                                          "Account Exists",
                                          style: TextStyle(
                                            // fontFamily: "Poppins",
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5, fontSize: 17.5,),),
                                        Text(pro.UPIvalidation.data!.data.accountExists.toString()),

                                        const SizedBox(height: 5,),

                                        const Text("Name of bank holder", style: TextStyle(
                                          // fontFamily: "Poppins",
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5, fontSize: 17.5,),),

                                        Text(pro.UPIvalidation.data!.data.nameAtBank.toString()),

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
    );
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
      text: "UPI Validation",
    ),
  );
}