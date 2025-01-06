// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';

// import '../data/response/api_response.dart';
// import '../data/respository/auth_repository.dart';
// import '../data/utils/utils.dart';
// import '../models/bussiness_profile.dart';

// class BussinessProfile with ChangeNotifier {
//   bool _loading =false;
//   bool get loading=>_loading;
//   setLoading (bool value){
//     _loading=value;
//     notifyListeners();
//   }




//   final _myRepo=AuthRepository();
//   ApiResponse<BusinessMode> BusinessUpdateDetails=ApiResponse.loading();
//   SetGSTINTrack(ApiResponse<BusinessMode> response)
//   {
//     BusinessUpdateDetails=response;
//     notifyListeners();
//   }

//   Future<void> BusinessProfileUpdataFunction(dynamic data,BuildContext context )
//   async{

//     setLoading(true);
//     print('hello i am ');
//     _myRepo.BussinesUpdateRepository(data).then((value){
//       //Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
//       setLoading(false);

//       SetGSTINTrack(ApiResponse.comleted(value));
//       print('here the value');

//     }).onError((error, stackTrace){
//       if(kDebugMode){
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       SetGSTINTrack(ApiResponse.error(error.toString()));
//       setLoading(false);
//     });

//   }

// }