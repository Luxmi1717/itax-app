import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/routes/app_route_constants.dart';
import 'package:itax/presentation/screens/auth/sign_in_screen.dart';
import 'package:itax/presentation/screens/auth/signup_screen.dart';
import 'package:itax/presentation/screens/bottom-navigation/dashboard-navigation.dart';
import 'package:itax/presentation/screens/dashboard/dashboard_screen.dart';

class MyAppRouter {

  GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
        GoRoute(
      name: MyAppRouteConstants.homeRouteName,
      path: '/home',
      pageBuilder: (context, state) {
        return const MaterialPage(child: BottomNavBarExample());
      },
    ),
      GoRoute(
        name:MyAppRouteConstants.dashBoardRouteName,
        path:'/dashboard',
        pageBuilder: (context, state) {
          return const MaterialPage(child: DashboardScreen());
        },


      ),
      GoRoute(
      name: MyAppRouteConstants.signInRouteName,
      path: '/login',
      pageBuilder: (context, state) {
        return const MaterialPage(child: SignInScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.signUpRouteName,
      path: '/signup',
      pageBuilder: (context, state) {
        return const MaterialPage(child: SignUpScreen());
      },
    )
    ]
  );
}