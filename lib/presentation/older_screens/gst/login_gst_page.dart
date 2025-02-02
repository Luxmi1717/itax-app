import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/config_old/image_constant.dart';
// import 'package:itax/config_old/theme/custom_text_style.dart';
import 'package:itax/models/logingst_model.dart';
import 'package:itax/presentation/older_screens/gst/return_deshboard.dart';
import 'package:itax/presentation/older_screens/services/gst_link/track_gst_return.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/providers/providers_old/gst_api.dart';
import 'package:itax/providers/services-old/utils/utils.dart';

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
  String? password;

  @override
  void initState() {
    super.initState();
    initial();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _fabVisible = true;
      });
    });

    blinkingAnimation = BlinkingAnimation(this);
    dotAnimation1 = DotAnimation(vsync: this);
    dotAnimation2 = DotAnimation(vsync: this);
    dotAnimation3 = DotAnimation(vsync: this);
  }

  Future<void> initial() async {
    logindata = await SharedPreferences.getInstance();

    setState(() {
      username = logindata!.getString('username');
      password = logindata!.getString('password');
    });

    userId.text = username ?? "";
    userPassword.text = password ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.h),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height: 22),
                  Consumer<GstSection>(builder: (context, pro, child) {
                    return NeomorphicButton(
                      onTap: () async {
                        bool isValid = validateGSTIN(pro.emailController.text);
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
                      },
                      buttonText: 'Manage API Section',
                    );
                  }),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Text("Password",
                          style: TextStyle(fontSize: 16) 
                          ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 2,
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
                  const SizedBox(height: 22),
                  NeomorphicButton(
                    onTap: () async {
                      String username = userId.text;
                      String password = userPassword.text;
                      if (username.isNotEmpty) {
                        print('Successful');
                        logindata?.setBool('login', false);
                        logindata?.setString('username', username);
                        logindata?.setString('password', password);
                      }
                      launchUrlString(
                          'https://services.gst.gov.in/services/login');
                    },
                    buttonText: 'Login',
                  ),
                  const SizedBox(height: 30),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReturnDeshboard()));
                      },
                      buttonText: 'Skip',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BlinkingAnimation {
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;
  int numBlinks = 20;
  int blinkCount = 0;

  BlinkingAnimation(TickerProvider vsync) {
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
}

bool validateGSTIN(String gstin) {
  final gstinPattern = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{2}$');
  return gstinPattern.hasMatch(gstin);
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 38,
    leading: AppbarLeadingIconbutton(
      onTap: () => Navigator.pop(context),
      imagePath: ImageConstant.imgGoBack,
      margin: const EdgeInsets.only(left: 13, top: 15, bottom: 15),
    ),
    centerTitle: true,
    title:  AppbarTitle(text: "Login with GSTIN"),
  );
}

// import 'package:flutter/material.dart';
// import 'package:itax/config/user_secure_storage.dart';
// import 'package:itax/models/logingst_model.dart';
// import 'package:itax/presentation/older_screens/gst/return_deshboard.dart';
// import 'package:itax/presentation/widgets/blue_button.dart';
// import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
// import 'package:itax/providers/providers_old/gst_api.dart';
// import 'package:itax/providers/services-old/utils/utils.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// class GSTLogin extends StatefulWidget {
//   const GSTLogin({super.key});

//   @override
//   State<GSTLogin> createState() => _GSTLoginState();
// }

// class _GSTLoginState extends State<GSTLogin> {
//   bool _fabVisible = false;
//   bool _hidePassword = true;
//   TextEditingController GstinController = TextEditingController();
//   TextEditingController gstUserNameController = TextEditingController();
//   TextEditingController userId = TextEditingController();
//   TextEditingController userPassword = TextEditingController();
//   SharedPreferences? logindata;

//   String? username;
//   String? password;

//   @override
//   void initState() {
//     super.initState();
//     initial();

//     Future.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         _fabVisible = true;
//       });
//     });
//   }

//   Future<void> initial() async {
//     logindata = await SharedPreferences.getInstance();

//     setState(() {
//       username = logindata?.getString('username');
//       password = logindata?.getString('password');
//     });

//     userId.text = username ?? "";
//     userPassword.text = password ?? "";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height, // Ensure a defined height
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//                     Consumer<GstSection>(
//                       builder: (context, pro, child) {
//                         return
//                         NeomorphicButton(
//                           onTap: () async {
//                             bool isValid =
//                                 validateGSTIN(pro.emailController.text);
//                             if (isValid) {
//                               await UserSecureStorage.saveGSTIN(
//                                   pro.emailController.text);
//                               final insert = LoginGst(
//                                   gstin: pro.emailController.text,
//                                   username: pro.passwordController.text);
//                               pro.GstOptGenerated(insert, context);
//                             } else {
//                               Utils.flushbarErrorMessage(
//                                   'GSTIN code is invalid', context);
//                             }
//                           },
//                           buttonText: 'Manage API Section',
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 22),
//                     Row(
//                       children: [
//                         Text("Password",
//                             style: TextStyle(fontSize: 16) 
//                             ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.grey,
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: TextField(
//                         controller: userPassword,
//                         obscureText: _hidePassword,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                             borderSide: BorderSide.none,
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                             borderSide: const BorderSide(color: Colors.blue),
//                           ),
//                           contentPadding: const EdgeInsets.all(16),
//                           suffixIcon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 _hidePassword = !_hidePassword;
//                               });
//                             },
//                             icon: _hidePassword
//                                 ? const Icon(Icons.visibility)
//                                 : const Icon(Icons.visibility_off),
//                           ),
//                         ),
//                         cursorColor: const Color.fromARGB(255, 33, 150, 243),
//                       ),
//                     ),
//                     const SizedBox(height: 22),
                  
//                     NeomorphicButton(
//                       onTap: () async {
//                         String username = userId.text;
//                         String password = userPassword.text;
//                         if (username.isNotEmpty) {
//                           print('Successful');
//                           logindata?.setBool('login', false);
//                           logindata?.setString('username', username);
//                           logindata?.setString('password', password);
//                         }
//                         launchUrlString(
//                             'https://services.gst.gov.in/services/login');
//                       },
//                       buttonText: 'Manage API Section',
//                     ), 
//                     const SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                       width: 80,
//                       height: 50,
//                       child:
                          
//                        NeomorphicButton(
//                         btnFontSize: 16,
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const ReturnDeshboard()));
//                         },
//                         buttonText: 'Skip',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// bool validateGSTIN(String gstin) {
//   final gstinPattern = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{2}$');
//   return gstinPattern.hasMatch(gstin);
// }
