import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';
import 'package:itax/utility/functions.dart';

class AddNewCompanyScreen extends StatefulWidget {
  const AddNewCompanyScreen({super.key});

  @override
  State<AddNewCompanyScreen> createState() => _AddPartiesPageState();
}

class _AddPartiesPageState extends State<AddNewCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _businessNameController =
        TextEditingController();
    final TextEditingController _gstNumberController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _panController = TextEditingController();
    final TextEditingController _aadhaarController = TextEditingController();

    String _selectedRole = 'Inventory';

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        title: Text(
          'Add New Company',
          style: TextStyle(color: whiteColor, fontSize: 20.sp),
        ),
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: const Icon(Icons.arrow_back_ios, color: whiteColor),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              openBottomSheet(context, ImportBottomSlider());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/itax-icons/accounts-icons/import.svg',
                    height: 18.h,
                    width: 18.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Import',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shadowColor: Colors.grey[400],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
          child: BlueButton(
            title: 'Save',
            onPressed: () {},
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Details',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: blackColor),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextInput(
                    controller: _businessNameController,
                    hintText: 'Business Name',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_businessNameController.text.isEmpty) {
                        return 'Please enter business name';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextInput(
                    controller: _gstNumberController,
                    hintText: 'GST Number',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_gstNumberController.text.isEmpty) {
                        return 'Please enter Gst number';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextInput(
                    controller: _phoneController,
                    hintText: 'Mobile Number',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_phoneController.text.isEmpty) {
                        return 'Please enter mobile number';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextInput(
                    controller: _emailController,
                    hintText: 'Email',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_emailController.text.isEmpty) {
                        return 'Please enter Email';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextInput(
                    controller: _panController,
                    hintText: 'PAN Number',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_panController.text.isEmpty) {
                        return 'Please enter Pan Number';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextInput(
                    controller: _aadhaarController,
                    hintText: 'Aadhaar Number',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_aadhaarController.text.isEmpty) {
                        return 'Please enter Aadhaar Number';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 12.h),
                  Text('Who are they?',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: blackColor)),
                  SizedBox(height: 10.h),
                  ListTile(
                    title: Text(
                      'Inventory',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    leading: Radio(
                      value: 'Inventory',
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value.toString();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Non-Inventory',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    leading: Radio(
                      value: 'Non-Inventory',
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 7.h,
              color: Colors.grey[200],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 20.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/itax-icons/accounts-icons/add.svg',
                    height: 30.h,
                    width: 30.w,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Business Info(Optional)',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 7.h,
              color: Colors.grey[200],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 20.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/itax-icons/accounts-icons/add.svg',
                    height: 30.h,
                    width: 30.w,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Billing Address(Optional)',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImportBottomSlider extends StatelessWidget {
  const ImportBottomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Import from Excel',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            leading: SvgPicture.asset(
              'assets/itax-icons/accounts-icons/excel.svg',
              height: 30.h,
              width: 30.w,
            ),
          ),
          ListTile(
            title: Text(
              'Import from Tally',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            leading: SvgPicture.asset(
              'assets/itax-icons/accounts-icons/tally.svg',
              height: 30.h,
              width: 30.w,
            ),
          ),
          ListTile(
            title: Text(
              'Import from Quickbooks',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            leading: SvgPicture.asset(
              'assets/itax-icons/accounts-icons/quickbooks.svg',
              height: 30.h,
              width: 30.w,
            ),
          ),
        ],
      ),
    );
  }
}
