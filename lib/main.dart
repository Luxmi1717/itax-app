import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/routes/app_route_config.dart';

import 'package:itax/repositories/auth_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
    
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final myAppRouter = MyAppRouter();

//     // return Sizer(
//     //   builder: (context, orientation, screenType) {
//         return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           routerConfig: myAppRouter.router,

//         );
//       // },
//     // );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(

      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        final myAppRouter = MyAppRouter();
        return MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: myAppRouter.router,
          
         
        );
      },
    );
  }
}
