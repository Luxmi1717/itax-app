import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:itax/models/bussiness_profile.dart';
import 'package:itax/providers/services-old/repository-old-services/auth_repository.dart';
import 'package:itax/providers/services-old/response/api_response.dart';
import 'package:itax/providers/services-old/utils/utils.dart';



class BussinessProfile with ChangeNotifier {
  bool _loading =false;
  bool get loading=>_loading;
  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }




  final _myRepo=AuthRepository();
  ApiResponse<BusinessMode> BusinessUpdateDetails=ApiResponse.loading();
  SetGSTINTrack(ApiResponse<BusinessMode> response)
  {
    BusinessUpdateDetails=response;
    notifyListeners();
  }

  Future<void> BusinessProfileUpdataFunction(dynamic data,BuildContext context )
  async{

    setLoading(true);
    print('hello i am ');
    _myRepo.BussinesUpdateRepository(data).then((value){
      //Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
      setLoading(false);

      SetGSTINTrack(ApiResponse.comleted(value));
      print('here the value');

    }).onError((error, stackTrace){
      if(kDebugMode){
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetGSTINTrack(ApiResponse.error(error.toString()));
      setLoading(false);
    });

  }

}