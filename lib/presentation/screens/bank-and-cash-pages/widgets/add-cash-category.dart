import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/presentation/screens/e-way-bill/slider-widgets/login-successful-slider.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';

class AddCashSlider extends StatelessWidget {
  const AddCashSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController balanceController = TextEditingController();
    return SizedBox(
      // height: 200.h,
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Add Cash Category',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20.h),
            CustomTextInput(
                controller: categoryController,
                hintText: 'Category Name',
                ifPasswordField: false,
                validator: (value) =>
                    value.isEmpty ? 'Please enter Category Nam' : null),
            SizedBox(height: 10.h),
            CustomTextInput(
                controller: balanceController,
                hintText: 'Opening Balance(Optional)',
                ifPasswordField: false,
                validator: (value) =>
                    value.isEmpty ? 'Please enter Opening Balance' : null),
            SizedBox(height: 20.h),
            BlueButton(
                title: 'Save',
                onPressed: () {
                 Navigator.pop(context);
                })
          ],
        ),
      )),
    );
  }
}

