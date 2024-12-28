import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';
import 'package:itax/repositories/auth_repository.dart';
import 'package:provider/provider.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController phoneController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
           Text(
            'Change Email',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text('Enter your Email'),
          SizedBox(
            height: 15.h,
          ),
          CustomTextInput(
            controller: phoneController,
            hintText: "Email",
            ifPasswordField: false,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 28.h),
          BlueButton(
            title: 'Save',
            onPressed: () {
              Navigator.pop(context);
              authProvider.generateForgotPasswordOTP(phoneController.text);
            },
          ),
        ],
      ),
    );
  }
}

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Change Password',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            const Text('Enter your new password'),
            SizedBox(
              height: 15.h,
            ),
            CustomTextInput(
              controller: passwordController,
              hintText: "New Password",
              ifPasswordField: false,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextInput(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              ifPasswordField: true,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 28.h),
            BlueButton(
              title: 'Save',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeMobileNo extends StatelessWidget {
  const ChangeMobileNo({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController mobileController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Change Mobile Number',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text('Enter your Mobile Number'),
          SizedBox(
            height: 28.h,
          ),
          CustomTextInput(
            controller: mobileController,
            hintText: "Mobile Number",
            ifPasswordField: true,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 28.h),
          BlueButton(
            title: 'Save',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController mobileController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Change Name',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text('Enter your Name'),
          SizedBox(
            height: 28.h,
          ),
          CustomTextInput(
            controller: mobileController,
            hintText: "Name",
            ifPasswordField: true,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 28.h),
          BlueButton(
            title: 'Save',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class AddPANNumber extends StatelessWidget {
  const AddPANNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController mobileController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add PAN Number',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text('Enter your PAN Number'),
          SizedBox(
            height: 28.h,
          ),
          CustomTextInput(
            controller: mobileController,
            hintText: "PAN Number",
            ifPasswordField: true,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 28.h),
          BlueButton(
            title: 'Save',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class AddGSTNumber extends StatelessWidget {
  const AddGSTNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController mobileController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add GST Number',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text('Enter your GST Number'),
          SizedBox(
            height: 28.h,
          ),
          CustomTextInput(
            controller: mobileController,
            hintText: "GST Number",
            ifPasswordField: true,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 28.h),
          BlueButton(
            title: 'Save',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class AddAadharNumber extends StatelessWidget {
  const AddAadharNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController mobileController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Aadhar Number',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text(' Enter your Aadhar Number'),
          SizedBox(
            height: 28.h,
          ),
          CustomTextInput(
            controller: mobileController,
            hintText: "Aadhar Number",
            ifPasswordField: true,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 28.h),
          BlueButton(
            title: 'Save',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class AddBusinessName extends StatelessWidget {
  const AddBusinessName({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController mobileController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Business Name',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text('Enter your Business Name'),
          SizedBox(
            height: 28.h,
          ),
          CustomTextInput(
            controller: mobileController,
            hintText: "Business Name",
            ifPasswordField: true,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 28.h),
          BlueButton(
            title: 'Save',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class AddBankDetails extends StatelessWidget {
  const AddBankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController IFSCController = TextEditingController();
    final TextEditingController BankNameController = TextEditingController();

    final TextEditingController BranchNameController = TextEditingController();

    final TextEditingController AccNumberController = TextEditingController();

    final TextEditingController confirmAccNumberController = TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ' Bank Details',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            CustomTextInput(
              controller: IFSCController,
              hintText: "Enter IFSC",
              ifPasswordField: true,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 28.h),
            CustomTextInput(
              controller: BankNameController,
              hintText: "Bank Name",
              ifPasswordField: true,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 28.h),
            CustomTextInput(
              controller: BranchNameController,
              hintText: "Pincode",
              ifPasswordField: true,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 28.h),
            CustomTextInput(
              controller: AccNumberController,
              hintText: "Bank account Number",
              ifPasswordField: true,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 28.h),
            CustomTextInput(
              controller: confirmAccNumberController,
              hintText: "Confirm Bank account Number",
              ifPasswordField: true,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 28.h),
            BlueButton(
              title: 'Save',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}



class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController BusinessAddressController = TextEditingController();
    final TextEditingController StateController = TextEditingController();

    final TextEditingController PincodeController = TextEditingController();


    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 7.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ' Add Address',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            CustomTextInput(
              controller: BusinessAddressController,
              hintText: "Business Address",
              ifPasswordField: true,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 28.h),
            CustomTextInput(
              controller: StateController,
              hintText: "State",
              ifPasswordField: true,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 28.h),
            CustomTextInput(
              controller: PincodeController,
              hintText: "Bank Branch Name",
              ifPasswordField: true,
              validator: (value) {
                return null;
              },
            ),
           
            SizedBox(height: 28.h),
            BlueButton(
              title: 'Save',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
