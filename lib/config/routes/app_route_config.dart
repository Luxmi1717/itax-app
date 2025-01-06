import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/routes/app_route_constants.dart';
import 'package:itax/models/calculator/hrpCalculator.dart';
import 'package:itax/presentation/screens/auth/otp-verification-screen.dart';
import 'package:itax/presentation/screens/auth/sign_in_screen.dart';
import 'package:itax/presentation/screens/auth/signup_screen.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/add-new-bank-screen.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/all-banks-page.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/bank-add-money.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/cash-in-office-page.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/specific-bank-page.dart';
import 'package:itax/presentation/screens/bottom-navigation/dashboard-navigation.dart';
import 'package:itax/presentation/screens/calculators/capital-gain-calculators/capital-gain-calculator.dart';
import 'package:itax/presentation/screens/calculators/financial-calculators/financial-calculator-screen.dart';
import 'package:itax/presentation/screens/calculators/financial-calculators/investment-calculators/cagr-calculator.dart';
import 'package:itax/presentation/screens/calculators/financial-calculators/investment-calculators/fd-calculator.dart';
import 'package:itax/presentation/screens/calculators/financial-calculators/investment-calculators/lump-sum-calculator.dart';
import 'package:itax/presentation/screens/calculators/financial-calculators/investment-calculators/post-office-mis-calculator.dart';
import 'package:itax/presentation/screens/calculators/financial-calculators/investment-calculators/rd-calculator.dart';
import 'package:itax/presentation/screens/calculators/financial-calculators/investment-calculators/sip-calculator.dart';
import 'package:itax/presentation/screens/calculators/financial-calculators/loan-calculators/loan-page-template.dart';
import 'package:itax/presentation/screens/calculators/interest-calculators/compound-interest-calculator.dart';
import 'package:itax/presentation/screens/calculators/interest-calculators/simple-interest-calculator.dart';
import 'package:itax/presentation/screens/calculators/other-calculators/gst-calculator.dart';
import 'package:itax/presentation/screens/calculators/other-calculators/hra-tax-calculator.dart';
import 'package:itax/presentation/screens/calculators/other-calculators/npa-calculator.dart';
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
import 'package:itax/presentation/screens/ocr/aadhaar-ocr-screen.dart';
import 'package:itax/presentation/screens/ocr/invoice-ocr-screen.dart';
import 'package:itax/presentation/screens/ocr/main-ocr-screen.dart';
import 'package:itax/presentation/screens/ocr/pan-ocr-screen.dart';
import 'package:itax/presentation/screens/payables/all-payables-page.dart';
import 'package:itax/presentation/screens/payables/user-payable-page.dart';
import 'package:itax/presentation/screens/pdf-screens/image-to-pdf-screen.dart';
import 'package:itax/presentation/screens/pdf-screens/pdf-merge-screen.dart';
import 'package:itax/presentation/screens/pdf-screens/pdf-tools-screen.dart';
import 'package:itax/presentation/screens/receipt-pages.dart/Receipt-per-user-page.dart';
import 'package:itax/presentation/screens/receipt-pages.dart/receipt-day-wise-page.dart';
import 'package:itax/presentation/screens/receipt-pages.dart/receipt-page.dart';
import 'package:itax/presentation/screens/receivables-and-payables-screens/receivable-user-page.dart';
import 'package:itax/presentation/screens/receivables-and-payables-screens/receivables-page.dart';
import 'package:itax/presentation/screens/reports/report-balance-sheet-page.dart';
import 'package:itax/presentation/screens/reports/report-profit-loss-screen.dart';
import 'package:itax/presentation/screens/reports/trial-balance-page.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/sales-day-page.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/sales-monthly-page.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/sales-person.dart';

class MyAppRouter {
  GoRouter router = GoRouter(initialLocation: '/login', routes: [
    GoRoute(
      name: MyAppRouteConstants.homeRouteName,
      path: '/home',
      pageBuilder: (context, state) {
        return const MaterialPage(child: BottomNavBarDashBoard());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.dashBoardRouteName,
      path: '/dashboard',
      pageBuilder: (context, state) {
        return const MaterialPage(child: DashboardScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.otpVerificationName,
      path: '/otp-verification',
      pageBuilder: (context, state) {
        return const MaterialPage(child: OTPVerificationScreen());
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

//

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
      path: '/all-payable',
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

    // -------------- Recivable Screens routes end ----------------------

    //----------------- Reports Screens routes Start ---------------------

    GoRoute(
      name: MyAppRouteConstants.balanceSheetName,
      path: '/balance-sheet',
      pageBuilder: (context, state) {
        return const MaterialPage(child: BalanceSheetPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.profitLossScreenName,
      path: '/profit-loss',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ProfitLossReportPage());
      },
    ),

//---------------------- Calculator Screens routes Start ---------------------

    // GoRoute(
    //   path: '/calculate/hra',
    //   builder: (context, state) => const HRACalculatorScreen(),
    // ),
    // GoRoute(
    //   path: '/calculate/income-tax',
    //   builder: (context, state) => const ViewFrom16(),
    // ),
    GoRoute(
      path: '/calculate/PersonalLoanCal',
      builder: (context, state) => const FinancialCalculator(),
    ),

    GoRoute(
      path: '/calculate/PersonalLoanCal/SimpleIntrest',
      builder: (context, state) => const SimpleIntrest(),
    ),

    // GoRoute(
    //   path: '/calculate/PersonalLoanCal/CompoundIntrest',
    //   builder: (context, state) =>  CompoundInterest,
    // ),

    GoRoute(
      path: '/calculate/PersonalLoanCal/CarLaonCal',
      builder: (context, state) => const LoanPageTemplate(
        title: 'Car Loan Calculator',
      ),
    ),

    GoRoute(
      path: '/calculate/PersonalLoanCal/CapitalGain',
      builder: (context, state) => const CapitalGain(),
    ),
    GoRoute(
      path: '/calculate/hra',
      builder: (context, state) =>  HRPCalc(),
    ),
    
     GoRoute(
      path: '/calculate/hra',
      builder: (context, state) => HRPCalc(),
    ),
    GoRoute(
      path: '/calculate/PersonalLoanCal/GSTCalc',
      builder: (context, state) => const GstCalcPage(),
    ),

    GoRoute(
      path: '/calculate/PersonalLoanCal/BusinessLoanCalc',
      builder: (context, state) => const LoanPageTemplate(
        title: 'Business Loan Calculator',
      ),
    ),
    GoRoute(
      path: '/calculate/PersonalLoanCal/PropertyBusinessCalc',
      builder: (context, state) => const LoanPageTemplate(
        title: 'Property Loan Calculator',
      ),
    ),
    GoRoute(
      path: '/calculate/PersonalLoanCal/PersonalLoanCal',
      builder: (context, state) => const LoanPageTemplate(
        title: 'Personal Loan Calculator',
      ),
    ),
    GoRoute(
      path: '/calculate/PersonalLoanCal/HomeLoan',
      builder: (context, state) => const LoanPageTemplate(
        title: 'Home Loan Calculator',
      ),
    ),
    GoRoute(
      path: '/calculate/PersonalLoanCal/NPScalc',
      builder: (context, state) => const PensionCalculator(),
    ),
    GoRoute(
      path: '/calculate/PersonalLoanCal/CagrCalulator',
      builder: (context, state) => const CagrCalulator(),
    ),
    GoRoute(
      path: '/calculate/PersonalLoanCal/FDCalculator',
      builder: (context, state) => const FDCalculator(),
    ),
    GoRoute(
      path: '/calculate/PersonalLoanCal/LumpSumCalculator',
      builder: (context, state) => const LumpSumCalculator(),
    ),
    GoRoute(
      path: '/calculate/PersonalLoanCal/PostOfficeMissCalculator',
      builder: (context, state) => const PostOfficeMissCalculator(),
    ),

    GoRoute(
      path: '/calculate/PersonalLoanCal/RDCalculator',
      builder: (context, state) => const RDCalculator(),
    ),

    GoRoute(
      path: '/calculate/PersonalLoanCal/SipCalculator',
      builder: (context, state) => const SipCalculator(),


    ),



    //----------------- Calculator Screens routes End ---------------------




    //----------------- OCR Screens routes Start ---------------------
    GoRoute(
      path: '/ocr',
      builder: (context, state) => const OCRScreen(),
    ),
    GoRoute(
      path: '/ocr/aadhaar',
      builder: (context, state) => const AadhaarOCRScreen(),
    ),
    GoRoute(
      path: '/ocr/pan',
      builder: (context, state) => const PanOCRScreen(),
    ),
    GoRoute(
      path: '/ocr/invoice',
      builder: (context, state) => const InvoiceOCRScreen(),
    ),




    //----------------- PDF Screens routes Start ---------------------
    GoRoute(
      path: '/pdf/base',
      builder: (context, state) => const PDFToolsScreen()
    ),
    GoRoute(
      path: '/image-to-pdf',
      builder: (context, state) => const ImageToPDFScreen()
    ),
    // GoRoute(
    //   path: '/pdf-merge',
    //   builder: (context, state) => const MergePDFScreen()
    // ),

  ]
  );



}
