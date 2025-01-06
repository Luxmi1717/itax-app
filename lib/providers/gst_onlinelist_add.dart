// import 'package:flutter/cupertino.dart';
// import 'package:itaxeasy/screens/gst/gstr1/gst12_hsn_wise_summany/gst12_hsn_wise_model_page.dart';

// import '../config/sqflite_local_database.dart';
// import '../models/itr_taxpaid_model.dart';
// import '../screens/gst/gstr1/gst11a1_11a2_tax/gst11a1_11a2_tax_model_page.dart';
// import '../screens/gst/gstr1/gst5a-b2c/mode_list_record.dart';
// import '../screens/gst/gstr1/gst6a_export_invoice/model_list_record.dart';
// import '../screens/gst/gstr1/gst7b-b2c/7_b2c_model_page.dart';
// import '../screens/gst/gstr1/gst8a_8b_8c_8d/8a_8c_model_page.dart';
// import '../screens/gst/gstr1/gst9c_credut_debit_registed/9c_credut_debit_model_page.dart';
// import '../screens/gst/gstr1/gstb_credut_debit_unRegisted/b_credut_debit_unRegisted_model_page.dart';

// import '../screens/gst/gstr1/gst4a-4b-6b/model_4a_4b_gstr1.dart' as MM;

// class RecordProvider extends ChangeNotifier {
//   final List<Model_of_record_details> _dataList = [];

//   List<Model_of_record_details> get dataList => _dataList;

//   List<MM.Model_of_record_details> dataList2 = [];

//   final dbHelper = Databasehelper.instance;

//   void addRecord(Model_of_record_details record) {
//     _dataList.add(record);
//     notifyListeners();
//   }

//   Future<void> loadData() async {

//     final allRows = await dbHelper.queryAll2();




//     // Update the text field controller with the name value
//     dataList2 =  List.generate(
//       allRows.length,
//           (index) => MM.Model_of_record_details(recept_details: allRows[index]['gsrn'].toString(), legal_name: allRows[index]['gsrn'].toString(), Taxpayer_type: allRows[index]['InvoiceNo'].toString(), processed_records: allRows[index]['InvoiceDate'].toString(), pending_errored_invoice: '', AddInvoice: '',
//       ),
//     );
//     notifyListeners();

//   }

//   void delet(int id)async{
//     var delet= await dbHelper.deleteData2(id);
//      notifyListeners();
//     print(delet);
//   }

//   final List<Gst5aModel> _dataListGst5a_b2c=[];
//   List<Gst5aModel> get datListGst5a_b2c=>_dataListGst5a_b2c;

//   void addRecord5A_b2c(Gst5aModel record) {
//     _dataListGst5a_b2c.add(record);
//     notifyListeners();
//   }
//   final List<Gst6aModel > _dataListGst6a_export=[];
//   List<Gst6aModel > get dataListGst6a_export=>_dataListGst6a_export;

//   void addRecord6a_export(Gst6aModel  record) {
//     _dataListGst6a_export.add(record );
//     notifyListeners();
//   }

//   final List<Model7b2c > _dataListGst7_b2c=[];
//   List<Model7b2c > get dataListGst7_b2c=>_dataListGst7_b2c;

//   void addRecord7_b2c(Model7b2c record) {
//     _dataListGst7_b2c.add(record);
//     notifyListeners();
//   }
//   final List<Model8a_8b_8c_8d > _dataListGst8a_8b_8c_8d=[];
//   List<Model8a_8b_8c_8d > get dataListGst8a_8b_8c_8d=>_dataListGst8a_8b_8c_8d;

//   void addRecord8a_8b_8c_8d(Model8a_8b_8c_8d record) {
//     _dataListGst8a_8b_8c_8d.add(record);
//     notifyListeners();
//   }

//   final List<Model9c_credut_debit > _dataListGst9c_credut_debit=[];
//   List<Model9c_credut_debit> get dataListGst9c_credut_debit=>_dataListGst9c_credut_debit;

//   void addRecord9c_credut_debit(Model9c_credut_debit record) {
//     _dataListGst9c_credut_debit.add(record);
//     notifyListeners();
//   }
//   final List<Modelgst11a1_11a2_tax > _dataListGstgst11a1_11a2_tax=[];
//   List<Modelgst11a1_11a2_tax> get dataListGstgst11a1_11a2_tax=>_dataListGstgst11a1_11a2_tax;

//   void addRecordgst11a1_11a2_tax(Modelgst11a1_11a2_tax record) {
//     _dataListGstgst11a1_11a2_tax.add(record);
//     notifyListeners();
//   }
//   final List<Modelgst12_hsn_wise > _dataListGstgst12_hsn_wise=[];
//   List<Modelgst12_hsn_wise> get dataListGstgst12_hsn_wise=>_dataListGstgst12_hsn_wise;

//   void addRecordgst12_hsn_wise(Modelgst12_hsn_wise record) {
//     _dataListGstgst12_hsn_wise.add(record);
//     notifyListeners();
//   }
//   final List<Modelb_credut_debit_unRegisted> _dataListGstb_credut_debit_unRegisted=[];
//   List<Modelb_credut_debit_unRegisted> get dataListGstb_credut_debit_unRegisted=>_dataListGstb_credut_debit_unRegisted;

//   void addRecordb_credut_debit_unRegisted(Modelb_credut_debit_unRegisted record) {
//     _dataListGstb_credut_debit_unRegisted.add(record);
//     notifyListeners();
//   }

// }

