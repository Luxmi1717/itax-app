import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/routes/app_route_constants.dart';
import 'package:itax/presentation/screens/auth/sign_in_screen.dart';
import 'package:itax/presentation/screens/auth/signup_screen.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/add-new-bank-screen.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/all-banks-page.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/bank-add-money.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/cash-in-office-page.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/specific-bank-page.dart';
import 'package:itax/presentation/screens/bottom-navigation/dashboard-navigation.dart';
import 'package:itax/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:itax/presentation/screens/debit-credit-screens/debit-note-screen.dart';
import 'package:itax/presentation/screens/debit-credit-screens/debit-note-user-page.dart';
import 'package:itax/presentation/screens/e-way-bill/e-way-details-page.dart';
import 'package:itax/presentation/screens/e-way-bill/e-way-login-page.dart';
import 'package:itax/presentation/screens/more-screens/company-details-page.dart';
import 'package:itax/presentation/screens/more-screens/gsp-details-page.dart';
import 'package:itax/presentation/screens/more-screens/gsp-setup-page.dart';
import 'package:itax/presentation/screens/more-screens/manage-user-page.dart';
import 'package:itax/presentation/screens/more-screens/more-screen.dart';
import 'package:itax/presentation/screens/more-screens/my-companies-page.dart';
import 'package:itax/presentation/screens/payables/all-payables-page.dart';
import 'package:itax/presentation/screens/payables/user-payable-page.dart';
import 'package:itax/presentation/screens/receipt-pages.dart/Receipt-per-user-page.dart';
import 'package:itax/presentation/screens/receipt-pages.dart/receipt-day-wise-page.dart';
import 'package:itax/presentation/screens/receipt-pages.dart/receipt-page.dart';
import 'package:itax/presentation/screens/receivables-and-payables-screens/receivable-user-page.dart';
import 'package:itax/presentation/screens/receivables-and-payables-screens/receivables-page.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/sales-day-page.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/sales-monthly-page.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/sales-person.dart';

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
    ),








    // -------------- more screens routes start ----------------------
    GoRoute(
      name: MyAppRouteConstants.companyDetailsName,
      path: '/company-details-page',
      pageBuilder: (context, state) {
        return const MaterialPage(child: CompanyDetailsPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.gspSetupName,
      path: '/gsp-setup-page',
      pageBuilder: (context, state) {
        return const MaterialPage(child: GSPSetupPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.gspSetupLoginName,
      path: '/gsp-setup-login',
      pageBuilder: (context, state) {
        return const MaterialPage(child: GSPSetupLoginPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.manageUsersName,
      path: '/manage-users',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ManageUsersPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.moreScreenName,
      path: '/more-screen',
      pageBuilder: (context, state) {
        return const MaterialPage(child: MoreScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.myCompaniesName,
      path: '/my-companies',
      pageBuilder: (context, state) {
        return const MaterialPage(child: MyCompaniesPage());
      },
    ),

    // -------------- more screens routes end ----------------------












    // -------------- sales purchase screens routes start ----------------------
    GoRoute(
      name: MyAppRouteConstants.salesOnaDayName,
      path: '/sales-on-day',
      pageBuilder: (context, state) {
        return const MaterialPage(child: SalesOnDayPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.salesMonthlyName,
      path: '/sales-monthly',
      pageBuilder: (context, state) {
        return const MaterialPage(child: SalesMonthlyPage());
      },
    ),
   
    GoRoute(
      name: MyAppRouteConstants.salesPerUserName,
      path: '/sales-per-user',
      pageBuilder: (context, state) {
        return const MaterialPage(child: SalesPerUserPage());
      },
    ),
    // -------------- sales purchase screens routes end ----------------------











    // -------------- Debit Credit Screens routes start ----------------------
    GoRoute(
      name: MyAppRouteConstants.debitPageName,
      path: '/debit-page',
      pageBuilder: (context, state) {
        return const MaterialPage(child: DebitPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.debitPerDateName,
      path: '/debit-note-per-date',
      pageBuilder: (context, state) {
        return const MaterialPage(child: DebitNotePerDate());
      },
    ),

    // -------------- Debit Credit Screens routes end ----------------------













  // -------------- Bank And Cash Screens routes start ----------------------

    GoRoute(
      name: MyAppRouteConstants.addBankName,
      path: '/add-new-bank',
      pageBuilder: (context, state) {
        return const MaterialPage(child: AddNewBankScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.allBanksName,
      path: '/all-banks',
      pageBuilder: (context, state) {
        return const MaterialPage(child: AllBanksPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.bankAddMoneyName,
      path: '/bank-add-money',
      pageBuilder: (context, state) {
        return const MaterialPage(child: BankAddMoneyPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.cashInOfficeName,
      path: '/cash-in-office',
      pageBuilder: (context, state) {
        return const MaterialPage(child: CashInOfficePage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.specificBankName,
      path: '/specific-bank',
      pageBuilder: (context, state) {
        return const MaterialPage(child: SpecificBankPage());
      },
    ),

    // -------------- Bank And Cash Screens routes end ----------------------











    // -------------- Eway Bill Screens routes start ----------------------
    GoRoute(
      name: MyAppRouteConstants.eWayDetailsName,
      path: '/e-way-details',
      pageBuilder: (context, state) {
        return const MaterialPage(child: EWayDetailsPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.eWayLoginName,
      path: '/e-way-login',
      pageBuilder: (context, state) {
        return const MaterialPage(child: EWayLogin());
      },
    ),

    // -------------- Eway Bill Screens routes end ----------------------













    // -------------- Receipt Screens routes start ----------------------
    GoRoute(
      name: MyAppRouteConstants.receiptPageName,
      path: '/receipt-page',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ReceiptPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.receiptDayWiseName,
      path: '/receipt-day-wise',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ReceiptDayWisePage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.receiptPerUserName,
      path: '/receipt-per-user',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ReceiptPerUserPage());
      },
    ),
    // -------------- Receipt Screens routes end ----------------------









    // -------------- Payable Screens routes start ----------------------
     GoRoute(
      name: MyAppRouteConstants.allPayablesName,
      path: '/all-payables',
      pageBuilder: (context, state) {
        return const MaterialPage(child: AllPayablesPage());
      },
    ),

    GoRoute(
      name: MyAppRouteConstants.userPayableName,
      path: '/user-payable',
      pageBuilder: (context, state) {
        return const MaterialPage(child: UserPayablePage());
      },
    ),
    // -------------- Payable Screens routes end ----------------------











    // -------------- Receivable Screens routes start ----------------------
     GoRoute(
      name: MyAppRouteConstants.userReceivableName,
      path: '/user-receivable',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ReceivableUserPage());
      },
    ),

     GoRoute(
      name: MyAppRouteConstants.allReceivablesName,
      path: '/all-receivables',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ReceivablesPage());
      },
    ),

    // -------------- Payable Screens routes end ----------------------

    ]
  );
}