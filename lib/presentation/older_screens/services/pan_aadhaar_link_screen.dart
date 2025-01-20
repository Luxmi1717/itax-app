import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/cubits/pan_aadhaar_cubit.dart';
import 'package:itax/cubits/pan_aadhaar_state.dart';
import 'package:itax/presentation/screens/itr-section/widgets/form-widgets.dart';
import 'package:itaxeasy/utility/size_utils.dart';
import 'package:itaxeasy/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itaxeasy/widgets/form_widgets.dart';

import '../../config/image_constant.dart';
import '../../cubits/pan_aadhaar_cubit.dart';
import '../../cubits/pan_aadhaar_state.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class PanAadhaarLinkScreen extends StatefulWidget {
  const PanAadhaarLinkScreen({super.key});

  @override
  State<PanAadhaarLinkScreen> createState() => _PanAadhaarLinkScreenState();
}

class _PanAadhaarLinkScreenState extends State<PanAadhaarLinkScreen> {
  final TextEditingController panController = TextEditingController();
  final TextEditingController aadhaarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: BlocListener<PanAadhaarStatusCubit, PanAadhaarStatusState>(
              listener: (context, state) {
                if (state is PanAadhaarStatusSuccess) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Success'),
                      content: Text(jsonDecode(state.result)['data']['message']),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                } else if (state is PanAadhaarStatusError) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Error'),
                      content: Text(state.error),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    BlueTextField(
                      controller: panController,
                      hintText: 'PAN No',
                    ),
                    const SizedBox(height: 16),
                    BlueTextField(
                      controller: aadhaarController,
                      hintText: 'Aadhaar No',
                    ),
                    const SizedBox(height: 16),
                    NeomorphicButton(
                      onTap: () {
                        context.read<PanAadhaarStatusCubit>().checkPanAadhaarStatus(
                          panController.text,
                          aadhaarController.text,
                            );
                      },
                      buttonText: 'Check Status',
                    ),
                  ],
                ),
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
      text: "PAN Search",
    ),
  );
}