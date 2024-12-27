import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';

class AddNewBankScreen extends StatelessWidget {
  const AddNewBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController ifscController = TextEditingController();
    final TextEditingController bankNameController = TextEditingController();
    final TextEditingController bankBranchController = TextEditingController();
    final TextEditingController bankAccountController = TextEditingController();
    final TextEditingController confirmBankAccountController =
        TextEditingController();
    final TextEditingController openingBalanceController =
        TextEditingController();
    final TextEditingController upiIdController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        title: Text(
          'Add New Bank',
          style: TextStyle(color: whiteColor, fontSize: 20.sp),
        ),
        leading: const Icon(Icons.arrow_back_ios, color: whiteColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h,),
                  Text(
                    'Bank Details',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomTextInput(
                    controller: ifscController,
                    hintText: 'Enter IFSC',
                    ifPasswordField: false,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter IFSC' : null,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextInput(
                    controller: bankNameController,
                    hintText: 'Enter Bank Name',
                    ifPasswordField: false,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter Bank Name' : null,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextInput(
                    controller: bankBranchController,
                    hintText: 'Enter Bank Branch',
                    ifPasswordField: false,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter Bank Branch' : null,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextInput(
                    controller: bankAccountController,
                    hintText: 'Enter Bank Account',
                    ifPasswordField: false,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter Bank Account' : null,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextInput(
                    controller: confirmBankAccountController,
                    hintText: 'Confirm Bank Account',
                    ifPasswordField: false,
                    validator: (value) => value.isEmpty
                        ? 'Please confirm your Bank Account'
                        : null,
                  ),
                ],
              ),
            ),
            Divider(thickness: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.add_circle_outline, color: blackColor),
                      SizedBox(width: 10.w),
                      Text(
                        'Other Details (Optional)',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomTextInput(
                    controller: openingBalanceController,
                    hintText: 'Enter Opening Balance',
                    ifPasswordField: false,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter Opening Balance' : null,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextInput(
                    controller: upiIdController,
                    hintText: 'Enter UPI ID',
                    ifPasswordField: false,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter UPI ID' : null,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: BlueButton(
                title: 'Save',
                onPressed: () {},
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
