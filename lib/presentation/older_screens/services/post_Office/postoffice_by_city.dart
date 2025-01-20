import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/text-decoration-widget.dart';
import 'package:itax/providers/services-old/services_post_office_link.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:itaxeasy/providers/services_post_office_link.dart';
import 'package:itaxeasy/utility/size_utils.dart';

import 'package:provider/provider.dart';

import '../../../config/image_constant.dart';
import '../../../data/utils/utils.dart';
import '../../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/form_widgets.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/text_decoration.dart';

class PostofficebyCiyPage extends StatefulWidget {
  const PostofficebyCiyPage({super.key});

  @override
  State<PostofficebyCiyPage> createState() => _PostofficebyCiyPageState();
}

class _PostofficebyCiyPageState extends State<PostofficebyCiyPage> {
  TextEditingController controller=TextEditingController();
  TextEditingController PinCode =TextEditingController();
  final bool _ifscValid = true;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(
                  height: 20,
                ),

                const textdecoration(
                  text: 'PinCode',
                ),
                const SizedBox(
                  height: 15,
                ),
                BlueTextField(
                  controller:PinCode,
                  initialValue:PinCode.text,
                  capitalization: TextCapitalization.characters,



                  hintText: 'Enter PinCode Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<PostOfficebyCity>(builder: (BuildContext context, pro, child) {
                  return PrimaryButton(

                    onTap: () {
                      bool isValid = validateGSTIN(PinCode.text);
                      {
                        if (isValid) {

                          pro.PostOfficebyCityProv(PinCode.text, context);

                        } else {
                          Utils.flushbarErrorMessage('Pin code is invalid', context);
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

                Consumer<PostOfficebyCity>(builder: (BuildContext context, result, child) {

                  return Visibility(
                    visible: result.visible,
                    child: SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Card(
                                child: Column(children: [
                                  DataTable(
                                      columnSpacing: 8,
                                      columns: const [
                                        DataColumn(
                                            label: Text('Name',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold))),
                                        DataColumn(
                                            label: Text('District',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold))),
                                        DataColumn(
                                            label: Text('taluk',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold))),
                                        DataColumn(
                                            label: Text('StateName',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold))),
                                        DataColumn(
                                            label: Text('Country',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold))),
                                      ],
                                      rows: result.PostOfficebyCityDetails.data!.data.postOffice.map((e) {
                                        return DataRow(cells: [
                                          DataCell(Text(e.name.toString())),
                                          DataCell(Text(e.district.toString())),
                                          DataCell(Text(e.taluk.toString())),
                                          DataCell(Text(e.state.toString())),
                                          DataCell(Text(e.country.toString())),
                                        ]);
                                      }).toList()),
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

      );
  }
  bool validateGSTIN(String gstin) {
    final gstinPattern = RegExp(
      r"^^\d{6}$",
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
      text: "Post Office by City details",
    ),
  );
}