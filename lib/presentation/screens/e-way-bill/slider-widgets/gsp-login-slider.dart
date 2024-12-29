import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/presentation/screens/e-way-bill/slider-widgets/login-successful-slider.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';

class GspLoginSlider extends StatelessWidget {
  const GspLoginSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
                Text('Add User',
                    style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20.h),
            CustomTextInput(
                controller: userNameController,
                hintText: 'GSP Username',
                ifPasswordField: false,
                validator: (value) =>
                    value.isEmpty ? 'Please enter User Name' : null),
            SizedBox(height: 10.h),
            CustomTextInput(
                controller: passwordController,
                hintText: 'GSP Password',
                ifPasswordField: true,
                validator: (value) =>
                    value.isEmpty ? 'Please enter Mobile Number' : null),
            SizedBox(height: 20.h),
           
            BlueButton(title: 'Login Gsp', onPressed: () {
              openBottomSheet(context, LoginSuccessSlider());
            })
          ],
        ),
      )),
    );
  }
}
void openBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        child: content,
      );
    },
  );
}
