import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itax/models/bank/bank_vakidation.dart';
import 'package:itax/models/bank/ifcs_validation.dart';
import 'package:itax/models/bank/upi_verification.dart';
import 'package:itax/providers/services-old/repository-old-services/auth_repository.dart';
import 'package:itax/providers/services-old/response/api_response.dart';
import 'utils/utils.dart';

class BankApi with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();
  ApiResponse<IfcsValidationModel> ifcsbank = ApiResponse.loading();
  SetIfcscode(ApiResponse<IfcsValidationModel> response) {
    ifcsbank = response;
    notifyListeners();
  }

  Future<void> IFCSValidationProvider(
      dynamic data, BuildContext context) async {
    setLoading(true);

    print('hello i am ');
    _myRepo.IfcsValidationRepository(data).then((value) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const IfceDetailView()
      //     ));

      setLoading(false);
      SetIfcscode(ApiResponse.comleted(value));
      print('here the value');
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetIfcscode(ApiResponse.error(error.toString()));
      setLoading(false);
    });
  }

  bool _loading1 = false;
  bool get loading1 => _loading1;

  setLoading1(bool value) {
    _loading1 = value;
    notifyListeners();
  }

  bool _visible = false;
  bool get visible => _visible;
  void setVisible(bool value) {
    _visible = value;
    notifyListeners();
  }

  ApiResponse<BankValidationMode> bankvalidation = ApiResponse.loading();

  Setbankvalidation(ApiResponse<BankValidationMode> response) {
    bankvalidation = response;
    notifyListeners();
  }

  Future<void> BankValidationProvider(
      dynamic data, BuildContext context) async {
    setLoading1(true);
    print('hello i am ');
    _myRepo.BankValidationRepository(data).then((value) {
      setVisible(true);

      setLoading1(false);
      Setbankvalidation(ApiResponse.comleted(value));
      print('here the value');
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      Setbankvalidation(ApiResponse.error(error.toString()));
      setLoading1(false);
      setVisible(false);
    });
  }

  bool _loading2 = false;
  bool get loading2 => _loading2;

  setLoading2(bool value) {
    _loading2 = value;
    notifyListeners();
  }

  bool _visible1 = false;
  bool get visible1 => _visible1;
  void setVisible1(bool value) {
    _visible1 = value;
    notifyListeners();
  }

  ApiResponse<UpiVerificationModel> UPIvalidation = ApiResponse.loading();

  SetUPivalidation(ApiResponse<UpiVerificationModel> response) {
    UPIvalidation = response;
    notifyListeners();
  }

  Future<void> UPIValidationProvider(dynamic data, BuildContext context) async {
    setLoading2(true);
    print('hello i am ');
    _myRepo.UPIValidationRepository(data).then((value) {
      setVisible1(true);

      setLoading2(false);
      SetUPivalidation(ApiResponse.comleted(value));
      print('here the value');
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushbarErrorMessage(error.toString(), context);
      }
      SetUPivalidation(ApiResponse.error(error.toString()));
      setLoading2(false);
      setVisible(false);
    });
  }
}
