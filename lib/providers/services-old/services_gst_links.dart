import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itax/models/gstservice_model/TrachgstModel.dart';
import 'package:itax/models/gstservice_model/pan_search.dart';
import 'package:itax/presentation/older_screens/services/gst_link/gstin_result_page.dart';
import 'package:itax/presentation/older_screens/services/gst_link/search_by_pan_result.dart';
import 'package:itax/providers/services-old/repository-old-services/auth_repository.dart';
import 'package:itax/providers/services-old/response/api_response.dart';
import 'package:itax/providers/services-old/utils/utils.dart';

import '../../models/gstservice_model/gstin_model.dart';


class gstinLink with ChangeNotifier {
  bool _loading =false;
  bool get loading=>_loading;
  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }
  final _myRepo=AuthRepository();
  ApiResponse<GstinServiceModel> GSTDetails=ApiResponse.loading();

  SetGSTLINK(ApiResponse<GstinServiceModel> response)
  {
    GSTDetails=response;
    notifyListeners();
  }
  

  Future<void> GstinLinkProv(String data,BuildContext context )
  async{

    setLoading(true);
    _myRepo.GSTINServicesRepo(data).then((value){
      Navigator.push(context,MaterialPageRoute(builder: (context) => const GSTINResult()));
      setLoading(false);
      SetGSTLINK(ApiResponse.comleted(value));

    }).onError((error, stackTrace){
      if(kDebugMode){
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetGSTLINK(ApiResponse.error(error.toString()));
      setLoading(false);
    });

  }
}
class PanSearch with ChangeNotifier {
  bool _loading =false;
  bool get loading=>_loading;
  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }
  final _myRepo=AuthRepository();
  ApiResponse<PanSearchModel> PanSearchDetails=ApiResponse.loading();
  SetPanSearch(ApiResponse<PanSearchModel> response)
  {
    PanSearchDetails=response;
    notifyListeners();
  }

  Future<void> PanSearchProv(String data, String code,BuildContext context )
  async{

    setLoading(true);
    print('hello i am ');
    _myRepo.PanSearchRepo(data,code).then((value){
      Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
      setLoading(false);
      SetPanSearch(ApiResponse.comleted(value));
      print('here the value');

    }).onError((error, stackTrace){
      if(kDebugMode){
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetPanSearch(ApiResponse.error(error.toString()));
      setLoading(false);
    });

  }
}
class GSTINTrackReturn with ChangeNotifier {
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
  ApiResponse<TrackGstModel> GSTINTrackDetails=ApiResponse.loading();
  SetGSTINTrack(ApiResponse<TrackGstModel> response)
  {
    GSTINTrackDetails=response;
    notifyListeners();
  }

  Future<void> GSTINTrackProv(dynamic data,BuildContext context )
  async{

    setLoading(true);
    print('hello i am ');
    _myRepo.GSTINTrackRepo(data).then((value){
      //Navigator.push(context,MaterialPageRoute(builder: (context) => const PanSearchResult()));
      setLoading(false);
      setVisible(true);
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