// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:go_router/go_router.dart';
// import 'package:itax/repositories/auth_repository.dart';


// import '../data/response/api_response.dart';
// import '../data/respository/auth_repository.dart';
// import '../models/calculator/cagrcalculator.dart';
// import '../models/calculator/capitalGain.dart';
// import '../models/calculator/compound_interest.dart';
// import '../models/calculator/gst_calc.dart';
// import '../models/calculator/hrpCalculator.dart';
// import '../models/calculator/postofficemis.dart';
// import '../models/calculator/simple_interest.dart';

// class Calculator with ChangeNotifier {
//   bool _loading = false;
//   bool get loading => _loading;

//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }

//   final _myRepo = AuthRepository();
//   ApiResponse<CompoundInterest> compound = ApiResponse.loading();

//   Setcompound(ApiResponse<CompoundInterest> response) {
//     compound = response;
//     notifyListeners();
//   }

//   Future<void> CompoundInt(dynamic data, BuildContext context) async {
//     setLoading(true);
//     print('hello i am ');
//     _myRepo.Calculator(data).then((value) {
//       context.push('/calculate/PersonalLoanCal/CompoundIntrest/CompoundResult');
//       setLoading(false);
//       Setcompound(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       Setcompound(ApiResponse.error(error.toString()));
//       setLoading(false);
//     });
//   }

//   ApiResponse<HraCalResponse> HRP = ApiResponse.loading();
//   bool _loading1 = false;
//   bool get loading1 => _loading1;

//   set1Loading(bool value) {
//     _loading1 = value;
//     notifyListeners();
//   }

//   SetHRP(ApiResponse<HraCalResponse> response) {
//     HRP = response;
//     notifyListeners();
//   }

//   bool _visible = false;
//   bool get visible => _visible;
//   void setVisible(bool value) {
//     _visible = value;
//     notifyListeners();
//   }

//   Future<void> HRPCalculator(dynamic data, BuildContext context) async {
//     set1Loading(true);
//     print('hello i am ');
//     _myRepo.HRPcalculation(data).then((value) {
//       setVisible(true);

//       print('HERE==$value');
//       set1Loading(false);
//       SetHRP(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       SetHRP(ApiResponse.error(error.toString()));
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       set1Loading(false);
//     });
//   }

//   ApiResponse<CapitalGainRespons> capitalgain = ApiResponse.loading();
//   bool _loading2 = false;
//   bool get loading2 => _loading2;

//   set2Loading(bool value) {
//     _loading2 = value;
//     notifyListeners();
//   }

//   void SetCapitalGain(ApiResponse<CapitalGainRespons> response) {
//     capitalgain = response;
//     notifyListeners();
//   }

//   bool _visible1 = false;
//   bool get visible1 => _visible1;
//   void setVisible1(bool value) {
//     _visible1 = value;
//     notifyListeners();
//   }

//   Future<void> CapitGainCalculator( dynamic data, BuildContext context) async {
//     set2Loading(true);
//     print('hello i am');
//     _myRepo.Capitalgaincalculation(data).then((value) {
//       Utils.flushbarErrorMessage(capitalgain.data!.success.toString(), context);
//       setVisible1(true);
//       print('HERE==$value');
//       set2Loading(false);
//       SetCapitalGain(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {

//       if (kDebugMode)
//       {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//         SetCapitalGain(ApiResponse.error(error.toString()));
//         set2Loading(false);
//         setVisible1(false);

//     });
//   }

//   ApiResponse<GstRespones> gst = ApiResponse.loading();
//   bool _loading3 = false;
//   bool get loading3 => _loading3;

//   bool _visibleGST = false;
//   bool get visibleGST => _visibleGST;
//   void setVisibleGST(bool value) {
//     _visibleGST = value;
//     notifyListeners();
//   }

//   set3Loading(bool value) {
//     _loading3 = value;
//     notifyListeners();
//   }

//   SetGST(ApiResponse<GstRespones> response) {
//     gst = response;
//     notifyListeners();
//   }

//   Future<void> GSTCalculator(dynamic data, BuildContext context) async {
//     set3Loading(true);
//     print('hello i am ');
//     _myRepo.Gstcalculation(data).then((value) {
//       setVisibleGST(true);
//       print('HERE==$value');
//       set3Loading(false);
//       SetGST(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       SetGST(ApiResponse.error(error.toString()));
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       set3Loading(false);
//       setVisibleGST(false);
//     });
//   }

//   ApiResponse<NpsLoanCalc> nps = ApiResponse.loading();
//   bool _loading4 = false;
//   bool get loading4 => _loading4;

//   bool _visibleNPS = false;
//   bool get visibleNPS => _visibleNPS;
//   void setVisibleNPS(bool value) {
//     _visibleNPS = value;
//     notifyListeners();
//   }

//   set4Loading(bool value) {
//     _loading4 = value;
//     notifyListeners();
//   }

//   SetNPS(ApiResponse<NpsLoanCalc> response) {
//     nps = response;
//     notifyListeners();
//   }

//   Future<void> NPSCalculator(dynamic data, BuildContext context) async {
//     set4Loading(true);
   
//     _myRepo.npsCalculator(data).then((value) {
//       setVisibleNPS(true);
//       print('HERE==$value');
//       set4Loading(false);
//       SetNPS(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       SetNPS(ApiResponse.error(error.toString()));
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       set4Loading(false);
//       setVisibleNPS(false);
//     });
//   }

//   ApiResponse<CarLoanCalc> car = ApiResponse.loading();
//   bool _loading5 = false;
//   bool get loading5 => _loading5;

//   bool _visibleCAR = false;
//   bool get visibleCAR => _visibleCAR;
//   void setVisibleCAR(bool value) {
//     _visibleCAR = value;
//     notifyListeners();
//   }

//   set5Loading(bool value) {
//     _loading5 = value;
//     notifyListeners();
//   }

//   SetCAR(ApiResponse<CarLoanCalc> response) {
//     car = response;
//     notifyListeners();
//   }

//   Future<void> CARCalculator(dynamic data, BuildContext context) async {
//     set5Loading(true);
//     print('hello i am ');
//     _myRepo.carCalculator(data).then((value) {
//       setVisibleCAR(true);
//       print('HERE==$value');
//       set5Loading(false);
//       SetCAR(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       SetCAR(ApiResponse.error(error.toString()));
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       set5Loading(false);
//       setVisibleCAR(false);
//     });
//   }

//   ApiResponse<HomeLoanCalc> home = ApiResponse.loading();
//   bool _loading6 = false;
//   bool get loading6 => _loading6;

//   bool _visibleHOME = false;
//   bool get visibleHOME => _visibleHOME;
//   void setVisibleHOME(bool value) {
//     _visibleHOME = value;
//     notifyListeners();
//   }

//   set6Loading(bool value) {
//     _loading6 = value;
//     notifyListeners();
//   }

//   SetHOME(ApiResponse<HomeLoanCalc> response) {
//     home = response;
//     notifyListeners();
//   }

//   Future<void> HOMECalculator(dynamic data, BuildContext context) async {
//     set6Loading(true);
//     print('hello i am ');
//     _myRepo.homeCalculator(data).then((value) {
//       setVisibleHOME(true);
//       print('HERE==$value');
//       set6Loading(false);
//       SetHOME(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       SetHOME(ApiResponse.error(error.toString()));
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       set6Loading(false);
//       setVisibleHOME(false);
//     });
//   }

//   ApiResponse<PersonalLoanCalc> personal = ApiResponse.loading();
//   bool _loading7 = false;
//   bool get loading7 => _loading7;

//   bool _visiblePERSONAL = false;
//   bool get visiblePERSONAL => _visiblePERSONAL;
//   void setVisiblePERSONAL(bool value) {
//     _visiblePERSONAL = value;
//     notifyListeners();
//   }

//   set7Loading(bool value) {
//     _loading7 = value;
//     notifyListeners();
//   }

//   SetPERSONAL(ApiResponse<PersonalLoanCalc> response) {
//     personal = response;
//     notifyListeners();
//   }

//   Future<void> PERSONALCalculator(dynamic data, BuildContext context) async {
//     set7Loading(true);
//     print('hello i am ');
//     _myRepo.personalCalculator(data).then((value) {
//       setVisiblePERSONAL(true);
//       print('HERE==$value');
//       set7Loading(false);
//       SetPERSONAL(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       SetPERSONAL(ApiResponse.error(error.toString()));
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       set7Loading(false);
//       setVisiblePERSONAL(false);
//     });
//   }

//   ApiResponse<BusinessLoanCalc> business = ApiResponse.loading();
//   bool _loading8 = false;
//   bool get loading8 => _loading8;

//   bool _visibleBUSINESS = false;
//   bool get visibleBUSINESS => _visibleBUSINESS;
//   void setVisibleBUSINESS(bool value) {
//     _visibleBUSINESS = value;
//     notifyListeners();
//   }

//   set8Loading(bool value) {
//     _loading8 = value;
//     notifyListeners();
//   }

//   SetBUSINESS(ApiResponse<BusinessLoanCalc> response) {
//     business = response;
//     notifyListeners();
//   }

//   Future<void> BUSINESSCalculator(dynamic data, BuildContext context) async {
//     set8Loading(true);
//     print('hello i am ');
//     _myRepo.businessCalculator(data).then((value) {
//       setVisibleBUSINESS(true);
//       print('HERE==$value');
//       set8Loading(false);
//       SetBUSINESS(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       SetBUSINESS(ApiResponse.error(error.toString()));
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       set8Loading(false);
//       setVisibleBUSINESS(false);
//     });
//   }
// }

// class SinpleIntrestProvider extends ChangeNotifier{

//   bool _loading = false;
//   bool get loading => _loading;

//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }

//   final _myRepo = AuthRepository();
//   ApiResponse<SimpleInterestResponse> simpleIntrestRespons = ApiResponse.loading();

//   SetSimpleIntrest(ApiResponse<SimpleInterestResponse> response) {
//     simpleIntrestRespons = response;
//     notifyListeners();
//   }

//   Future<void> SimpleIntrestFanction(dynamic data, BuildContext context) async {
//     setLoading(true);

//     _myRepo.SinpleInterest(data).then((value) {
//       context.push('/calculate/PersonalLoanCal/SimpleIntrest/SimpleInterestResult');
//       setLoading(false);
//       SetSimpleIntrest(ApiResponse.comleted(value));
      
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       SetSimpleIntrest(ApiResponse.error(error.toString()));
//       setLoading(false);
//     });
//   }


// }
// class PostOfficeMisProvider extends ChangeNotifier {
//   bool _loading = false;
//   bool get loading => _loading;
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }

//   bool _visible = false;
//   bool get visible => _visible;
//   void setVisible(bool value) {
//     _visible = value;
//     notifyListeners();
//   }

//   final _myRepo = AuthRepository();
//   ApiResponse<PostOfficeMisModel> PostofficMisRespons = ApiResponse.loading();

//   SetPostOfficeMis(ApiResponse<PostOfficeMisModel> response) {
//     PostofficMisRespons = response;
//     notifyListeners();
//   }

//   Future<void> PostOfficeMisFunction(dynamic data, BuildContext context) async {
//     setLoading(true);
//     print('hello i am');
//     _myRepo.PostOfficeMissRepository(data).then((value) {
//       setVisible(true);

//       setLoading(false);
//       SetPostOfficeMis(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {

//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       SetPostOfficeMis(ApiResponse.error(error.toString()));
//       setLoading(false);
//       setVisible(false);
//     });
//   }
// }
// class CAGRCalculatorProvider extends ChangeNotifier {
//   bool _loading = false;
//   bool get loading => _loading;
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }

//   bool _visible = false;
//   bool get visible => _visible;
//   void setVisible(bool value) {
//     _visible = value;
//     notifyListeners();
//   }

//   final _myRepo = AuthRepository();
//   ApiResponse<CagrCalculatorModel> CagrCalculatorRespons = ApiResponse.loading();

//   SetCagrCalculator(ApiResponse<CagrCalculatorModel> response) {
//     CagrCalculatorRespons = response;
//     notifyListeners();
//   }

//   Future<void> CAGRCalCulatorFunction(dynamic data, BuildContext context) async {
//     setLoading(true);
//     print('hello i am');
//     _myRepo.CagrCalulatorRepository(data).then((value) {
//       setVisible(true);

//       setLoading(false);
//       SetCagrCalculator(ApiResponse.comleted(value));
//       print('here the value');
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       SetCagrCalculator(ApiResponse.error(error.toString()));
//       setLoading(false);
//       setVisible(false);
//     });
//   }
// }


