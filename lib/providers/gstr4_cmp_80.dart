// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';

// import '../data/response/api_response.dart';
// import '../data/respository/auth_repository.dart';
// import '../data/utils/utils.dart';
// import '../models/gst/gstr4CPM.dart';

// class Gstr4CMP with ChangeNotifier {
//   bool _loading =false;
//   bool get loading=>_loading;
//   setLoading (bool value){
//     _loading=value;
//     notifyListeners();
//   }
//   final _myRepo=AuthRepository();
//   ApiResponse<Gstr4CpModel> Gstr4CMPDetails=ApiResponse.loading();
//   SetGstr4CMP(ApiResponse<Gstr4CpModel> response)
//   {
//     Gstr4CMPDetails=response;
//     notifyListeners();
//   }
//   bool _visible = false;
//   bool get visible => _visible;
//   void setVisible(bool value) {
//     _visible = value;
//     notifyListeners();
//   }

//   Future<void> Gstr4CMPProv(dynamic data,BuildContext context )
//   async{

//     setLoading(true);
//     print('hello i am ');
//     _myRepo.Gstr4CMPRepository(data).then((value){
//       //Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));

//       setLoading(false);
//       setVisible(true);
//       SetGstr4CMP(ApiResponse.comleted(value));
//       print('here the value');

//     }).onError((error, stackTrace){
//       if(kDebugMode){
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       SetGstr4CMP(ApiResponse.error(Gstr4CMPDetails.message));
//       setLoading(false);
//     });

//   }
// }