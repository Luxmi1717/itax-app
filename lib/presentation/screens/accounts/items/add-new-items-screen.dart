import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';
import 'package:itax/utility/functions.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({super.key});

  @override
  State<AddNewItemScreen> createState() => _AddPartiesPageState();
}

class _AddPartiesPageState extends State<AddNewItemScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _itemNameController =
        TextEditingController();
    final TextEditingController _hsnSacCodeController = TextEditingController();
    final TextEditingController _itemUnitController = TextEditingController();
    final TextEditingController _salePriceController = TextEditingController();
    final TextEditingController _purchasePriceController = TextEditingController();
    final TextEditingController _taxRateController = TextEditingController();

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
          'Add New Item',
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
                    'Item Details',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: blackColor),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextInput(
                    controller: _itemNameController,
                    hintText: 'Item Name',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_itemNameController.text.isEmpty) {
                        return 'Please enter item name';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextInput(
                    controller: _hsnSacCodeController,
                    hintText: 'GST Number',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_hsnSacCodeController.text.isEmpty) {
                        return 'Please enter hsn / sac number';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextInput(
                    controller: _itemUnitController,
                    hintText: 'Mobile Number',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_itemUnitController.text.isEmpty) {
                        return 'Please enter item unit number';
                      }
                      return '';
                    },
                  ),
                 
                  SizedBox(height: 16.h),
                  Text('Item Type',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: blackColor)),
                  SizedBox(height: 10.h),
                  ListTile(
                    title: Text(
                      'Item',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    leading: Radio(
                      value: 'Item',
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
                      'Service',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    leading: Radio(
                      value: 'Service',
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value.toString();
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 16.h),
                  Divider(
                    thickness: 7.h,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: 16.h),
                   Text(
                    'Pricing',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: blackColor),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextInput(
                    controller: _salePriceController,
                    hintText: 'Sale Price',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_salePriceController.text.isEmpty) {
                        return 'Please enter Sale Price';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextInput(
                    controller: _purchasePriceController,
                    hintText: 'Purchase Price',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_purchasePriceController.text.isEmpty) {
                        return 'Please enter Purchase Price';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextInput(
                    controller: _taxRateController,
                    hintText: 'Tax Rate%',
                    ifPasswordField: false,
                    validator: (value) {
                      if (_taxRateController.text.isEmpty) {
                        return 'Please enter Tax Rate';
                      }
                      return '';
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
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
                    'Other Info(Optional)',
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
