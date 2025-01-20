import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itax/models/income_tax_link/pan_verify_model.dart';
import 'package:itax/models/income_tax_link/tan_search_model.dart';
import 'package:itax/providers/services-old/repository-old-services/auth_repository.dart';
import 'package:itax/providers/services-old/response/api_response.dart';
import 'package:itax/providers/services-old/utils/utils.dart';


class PanVerify with ChangeNotifier {
  bool _loading =false;
  bool get loading=>_loading;
  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }
  final _myRepo=AuthRepository();
  ApiResponse<PanVerifyModel> PanVerifyDetails=ApiResponse.loading();
  SetPanVerfy(ApiResponse<PanVerifyModel> response)
  {
    PanVerifyDetails=response;
    notifyListeners();
  }
  bool _visible = false;
  bool get visible => _visible;
  void setVisible(bool value) {
    _visible = value;
    notifyListeners();
  }

  Future<void> PanVerifyProv(String data,BuildContext context )
  async{

    setLoading(true);
    print('hello i am ');
    _myRepo.PanVerifyRepo(data).then((value){
      //Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
      setLoading(false);
      setVisible(true);
      SetPanVerfy(ApiResponse.comleted(value));
      print('here the value');

    }).onError((error, stackTrace){
      if(kDebugMode){
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetPanVerfy(ApiResponse.error(error.toString()));
      setLoading(false);
    });

  }
}

/*class PanAadharStatus with ChangeNotifier {
  bool _loading =false;
  bool get loading=>_loading;
  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }


  bool _visible = false;
  bool get visible => _visible;
  void setVisible(bool value) {
    _visible = value;
    notifyListeners();
  }

  final _myRepo=AuthRepository();
  ApiResponse<PanSearchModel> PanAadharDetails=ApiResponse.loading();
  SetPanAadharStatus(ApiResponse<PanSearchModel> response)
  {
    PanAadharDetails=response;
    notifyListeners();
  }


  Future<void> PanSProv(String data, String code,BuildContext context )
  async{

    setLoading(true);
    print('hello i am ');
    _myRepo.PanAadharRepo(data,code).then((value){
      //Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
      setLoading(false);
      setVisible(true);
      SetPanAadharStatus(ApiResponse.comleted(value));
      print('here the value');

    }).onError((error, stackTrace){
      if(kDebugMode){
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetPanAadharStatus(ApiResponse.error(error.toString()));
      setLoading(false);
    });

  }
}*/
class SearchTan with ChangeNotifier {
  bool _loading =false;
  bool get loading=>_loading;
  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }


  bool _visible = false;
  bool get visible => _visible;
  void setVisible(bool value) {
    _visible = value;
    notifyListeners();
  }

  final _myRepo=AuthRepository();
  ApiResponse<TanSearchModel> TanSearchDetails=ApiResponse.loading();
  SetTanSearch(ApiResponse<TanSearchModel> response)
  {
    TanSearchDetails=response;
    notifyListeners();
  }

  Future<void> PanSearchProv(String data,BuildContext context )
  async{

    setLoading(true);
    print('hello i am ');
    _myRepo.TanSearchRepo(data).then((value){
     // Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
      setLoading(false);
      setVisible(true);
      SetTanSearch(ApiResponse.comleted(value));
      print('here the value');

    }).onError((error, stackTrace){
      if(kDebugMode){
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetTanSearch(ApiResponse.error(error.toString()));
      setLoading(false);
    });

  }
}

