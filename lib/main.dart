import 'package:flutter/material.dart';
import 'package:itax/config/routes/app_route_config.dart';

import 'package:itax/repositories/auth_repository.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final myAppRouter = MyAppRouter(); // Ensure single instance

    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: myAppRouter.router,
          // routeInformationParser: myAppRouter.router.routeInformationParser,
          // routerDelegate: myAppRouter.router.routerDelegate,
        );
      },
    );
  }
}
