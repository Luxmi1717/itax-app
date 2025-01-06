// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:itax/providers/provider-dependencies-old-code/api-response.dart';
// import 'package:itax/repositories/auth_repository.dart';

// import '../data/response/api_response.dart';
// import '../data/respository/auth_repository.dart';
// import '../data/utils/utils.dart';
// import '../models/gst/Liability.dart';
// import '../models/gst/cash_ledger.dart';
// import '../models/gst/gst_api.dart';
// import '../screens/gst/Cash_ledger.dart';
// import '../screens/gst/return_deshboard.dart';


// class GstSection with ChangeNotifier {

//   bool _isChecked =false;
//   bool get isChecked=>_isChecked;

//   void setisChecked(bool value){
//     _isChecked=value;
//     notifyListeners();
//   }




//   final  TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   final TextEditingController _otp = TextEditingController();
//   TextEditingController get emailController  => _emailController;
//   TextEditingController get passwordController =>_passwordController;
//   TextEditingController get otp =>_otp;




//   final _myRepo=AuthRepository();

//   ApiResponse<GstOpt> gstOptGenerate=ApiResponse.loading();
//   bool _loading =false;
//   bool get loading1=>_loading;

//   setLoading (bool value){
//     _loading=value;
//     notifyListeners();
//   }
//   SetHRP(ApiResponse<GstOpt> response){
//     gstOptGenerate=response;
//     notifyListeners();
//   }




//   Future<void> GstOptGenerated( dynamic data,BuildContext context) async{

//     setLoading(true);
    
//     _myRepo.GstOTP(data).then((value){
//       _showErrorDialog(context);

//       print('HERE==$value');
//       setLoading(false);
//       SetHRP(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       SetHRP(ApiResponse.error(error.toString()));
//       setLoading(false);

//     });

//   }



//   ApiResponse<GstOptVerify> gstOptVerify=ApiResponse.loading();


//   Setgstvirify(ApiResponse<GstOptVerify> response){
//     gstOptVerify=response;
//     notifyListeners();
//   }




//   Future<void> GstOptVerification( dynamic data,BuildContext context) async{
//     setLoading(true);
//     print('hello i am ');
//     _myRepo.GstOTPVerifiy(data).then((value){
//       Utils.flushbarErrorMessage('Sucessful OPT', context);
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReturnDeshboard()));


//       print('HERE==$value');
//       setLoading(false);
//       Setgstvirify(ApiResponse.comleted(value ));

//       print('here the value');
//     }).onError((error, stackTrace){
//       Setgstvirify(ApiResponse.error(error.toString()));
//       if(kDebugMode){
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       setLoading(false);
//     });

//   }



//   ApiResponse<CashResponse> CashLedger=ApiResponse.loading();


//   SetCashLedger(ApiResponse<CashResponse> response){
//     CashLedger=response;
//     notifyListeners();
//   }
//   bool _loadingCash =false;
//   bool get loadingCash=>_loadingCash;

//   setCashLoading (bool value){
//     _loadingCash=value;
//     notifyListeners();
//   }



//   Future<void> LedgerCash( int year,int month, String gstin,BuildContext context) async{
//     setCashLoading(true);
//     print('hello i am ');
//     _myRepo.CashRepository(year,month,gstin).then((value){

//       Navigator.push(context, MaterialPageRoute(builder: (context)=>const CashLadger()));


//       print('HERE==$value');
//       setCashLoading(false);
//       SetCashLedger(ApiResponse.comleted(value ));

//       print('here the value');
//     }).onError((error, stackTrace){
//       SetCashLedger(ApiResponse.error(error.toString()));
//       if(kDebugMode){
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       setCashLoading(false);
//     });




//   }
//   ApiResponse<LiabilityResone> LiablilityLedger=ApiResponse.loading();


//   SetLiablilityLedger(ApiResponse<LiabilityResone > response){
//     LiablilityLedger=response;
//     notifyListeners();
//   }
//   bool _loadingLaibility =false;
//   bool get loadingLaibilty=>_loadingLaibility;

//   setLibilitytLoading (bool value){
//     _loadingLaibility=value;
//     notifyListeners();
//   }



//   Future<void> LedgerLiability( String  form, String to, String gstin,BuildContext context) async{
//     setLibilitytLoading(true);
//     print('hello i am ');
//     _myRepo.LiablilityRepository(form,to,gstin).then((value){

//       Navigator.push(context, MaterialPageRoute(builder: (context)=>const CashLadger()));


//       print('HERE==$value');
//       setLibilitytLoading(false);
//       SetCashLedger(ApiResponse.comleted(value ));

//       print('here the value');
//     }).onError((error, stackTrace){
//       SetLiablilityLedger(ApiResponse.error(error.toString()));
//       if(kDebugMode){
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       setLibilitytLoading(false);
//     });




//   }
//   void _showErrorDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Inter OTP',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           content: TextField(
//             controller: otp,
//             onChanged: (value) {

//             },
//             keyboardType: TextInputType.number,
//             decoration: const InputDecoration(
//               hintText: 'Enter OTP',
//               border: OutlineInputBorder(),
//             ),
//           ),


//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                   child: const Text('Close'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 const SizedBox(width: 20,),
//                 ElevatedButton(
//                   child: const Text('Submit'),
//                   onPressed: () {
//                     Map data={
//                       "gstin":emailController.text,
//                       "gst_portal_username":passwordController.text,
//                       "otp":int.parse(otp.text),
//                     };
//                    GstOptVerification(data,context);


//                     },
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   final List<String> cashyear = [
//     '2023',
//     '2022',
//     '2021',
//     '2020',
//     '2019',
//     '2018',
//   ];
//   final List<String> cashmonth = [
//     '1',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '8',
//     '9',
//     '10',
//     '11',
//     '12',
//   ];

//   late  String _selectedCashyear='2023';
//   String get selectedCashyear=>_selectedCashyear;

//   void YearSelect( String value){
//     _selectedCashyear=value;
// notifyListeners();

//   }
//   late  String _selectedCashmonth='1';
//   String get selectedCashmonth=>_selectedCashmonth;

//   void MonthSelect( String value){
//     _selectedCashmonth=value;
//     notifyListeners();

//   }




// }
