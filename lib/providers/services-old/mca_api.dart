import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itax/providers/services-old/repository-old-services/auth_repository.dart';
import 'package:itax/providers/services-old/response/api_response.dart';


import '../../models/mc/companydetails.dart';
import '../../models/mc/directar_details.dart';
class mca with ChangeNotifier {



  bool _loading =false;
  bool get loading=>_loading;
  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }
  final _myRepo=AuthRepository();
  ApiResponse<CompanyDetailsModel> companyDetails=ApiResponse.loading();
  SetCompanyDetail(ApiResponse<CompanyDetailsModel> response)
  {
    companyDetails=response;
    notifyListeners();
  }

  Future<void> CompanyDetailProv(String data,BuildContext context )
  async{

    setLoading(true);
    print('hello i am ');
    _myRepo.CompanyDetailsRepo(data).then((value){
      
      // Navigator.push(context,MaterialPageRoute(builder: (context) => const CompanyDetailView()));
      setLoading(false);
      SetCompanyDetail(ApiResponse.comleted(value));
      print('here the value');

    }).onError((error, stackTrace){
      if(kDebugMode){
        // Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetCompanyDetail(ApiResponse.error(error.toString()));
      setLoading(false);
    });

  }



  bool _loading1 =false;
  bool get loading1=>_loading1;
  setLoading1(bool value){
    _loading1=value;
    notifyListeners();
  }
  ApiResponse<DirectDetailsModel> dirctorDetails=ApiResponse.loading();
  SetDirectorDetail(ApiResponse<DirectDetailsModel> response){
    dirctorDetails=response;
    notifyListeners();
  }
  Future<void> directorDetailProv(dynamic data,BuildContext context ) async{
    setLoading1(true);
    print('hello i am ');

    _myRepo.directorDetailsRepo(data).then((value){
      setLoading1(false);
      SetDirectorDetail(ApiResponse.comleted(value));
      print('here the value');
    }).onError((error, stackTrace){
      if(kDebugMode){
        // Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetDirectorDetail(ApiResponse.error(error.toString()));
      setLoading1(false);
    });

  }



}