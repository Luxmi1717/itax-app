import 'package:flutter/material.dart';
import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/models/logingst_model.dart';
import 'package:itax/presentation/older_screens/gst/return_deshboard.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/providers/providers_old/gst_api.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';


import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';


class GSTLogin extends StatefulWidget {
  const GSTLogin({super.key});

  @override
  State<GSTLogin> createState() => _GSTLoginState();
}

class _GSTLoginState extends State<GSTLogin> with TickerProviderStateMixin {
  late BlinkingAnimation blinkingAnimation;

  late DotAnimation dotAnimation1;
  late DotAnimation dotAnimation2;
  late DotAnimation dotAnimation3;

  bool _fabVisible = false;

  bool _hidePassword = true;
  TextEditingController GstinController = TextEditingController();
  TextEditingController gstUserNameController = TextEditingController();
  TextEditingController userId = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  SharedPreferences? logindata;
  bool? newuser;

  String? username;
  String? Password;

  @override
  void initState() {
    super.initState();
    initial();
    // Simulate a delay and then show the FAB after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _fabVisible = true;
      });
    });

    blinkingAnimation = BlinkingAnimation();
    blinkingAnimation.initAnimation(this);

    dotAnimation1 = DotAnimation(vsync: this);
    dotAnimation2 = DotAnimation(vsync: this);
    dotAnimation3 = DotAnimation(vsync: this);
  }

  Future<void> initial() async {
    logindata = await SharedPreferences.getInstance();

    setState(() {
      username = logindata!.getString('username');
      Password = logindata!.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    userId.value = TextEditingValue(text: username ?? "");
    userPassword.value = TextEditingValue(text: Password ?? "");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  // Consumer<GstSection>(
                  //   builder: (BuildContext context, pro, child) {
                  //     return StyledTextField(
                  //       label: 'GSTN',
                  //       controller: pro
                  //           .passwordController, // Ensure this is a TextEditingController
                  //       hintText: 'Enter GSTN',
                  //       maxLines: 1,
                  //       validator: (value) {
                  //         if (value == null || value.isEmpty) {
                  //           return 'Please enter GSTN.';
                  //         }
                  //         return null;
                  //       },
                  //     );
                  //   },
                  // ),

                  const SizedBox(
                    height: 22,
                  ),

                  // Consumer<GstSection>(
                  //     builder: (BuildContext context, pro, child) {
                  //   return StyledTextField(
                  //     label: 'Gst Portal UserName',
                  //     controller:pro.passwordController,
                  //     hintText: 'Enter Gst Portal  Number',
                  //     maxLines: 1,
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Please Portal Number';
                  //       }
                  //       return null;
                  //     },
                  //   );



                  // }),
                  const SizedBox(
                    height: 22,
                  ),
                  Consumer<GstSection>(
                      builder: (BuildContext context, pro, child) {
                    return NeomorphicButton(
                      onTap: () async {
                        bool isValid = validateGSTIN(pro.emailController.text);
                        {
                          if (isValid) {
                            await UserSecureStorage.saveGSTIN(
                                pro.emailController.text);
                            final insert = LoginGst(
                                gstin: pro.emailController.text,
                                username: pro.passwordController.text);
                            pro.GstOptGenerated(insert, context);
                          } else {
                            Utils.flushbarErrorMessage(
                                'GSTIN code is invalid', context);
                          }
                        }
                      },
                      buttonText: 'Manage API Section',
                    );
                  }),
                  const SizedBox(
                    height: 22,
                  ),

                  // StyledTextField(
                  //   label: 'UserName',
                  //   controller:userId,
                  //   hintText: 'Enter item User Id',
                  //   maxLines: 1,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter User Id';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(
                    height: 22,
                  ),
                   Row(
                    children: [
                      Text("Password",style: CustomTextStyles.labelLargeMedium,),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 2,
                          // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: userPassword,
                      obscureText: _hidePassword,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        contentPadding: const EdgeInsets.all(16),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          icon: _hidePassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                      cursorColor: const Color.fromARGB(255, 33, 150, 243),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  NeomorphicButton(
                    onTap: () async {
                      String username = userId.text;
                      String password = userPassword.text;
                      if (userId != '') {
                        print('SuccessFull');
                        logindata?.setBool('login', false);

                        logindata!.setString('username', username);
                        logindata!.setString('password', password);
                      }
                      launchUrlString('https://services.gst.gov.in/services/login');
                    },
                    buttonText: 'Manage API Section',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 80,
                      height: 50,
                      child: NeomorphicButton(
                        btnFontSize: 16,
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ReturnDeshboard()));
                        },
                        buttonText: 'Skip',
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dipose() {
    userId.dispose();
    userPassword.dispose();

    super.dispose();
  }
}

class StyledTextField {
}



class _CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Adjust the X and Y offsets to customize the FAB location
    final double x = scaffoldGeometry.scaffoldSize.width - 150;
    final double y = scaffoldGeometry.scaffoldSize.height - 100;
    return Offset(x, y);
  }
}

class BlinkingAnimation {
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  int numBlinks = 20; // Number of times to blink
  int blinkCount = 0; // Count of blinks

  void initAnimation(TickerProvider vsync) {
    _colorController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 1),
    );

    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.grey)
        .animate(_colorController);

    _colorController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _colorController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (blinkCount < numBlinks - 1) {
          _colorController.forward();
          blinkCount++;
        }
      }
    });

    _colorController.forward();
  }

  void dispose() {
    _colorController.dispose();
  }

  Animation<Color?> get colorAnimation => _colorAnimation;
}

class DotAnimation {
  final AnimationController controller;

  DotAnimation({required TickerProvider vsync})
      : controller = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 500),
        )..repeat(reverse: true);

  void dispose() {
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          transform: Matrix4.translationValues(
            20 * controller.value, // Horizontal offset based on animation value
            0,
            0,
          ),
        );
      },
    );
  }
}

bool validateGSTIN(String gstin) {
  final gstinPattern = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{2}$',);

  return gstinPattern.hasMatch(gstin);
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
      text: "Login with GSTIN",
    ),


  );
}

