
import 'package:itax/models/bank/ifcs_validation.dart';
import 'package:itax/models/bank/upi_verification.dart';
import 'package:itax/models/bussiness_profile.dart';
import 'package:itax/models/calculator/cagrcalculator.dart';
import 'package:itax/models/calculator/postofficemis.dart';
import 'package:itax/models/gst/cash_ledger.dart';
import 'package:itax/models/gst/gst_api.dart';
import 'package:itax/models/gst/gstr4CPM.dart';
import 'package:itax/models/gstservice_model/TrachgstModel.dart';
import 'package:itax/models/gstservice_model/gstin_model.dart';
import 'package:itax/models/gstservice_model/pan_search.dart';
import 'package:itax/models/income_tax_link/pan_verify_model.dart';
import 'package:itax/models/income_tax_link/tan_search_model.dart';
import 'package:itax/models/loan/business_loan.dart';
import 'package:itax/models/loan/car_loan.dart';
import 'package:itax/models/loan/home_loan.dart';
import 'package:itax/models/loan/nps_loan.dart';
import 'package:itax/models/loan/personal_loan.dart';
import 'package:itax/models/mc/companydetails.dart';
import 'package:itax/models/mc/directar_details.dart';
import 'package:itax/models/services_post_office/Pincode_by_city.dart';
import 'package:itax/models/services_post_office/Pincode_by_info.dart';
import 'package:itax/models/services_post_office/Postoffic_by_city.dart';
import 'package:itax/providers/services-old/repository-old-services/resources/app_urls.dart';

import '../../../models/bank/bank_vakidation.dart';

import '../network/NetworkApiSerivec.dart';
import '../network/baseApiService.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServies();
  String baseUrl = "https://mom.itaxeasy.com/api";

  /*Future<SearchGstNumber> GstinApi(dynamic gstNumber) async {
    String url = baseUrl + "/gsp/search/gstin?gstin=$gstNumber";
    try {
      final respone = await _apiServices.GetApiResponse(url);
      print('sigam');
      print(respone);
      return SearchGstNumber.fromJson(respone);
    } catch (e) {
      throw e;
    }
  }*/


  Future<CompanyDetailsModel> CompanyDetailsRepo(String data) async {
    try {
      final respone = await _apiServices.GetApiResponse('https://api.itaxeasy.com/mca/company-details?cin=$data');
      print(respone);
      return CompanyDetailsModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<DirectDetailsModel> directorDetailsRepo(dynamic data) async{
    try {
      final respone = await _apiServices.postApiResponse2(AppUrl.directorDetails, data);
      print(respone);

      return DirectDetailsModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }
   Future<GstOpt> GstOTP(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(AppUrl.GstOtp, data);
      print(respone);

      return GstOpt.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }


  
  Future<GstOptVerify> GstOTPVerifiy(dynamic data) async {
    try {
      final respone =
          await _apiServices.postApiResponse(AppUrl.GstOtpVerify, data);
      print(respone);

      return GstOptVerify.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<CashResponse> CashRepository(int year, int month, String gstin) async {
    var cashURL =
        'https://api.itaxeasy.com/taxes/get-cash-itc-balence?year=$year&month=$month&gstin=$gstin';
    try {
      final respone = await _apiServices.GetApiResponse(cashURL);
      print(respone);

      return CashResponse.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<CashResponse> LiablilityRepository(
      String form, String to, String gstin) async {
    var cashURL =
        'https://api.itaxeasy.com//taxes/get-itc-chash-ledgers?gstin=$gstin&from=$form&to=$to';
    try {
      final respone = await _apiServices.GetApiResponse(cashURL);
      print(respone);

      return CashResponse.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }




  Future<GstinServiceModel> GSTINServicesRepo(String data) async {
    try {
      // final respone = await _apiServices.GetApiResponse('https://api.itaxeasy.com/gst/search/gstin/24AAACC1206D1ZM');
      final respone = await _apiServices.GetApiResponse('${AppUrl.baseUlr}/gst/search/gstin/$data');
      print(respone);
      return GstinServiceModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }
  Future<PanSearchModel> PanSearchRepo(String data,String code) async {
    try {
      final respone = await _apiServices.GetApiResponse('https://api.itaxeasy.com/gst/search/gstin-by-pan?pan=$data&gst_state_code=$code');
      print(respone);
      return PanSearchModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<TrackGstModel> GSTINTrackRepo(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse('https://api.itaxeasy.com/gst/return/track',data);
      print(respone);
      return TrackGstModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }
  Future<PanVerifyModel> PanVerifyRepo(String data) async {
    try {
      final respone = await _apiServices.GetApiResponse('https://api.itaxeasy.com/pan/get-pan-details?pan=$data');
      print(respone);
      return PanVerifyModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }
  Future<PanSearchModel> PanAadharRepo(String data) async {
    try {
      final respone = await _apiServices.GetApiResponse('https://api.itaxeasy.com/pan/get-pan-details?pan=$data');
      print(respone);
      return PanSearchModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }
  Future<TanSearchModel> TanSearchRepo(String data) async {
    try {
      final respone = await _apiServices.GetApiResponse2('https://api.itaxeasy.com/tan/search?tan=$data');
      print(respone);
      return TanSearchModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<PinByCityModel> PinCodeByCityRepo(String data) async {
    print('city by name');
    try {

     /* final response=await http.get(
       Uri.parse("https://api.itaxeasy.com/pincode/pincode-by-city?city=$data"),

      );
       print('hello');
       print(response.body);
      final jsonResponse = jsonDecode(response.body);
      return PinByCityModel.fromJson(jsonResponse);*/


     final respone = await _apiServices.GetApiResponse2('https://api.itaxeasy.com/pincode/pincode-by-city?city=$data');


      return PinByCityModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }
  Future<PincodeByInfoModel> PinCodeByInformationRepo(String data) async {
    try {
      final respone = await _apiServices.GetApiResponse2("https://api.itaxeasy.com/pincode/info-by-pincode?pincode=$data");
      print(respone);
      return PincodeByInfoModel.fromJson(respone);
    } catch (e) {
      print('error message');
      rethrow;

    }
  }
  Future<void> PostOfficebycityRepo(String data) async {
    print('hellow madam');
    try {
      final respone = await _apiServices.GetApiResponse2('https://api.itaxeasy.com/pincode/info-by-pincode?pincode=$data');
      print(respone);
      PostOfficesByCityModel.fromJson(respone);
    } catch (e) {
      //rethrow;
    }
  }
  /*Future<UserCountModel> BillshillUserCount() async {
    var cashURL = 'https://api.itaxeasy.com/cms/get-user-count';
    try {
      final respone = await _apiServices.GetApiResponse(cashURL);
      print(respone);

      return UserCountModel.fromJson(respone);
    } catch (e) {
      throw e;
    }
  }*/

  Future<IfcsValidationModel> IfcsValidationRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse2(AppUrl.IfcsUrl, data);
      print(respone);

      return IfcsValidationModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<BankValidationMode> BankValidationRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(AppUrl.bankUrl, data);
      print(respone);

      return BankValidationMode.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<UpiVerificationModel> UPIValidationRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(AppUrl.UPIUrl, data);
      print(respone);

      return UpiVerificationModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }
 



 /* Future<CreateBussinesProfile> BussinesProfil(dynamic data) async {
    try {
      print(data.toString());
      final respone =
          await _apiServices.postApiResponse2(AppUrl.businessProfile, data);
      print(respone);
      print('name');

      return CreateBussinesProfile.fromJson(respone);
    } catch (e) {
      throw e;
    }
  }*/

  Future<NpsLoanCalc> npsCalculator(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          '$baseUrl/calculator/miscellaneous/nps-returns', data);
      print(respone);

      return NpsLoanCalc.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<CarLoanCalc> carCalculator(dynamic data) async {
    try {
      final respone =
          await _apiServices.postApiResponse(baseUrl + AppUrl.CarLoanUrl, data);
      print(respone);

      return CarLoanCalc.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<HomeLoanCalc> homeCalculator(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          baseUrl + AppUrl.HomeLoanUrl, data);
      print(respone);

      return HomeLoanCalc.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<PersonalLoanCalc> personalCalculator(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          baseUrl + AppUrl.PersonalUrl, data);
      print(respone);

      return PersonalLoanCalc.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<BusinessLoanCalc> businessCalculator(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          baseUrl + AppUrl.BusinessUrl, data);
      print(respone);

      return BusinessLoanCalc.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<BusinessMode> BusinessProfileRro(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(AppUrl.businessprofileUpdateUrl, data);
      print(respone);

      return BusinessMode.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<PostOfficeMisModel>PostOfficeMissRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          AppUrl.postofficeMisUrl, data);
      print(respone);

      return PostOfficeMisModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }


  Future<CagrCalculatorModel>CagrCalulatorRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          AppUrl.CargCalUrl, data);
      print(respone);

      return CagrCalculatorModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }


  Future<NpsLoanCalc>RDCalculatorRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          AppUrl.RDCalcultorUrl, data);
      print(respone);

      return NpsLoanCalc.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<NpsLoanCalc>FDCalculatorRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          AppUrl.FDCalcultorUrl, data);
      print(respone);

      return NpsLoanCalc.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<NpsLoanCalc>LumpSumCalculatorRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          AppUrl.LumpSumCalculatorUrl, data);
      print(respone);

      return NpsLoanCalc.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }
  Future<NpsLoanCalc>SipCalculatorRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(
          AppUrl.SipCalculatorUrl, data);
      print(respone);

      return NpsLoanCalc.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  Future<BusinessMode>BussinesUpdateRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse('https://api.itaxeasy.com/business', data);
      print(respone);

      return BusinessMode.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }


  Future<Gstr4CpModel>Gstr4CMPRepository(dynamic data) async {
    try {
      final respone = await _apiServices.postApiResponse(AppUrl.gstr4Url, data);
      print(respone);

      return Gstr4CpModel.fromJson(respone);
    } catch (e) {
      rethrow;
    }
  }

  /*Future<BusinessProfileModel> BusinessGetProfileRro() async {
    var cashURL =
        'https://api.itaxeasy.com/users/get-business-profile';
    try {
      final respone = await _apiServices.GetApiResponse(cashURL);
      print(respone);

      return BusinessProfileModel.fromJson(respone);
    } catch (e) {
      throw e;
    }
  }
  Future<BusinessProfileGstModel> BusinessProfileGstNumberSerch( String gstNumber) async {
    var cashURL = 'https://mom.itaxeasy.com/api/gsp/search/gstin?gstin=$gstNumber';
    try {
      final respone = await _apiServices.GetApiResponse(cashURL);
      print(respone);
      return BusinessProfileGstModel.fromJson(respone);
    } catch (e) {
      throw e;
    }
  }*/
  




}