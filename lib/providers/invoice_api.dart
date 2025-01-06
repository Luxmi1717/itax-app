// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';

// import '../data/response/api_response.dart';
// import '../data/respository/auth_repository.dart';
// import '../data/utils/utils.dart';
// import '../models/Invoice/CreatItem_invoice.dart';
// import '../models/Invoice/invoice_party_create.dart';
// import '../models/Invoice/invoice_search_id.dart';
// // 

// class CreateParty with ChangeNotifier {
//   bool _loading =false;
//   bool get loading=>_loading;
//   setLoading (bool value){
//     _loading=value;
//     notifyListeners();
//   }
//   final _myRepo=AuthRepository();
//   ApiResponse<InvoicePartyCreateModel> PartyDetails=ApiResponse.loading();
//   SetPartyCreate(ApiResponse<InvoicePartyCreateModel> response)
//   {
//     PartyDetails=response;
//     notifyListeners();
//   }

//   Future<void> InvoicePartyDetailsProv(  dynamic data,BuildContext context )
//   async{

//     setLoading(true);
//     print('hello i am ');
//     _myRepo.InvoicePartyCreateRepository(data).then((value){
//       //Navigator.push(context,MaterialPageRoute(builder: (context) => const GSTINResult()));
//       setLoading(false);
//       SetPartyCreate(ApiResponse.comleted(value));
//       print('here the value');

//     }).onError((error, stackTrace){
//       if(kDebugMode){
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       SetPartyCreate(ApiResponse.error(error.toString()));
//       setLoading(false);
//     });

//   }
// }

// class GetInvoiceById with ChangeNotifier {
//   bool _loading =false;
//   bool get loading=>_loading;
//   setLoading (bool value){
//     _loading=value;
//     notifyListeners();
//   }
//   final _myRepo=AuthRepository();
//   ApiResponse<InvoiceGetByIdModel> InvoicByIdDetails=ApiResponse.loading();
//   SetInvoiceById(ApiResponse<InvoiceGetByIdModel> response)
//   {
//     InvoicByIdDetails=response;
//     notifyListeners();
//   }

//   Future<void> InvoiceGetbyIdProv(  dynamic data,BuildContext context )
//   async{

//     setLoading(true);
//     print('hello i am ');
//     _myRepo.InvoiceGenerateThoughIdRepository(data).then((value){
//       //Navigator.push(context,MaterialPageRoute(builder: (context) => const GSTINResult()));
//       setLoading(false);
//       SetInvoiceById(ApiResponse.comleted(value));
//       print('here the value');

//     }).onError((error, stackTrace){
//       if(kDebugMode){
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       SetInvoiceById(ApiResponse.error(error.toString()));
//       setLoading(false);
//     });

//   }
// }

// class InvoiceItemCreate with ChangeNotifier {
//   bool _loading =false;
//   bool get loading=>_loading;
//   setLoading (bool value){
//     _loading=value;
//     notifyListeners();
//   }
//   final _myRepo=AuthRepository();
//   ApiResponse<InvoiceItemCreateModel> InvoicItemDetails=ApiResponse.loading();
//   SetInvoiceItem(ApiResponse<InvoiceItemCreateModel> response)
//   {
//     InvoicItemDetails=response;
//     notifyListeners();
//   }

//   Future<void> InvoiceGetbyIdProv( dynamic data,BuildContext context )
//   async{

//     setLoading(true);
//     print('hello i am ');
//     _myRepo.InvoiceItemCreateRepository(data).then((value){
//       //Navigator.push(context,MaterialPageRoute(builder: (context) => const GSTINResult()));
//       Utils.snakBar('Item Created', context);
//       setLoading(false);
//       SetInvoiceItem(ApiResponse.comleted(value));
//       print('here the value');

//     }).onError((error, stackTrace){
//       if(kDebugMode){
//         Utils.flushbarErrorMessage(error.toString(), context);
//       }
//       SetInvoiceItem(ApiResponse.error(error.toString()));
//       setLoading(false);
//     });

//   }
// }