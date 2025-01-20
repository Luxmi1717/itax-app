



// import 'package:itaxeasy/models/forgot_password_state.dart';
// import 'package:itaxeasy/screens/accounting/Sales.dart';
// import 'package:itaxeasy/screens/blog_post_screen.dart';
// import 'package:itaxeasy/screens/calculators/calculate_screen.dart';
// import 'package:itaxeasy/screens/calculators/hra_calculator_screen.dart';
// // import 'package:itaxeasy/screens/calculators/income_tax_calculator_screen.dart';
// import 'package:itaxeasy/screens/change_password_logged_in_screen.dart';
// import 'package:itaxeasy/screens/change_password_screen.dart';
// import 'package:itaxeasy/screens/file_itr.dart';
// import 'package:itaxeasy/screens/forgot_password.dart';
// import 'package:itaxeasy/screens/image_to_pdf_screen.dart';
// import 'package:itaxeasy/screens/invoice/add_item_screen.dart';
// import 'package:itaxeasy/screens/invoice/edit_item_screen.dart';
// import 'package:itaxeasy/screens/invoice/invoice_home_screen.dart';
// import 'package:itaxeasy/screens/login_screen.dart';
// import 'package:itaxeasy/screens/otp_verification.dart';
// import 'package:itaxeasy/screens/pdf_merge_screen.dart';
// import 'package:itaxeasy/screens/pdf_tools_screen.dart';
// import 'package:itaxeasy/screens/privacy_policy_screen.dart';
// import 'package:itaxeasy/screens/profile_screen.dart';
// import 'package:itaxeasy/screens/qr_scanner_screen.dart';
// import 'package:itaxeasy/screens/services/gst_link/gst_front_page.dart';
// import 'package:itaxeasy/screens/services/pan_aadhaar_link_screen.dart';
// import 'package:itaxeasy/screens/services/pan_search_screen.dart';
// import 'package:itaxeasy/screens/services/post_Office/pincode_information.dart';
// import 'package:itaxeasy/screens/sign_up_screen.dart';
// import 'package:itaxeasy/screens/splash_screen.dart';
// import 'package:itaxeasy/screens/support_screen.dart';
// import 'package:go_router/go_router.dart';
// import 'package:itaxeasy/widgets/loan_page_widget.dart/loan_page_template.dart';

// import '../screens/accounting/accounts.dart';
// import '../screens/accounting/bank.dart';
// import '../screens/accounting/deshboard.dart';
// import '../screens/bill_shill/bank/bank.dart';
// import '../screens/bill_shill/dashboard.dart';

// import '../screens/calculators/calculator/Investment_calculation/cagr.dart';
// import '../screens/calculators/calculator/Investment_calculation/fd_cal.dart';
// import '../screens/calculators/calculator/Investment_calculation/lump_sum_cal.dart';
// import '../screens/calculators/calculator/Investment_calculation/post_office_mis.dart';
// import '../screens/calculators/calculator/Investment_calculation/rd_cal.dart';
// import '../screens/calculators/calculator/Investment_calculation/sip_cal.dart';
// import '../screens/calculators/calculator/capital_gain.dart';
// import '../screens/calculators/calculator/compound_intrest/Compound_intrest.dart';
// import '../screens/calculators/calculator/compound_intrest/api_result.dart';
// import '../screens/calculators/calculator/financial_calculator.dart';
// import '../screens/calculators/calculator/gst_calc.dart';
// import '../screens/calculators/calculator/hrp_calc.dart';
// import '../screens/calculators/calculator/nps_calc.dart';
// import '../screens/calculators/calculator/simple_intrest/simple_interst_result.dart';
// import '../screens/calculators/calculator/simple_intrest/simple_intrest_calc.dart';
// import '../screens/calculators/new_income_tax_calculator_scren.dart';
// import '../screens/dashboard_view/bottom_navigation_bar.dart';
// import '../screens/drawer/about us.dart';
// import '../screens/drawer/contect_us.dart';
// import '../screens/drawer/disclaimer_policy.dart';
// import '../screens/drawer/term_conditions.dart';
// import '../screens/easy_bank_links.dart';
// import '../screens/gst/login_gst_page.dart';
// import '../screens/gst/return_deshboard.dart';
// import '../screens/insurence/insurance.dart';
// import '../screens/invoice/add_party_screen.dart';
// import '../screens/itr_home_screen.dart';
// import '../screens/itr_screen.dart';
// import '../screens/itr_section/challan_entry/challen_screan.dart';
// import '../screens/ocr/aadhaar_ocr_screen.dart';
// import '../screens/ocr/invoice_ocr_screen.dart';
// import '../screens/ocr/ocr_screen.dart';
// import '../screens/ocr/pan_ocr_screen.dart';
// import '../screens/itr_section/view_form_16.dart';
// import '../screens/profile_section/profile_screan.dart';

// import '../screens/services/bank/bank_verfication.dart';
// import '../screens/services/bank/ifce_code_page.dart';
// import '../screens/services/bank/upi_validation.dart';
// import '../screens/services/gst_link/gstin_search.dart';
// import '../screens/services/gst_link/serch_by_pan.dart';
// import '../screens/services/gst_link/track_gst_return.dart';
// import '../screens/services/income_tax_links/income_tax_link_front_page.dart';
// import '../screens/services/income_tax_links/search_tan.dart';
// import '../screens/services/income_tax_links/verify_pan_details.dart';
// import '../screens/services/mca/company_search.dart';
// import '../screens/services/post_Office/pin_by_city.dart';
// import '../screens/services/post_Office/post_office_front_page.dart';
// import '../screens/services/services_screen.dart';
// import '../screens/statup/startups_tab_container_page.dart';

// final appRoutes = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const SplashScreen(),
//     ),
//     GoRoute(
//       path: '/home',
//       builder: (context, state) =>const BottomNavigationPage() //const BottomBarScreen(),
//     ),
//     // GoRoute(
//     //   path: '/home',
//     //   builder: (context, state) => const HomeScreen(),
//     // ),
//     GoRoute(
//       path: '/buttom',
//       builder: (context, state) => const BottomNavigationPage()//const ButtomNavigationBar(),
//     ),
//     GoRoute(
//       path: '/privacy-policy',
//       builder: (context, state) => const PrivacyPolicyScreen(),
//     ),
//     GoRoute(
//       path: '/login',
//       builder: (context, state) => const LoginScreen(),
//     ),
//     GoRoute(
//       path: '/sign-up',
//       builder: (context, state) => const SignupScreen(),
//     ),
//     GoRoute(
//       path: '/otp-verification',
//       builder: (context, state) => OTPVerificationScreen(
//         routeState: state.extra as ForgotPasswordState?,
//       ),
//     ),
//     GoRoute(
//       path: '/forgot-password',
//       builder: (context, state) => const ForgotPasswordScreen(),
//     ),
//     GoRoute(
//       path: '/change-password',
//       builder: (context, state) => const ChangePasswordScreen(),
//     ),
//     GoRoute(
//       path: '/support',
//       builder: (context, state) => const SupportScreen(),
//     ),

//     // PROFILE ROUTES

//     GoRoute(
//       path: '/profile',
//       builder: (context, state) => const ProfileScreen(),
//     ),
//     GoRoute(
//       path: '/profile/change-password',
//       builder: (context, state) => const ChangePasswordLoggedInScreen(),
//     ),
//     GoRoute(
//       path: '/profile/edit',
//       builder: (context, state) => const Profile(),
//     ),
//     //gst ROUTES
//     GoRoute(
//       path: '/gst',
//       builder: (context, state) => const GSTLogin(),

//     ),

//     GoRoute(path: '/gst_dashboard',
//       builder: (context,state)=>const ReturnDeshboard(),
//     ),
//     //billshill

//     GoRoute(
//       path: '/billshill',
//       builder: (context, state) => const billshilldashboard(),
//     ),

//     GoRoute(path: '/statup',
//       builder: (context, state)=>const StartupsTabContainerPage(),
//     ),


//     //dirty coding by another developer
//     // GoRoute(
//     //   path: '/billshill',
//     //   builder: (context, state) => const BillDashBoard(),
//     // ),

//     //accounting
//     GoRoute(
//       path: '/accounting',
//       builder: (context, state) => const AccountingDeshboard(),
//     ),

//     //billshill deshboard

//     GoRoute(
//       path: '/billshill/invoice',
//       builder: (context, state) => const BankPage(),
//     ),

//     //accounting Dashboard

//     GoRoute(
//       path: '/accounting/bank',
//       builder: (context, state) => const AccountBank(),
//     ),

//     GoRoute(
//       path: '/accounting/Deshboard',
//       builder: (context, state) => const DeshBoard(),
//     ),
//     GoRoute(
//       path: '/accounting/Sales',
//       builder: (context, state) => const AccountSales(),
//     ),

//     // ITR ROUTES

//     GoRoute(
//       path: '/itr',
//       builder: (context, state) => const ITRHomeScreen(),
//     ),
//     GoRoute(
//       path: '/file-itr',
//       builder: (context, state) => const ITRScreen(),
//     ),
//     GoRoute(
//       path: '/file-itr/upload',
//       builder: (context, state) => const FileITRScreen(),
//     ),
//     GoRoute(
//       path: '/file-itr/file-Manually',
//       builder: (context, state) => const Manually_File(),
//     ),
//     GoRoute(
//       path: '/file-itr/challan-Entry',
//       builder: (context, state) => const ChallanEntryScrean(),
//     ),

//     // BLOG

//     GoRoute(
//       path: '/blog/:postId',
//       builder: (context, state) => BlogPostScreen(
//         blogPostId: state.params['postId'],
//       ),
//     ),

//     // PDF

//     GoRoute(
//       path: '/pdf',
//       builder: (context, state) => const PDFToolsScreen(),
//     ),
//     GoRoute(
//       path: '/pdf/merge',
//       builder: (context, state) => const MergePDFScreen(),
//     ),
//     GoRoute(
//       path: '/pdf/convert',
//       builder: (context, state) => const ImageToPDFScreen(),
//     ),

//     // Calculators

//     GoRoute(
//       path: '/calculate',
//       builder: (context, state) => const CalculateScreen(),
//     ),
//     GoRoute(
//       path: '/calculate/hra',
//       builder: (context, state) => const HRACalculatorScreen(),
//     ),
//     GoRoute(
//       path: '/calculate/income-tax',
//       builder: (context, state) => const ViewFrom16(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal',
//       builder: (context, state) => const FinancialCalculator(),
//     ),

//     GoRoute(
//       path: '/calculate/PersonalLoanCal/SimpleIntrest',
//       builder: (context, state) => const SimpleIntrest(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/SimpleIntrest/SimpleInterestResult',
//       builder: (context, state) => const SimpleInterestResult(),
//     ),

//     GoRoute(
//       path: '/calculate/PersonalLoanCal/CompoundIntrest',
//       builder: (context, state) => const CompoundInterest(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/CompoundIntrest/CompoundResult',
//       builder: (context, state) => const CompoundResult(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/SimpleIntrest',
//       builder: (context, state) => const CompoundInterest(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/CompoundIntrest/CompoundResult',
//       builder: (context, state) => const CompoundResult(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/CarLaonCal',
//       builder: (context, state) =>  const LoanPageTemplate(
//         title: 'Car Loan Calculator',
//       ),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/HRPCalc',
//       builder: (context, state) => const HRPCalc(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/CapitalGain',
//       builder: (context, state) => const CapitalGain(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/GSTCalc',
//       builder: (context, state) =>  const GstCalcPage(),
//     ),

//     GoRoute(
//       path: '/calculate/PersonalLoanCal/BusinessLoanCalc',
//       builder: (context, state) =>  const LoanPageTemplate(title: 'Business Loan Calculator',),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/PropertyBusinessCalc',
//       builder: (context, state) =>  const LoanPageTemplate(
//         title: 'Property Loan Calculator',
//       ),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/PersonalLoanCal',
//       builder: (context, state) =>  const LoanPageTemplate(
//         title: 'Personal Loan Calculator',
//       ),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/HomeLoan',
//       builder: (context, state) =>  const LoanPageTemplate(
//         title: 'Home Loan Calculator',
//       ),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/NPScalc',
//       builder: (context, state) => const PensionCalculator(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/CagrCalulator',
//       builder: (context, state) => const CagrCalulator(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/FDCalculator',
//       builder: (context, state) => const FDCalculator(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/LumpSumCalculator',
//       builder: (context, state) => const LumpSumCalculator(),
//     ),
//     GoRoute(
//       path: '/calculate/PersonalLoanCal/PostOfficeMissCalculator',
//       builder: (context, state) => const PostOfficeMissCalculator(),
//     ),

//     GoRoute(
//       path: '/calculate/PersonalLoanCal/RDCalculator',
//       builder: (context, state) => const RDCalculator(),
//     ),

//     GoRoute(
//       path: '/calculate/PersonalLoanCal/SipCalculator',
//       builder: (context, state) => const SipCalculator(),
//     ),

//     // OCR
//     GoRoute(
//       path: '/ocr',
//       builder: (context, state) => const OCRScreen(),
//     ),
//     GoRoute(
//       path: '/ocr/aadhaar',
//       builder: (context, state) => const AadhaarOCRScreen(),
//     ),
//     GoRoute(
//       path: '/ocr/pan',
//       builder: (context, state) => const PanOCRScreen(),
//     ),
//     GoRoute(
//       path: '/ocr/invoice',
//       builder: (context, state) => const InvoiceOCRScreen(),
//     ),
//     GoRoute(
//       path: '/insurance',
//       builder: (context, state) => const insurance(),
//     ),

//     // Services
//     GoRoute(
//       path: '/services',
//       builder: (context, state) => const ServicesScreen(),
//     ),
//     GoRoute(
//       path: '/services/pan-search',
//       builder: (context, state) => const PanSearchScreen(),
//     ),
//     GoRoute(
//       path: '/services/pan-aadhaar-link',
//       builder: (context, state) => const PanAadhaarLinkScreen(),
//     ),
//     GoRoute(
//       path: '/services/MCA',
//       builder: (context, state) => const CompanySearch(),
//     ),
//     GoRoute(
//       path: '/services/MCA/companyId',
//       builder: (context, state) => const CompanySearch(),
//     ),
//     GoRoute(
//       path: '/services/MCA/bank',
//       builder: (context, state) => const BankLinks(),
//     ),
//     GoRoute(
//       path: '/services/gstin',
//       builder: (context, state) => const GstLink(),
//     ),
//     GoRoute(
//       path: '/services/pan_Search',
//       builder: (context, state) => const PanSearchPage(),
//     ),
//     GoRoute(
//       path: '/services/track_gstReturn',
//       builder: (context, state) => const TrackGSTReturnPage(),
//     ),
//     GoRoute(
//       path: '/services/pan_details',
//       builder: (context, state) => const PanVerifyDetails(),
//     ),
//     GoRoute(
//       path: '/services/pan_aadaar_status',
//       builder: (context, state) => const PanAadhaarLinkScreen(),
//     ),
//     GoRoute(
//       path: '/services/Search_tan',
//       builder: (context, state) => const SearchTanPage(),
//     ),

//     GoRoute(
//       path: '/services/bank_account',
//       builder: (context, state) => const BankVerfiction(),
//     ),
//     GoRoute(
//       path: '/services/upi_validation',
//       builder: (context, state) => const UPIValidation(),
//     ),
//     GoRoute(
//       path: '/services/pincode_information',
//       builder: (context, state) => const PineCodeInformationPage(),
//     ),
//     GoRoute(
//       path: '/services/pin_by_city',
//       builder: (context, state) => const PinbyCityPage(),
//     ),
//     GoRoute(
//       path: '/services/IFSC',
//       builder: (context, state) => const IFCSCode(),
//     ),

//     GoRoute(
//       path: '/services/MCA/gst',
//       builder: (context, state) => const GSTLinks(),
//     ),
//     GoRoute(
//       path: '/services/MCA/IncomeTaxLinks',
//       builder: (context, state) => const IncomeTaxLinks(),
//     ),

//     GoRoute(
//       path: '/services/MCA/postofficelink',
//       builder: (context, state) => const PostOffiecLinks(),
//     ),

//     //drawer
//     GoRoute(
//       path: '/buttom/about_us',
//       builder: (context, state) => const AboutUsPage(),
//     ),

//     GoRoute(
//       path: '/buttom/term_and_condition',
//       builder: (context, state) => const TermAndCondition(),
//     ),

//     GoRoute(
//       path: '/buttom/contect_us',
//       builder: (context, state) => const ContectUs(),
//     ),
//     GoRoute(
//       path: '/buttom/disclaimer',
//       builder: (context, state) => const DisclaimerPolicy(),
//     ),

//     // Invoice

//     GoRoute(
//       path: '/invoice',
//       builder: (context, state) => const InvoiceHomeScreen(),
//     ),

//     GoRoute(
//       path: '/invoice/add-item',
//       builder: (context, state) => const AddItemPage(),
//     ),

//     GoRoute(
//       path: '/invoice/add-party',
//       builder: (context, state) => const AddPartyPage(),
//     ),

//     GoRoute(
//       path: '/invoice/edit-item/:id',
//       builder: (context, state) => EditItemPage(state.params['id']),
//     ),
//     GoRoute(
//       path: '/invoice/add-party',
//       builder: (context, state) => const AddPartyPage(),
//     ),
//     GoRoute(
//       path: '/scan',
//       builder: (context, state) => const QrScannerScreen(),
//     ),

//     //GoRoute(
//     //  path: '/invoice/create-invoice',
//      // builder: (context, state) => CreateInvoiceScreen(),
//    // ),
//   ],
// );
