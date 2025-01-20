import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:itax/models/services_post_office/Pincode_by_city.dart';
import 'package:itax/models/services_post_office/Pincode_by_info.dart';
import 'package:itax/models/services_post_office/Postoffic_by_city.dart';
import 'package:itax/providers/services-old/repository-old-services/auth_repository.dart';
import 'package:itax/providers/services-old/response/api_response.dart';
import 'package:itax/providers/services-old/utils/utils.dart';


class PincodeByCity with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();
  ApiResponse<PinByCityModel> PincodebyCityDetails = ApiResponse.loading();

  SetPinCodebyCity(ApiResponse<PinByCityModel> response) {
    PincodebyCityDetails = response;
    notifyListeners();
  }

  bool _visible = false;

  bool get visible => _visible;

  void setVisible(bool value) {
    _visible = value;
    notifyListeners();
  }

  Future<void> PinCodeByCityProv(String data, BuildContext context) async {
    print('hello 2');



    setLoading(true);
    print('hello i am  CITY');
    _myRepo.PinCodeByCityRepo(data).then((value) {
      //Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
      setLoading(false);
      setVisible(true);
      SetPinCodebyCity(ApiResponse.comleted(value));
      print('here the value');
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetPinCodebyCity(ApiResponse.error(error.toString()));
      setLoading(false);
    });
  }
}

class PincodeByInfo with ChangeNotifier {
  bool _loading =false;
  bool get loading=>_loading;
  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }
  final _myRepo=AuthRepository();
  ApiResponse<PincodeByInfoModel> PincodeByInfoDetails=ApiResponse.loading();
  SetPincodeByInfo(ApiResponse<PincodeByInfoModel> response)
  {
    PincodeByInfoDetails=response;
    notifyListeners();
  }
  bool _visible = false;
  bool get visible => _visible;
  void setVisible(bool value) {
    _visible = value;
    notifyListeners();
  }

  Future<void> PincodeByInfoProv(String data,BuildContext context )
  async{

    setLoading(true);
    print('hello i am ');
    _myRepo.PinCodeByInformationRepo(data).then((value){
      //Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
      setLoading(false);
      setVisible(true);
      SetPincodeByInfo(ApiResponse.comleted(value));
      print('here the value');

    }).onError((error, stackTrace){
      if(kDebugMode){
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetPincodeByInfo(ApiResponse.error(error.toString()));
      setLoading(false);
    });

  }
}
class PostOfficebyCity with ChangeNotifier {
  bool _loading =false;
  bool get loading=>_loading;
  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }
  final _myRepo=AuthRepository();
  ApiResponse<PostOfficesByCityModel> PostOfficebyCityDetails=ApiResponse.loading();
  SetPostOfficebyCity(ApiResponse<PostOfficesByCityModel> response)
  {
    PostOfficebyCityDetails=response;
    notifyListeners();
  }
  bool _visible = false;
  bool get visible => _visible;
  void setVisible(bool value) {
    _visible = value;
    notifyListeners();
  }

  Future<void> PostOfficebyCityProv(String data,BuildContext context )
  async{

    setLoading(true);
    print('hello i am ');
    _myRepo.PostOfficebycityRepo(data).then((value){
      //Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
      setLoading(false);
      setVisible(true);
      //SetPostOfficebyCity(ApiResponse.comleted(value));
      print('here the value');

    }).onError((error, stackTrace){
      if(kDebugMode){
        // Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetPostOfficebyCity(ApiResponse.error(error.toString()));
      setLoading(false);
    });

  }
}