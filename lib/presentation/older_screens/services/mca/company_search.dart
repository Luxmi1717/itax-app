import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/text-decoration-widget.dart';
import 'package:itax/providers/services-old/mca_api.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:itaxeasy/utility/size_utils.dart';
import 'package:provider/provider.dart';

import '../../../config/image_constant.dart';
import '../../../providers/mca_api.dart';
import '../../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/form_widgets.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/text_decoration.dart';



class CompanySearch extends StatefulWidget {

  const CompanySearch({super.key});

  @override
  State<CompanySearch> createState() => _CompanySearchState();
}

TextEditingController companyId =TextEditingController();

TextEditingController dinNo =TextEditingController();

class _CompanySearchState extends State<CompanySearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 15,
                  ),
                   const textdecoration(
                    text: 'Company ID',
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  BlueTextField(
                    controller:companyId,
                    initialValue:companyId.text,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }

                      return 'Please Enter  Company ID';
                    },



                    hintText: 'Enter Company ID',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
    Consumer<mca>(builder: (BuildContext context, pro, child) {
      return PrimaryButton(
        onTap: () {
          Map data = {
            "id": companyId.text,
          };
          pro.CompanyDetailProv(companyId.text, context);
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
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: textdecoration(
                      text: 'OR',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // const textdecoration(
                  //   text: 'Company Director Details',
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  const textdecoration(
                    text: 'Din No.',
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  BlueTextField(
                    controller:dinNo,
                    initialValue:dinNo.text,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }

                      return 'Please Enter  dinNo';
                    },

                    hintText: 'Enter Din NO.',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<mca>(builder: (BuildContext context, pro, child) {
                    return PrimaryButton(
                      onTap: () {
                        Map data = {
                          "id": dinNo.text,
                        };
                        pro.directorDetailProv(data, context);
                      },
                      child:Center(
                          child: !pro.loading1
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
      text: "Company Search",
    ),
  );
}