import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';

class AddUserSlider extends StatefulWidget {
  const AddUserSlider({super.key});

  @override
  State<AddUserSlider> createState() => _AddUserSliderState();
}

class _AddUserSliderState extends State<AddUserSlider> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isOnlyView = false;
  bool isAllEditPermission = false;

  void _toggleCheckbox(String type) {
    setState(() {
      if (type == 'view') {
        isOnlyView = !isOnlyView;
      } else if (type == 'edit') {
        isAllEditPermission = !isAllEditPermission;
      }
    });
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Save logic or API call
      debugPrint('Name: ${nameController.text}');
      debugPrint('Mobile Number: ${mobileController.text}');
      debugPrint('Only View: $isOnlyView');
      debugPrint('All Edit Permission: $isAllEditPermission');
    } else {
      debugPrint('Form is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Add User',
                      style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextInput(
                  controller: nameController,
                  hintText: 'Full Name',
                  ifPasswordField: false,
                  validator: (value) =>
                      value.isEmpty ? 'Please enter Full Name' : null,
                ),
                SizedBox(height: 10.h),
                CustomTextInput(
                  controller: mobileController,
                  hintText: 'Mobile Number',
                  ifPasswordField: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Mobile Number';
                    }
                    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                      return 'Enter a valid 10-digit Mobile Number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isOnlyView,
                          onChanged: (bool? value) => _toggleCheckbox('view'),
                        ),
                        Text('Only View'),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isAllEditPermission,
                          onChanged: (bool? value) => _toggleCheckbox('edit'),
                        ),
                        Text('All Edit Permission'),
                      ],
                    ),
                  ],
                ),
                BlueButton(
                  title: 'Save',
                  onPressed: _saveForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
