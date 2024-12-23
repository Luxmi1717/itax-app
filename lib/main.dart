import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/auth/sign_in_screen.dart';
import 'package:itax/presentation/screens/auth/signup_screen.dart';
import 'package:itax/repositories/auth_repository.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          home: SignInScreen(),
        );
      },
    );
  }
}
