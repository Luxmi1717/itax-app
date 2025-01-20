import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Databasehelper
{
  static  const _databasename='persons.db';
  static const _databaseversion=1;
  //table define here

  final tableNew='my_table1';
  final tableNew2='my_table2';
  final table5A_b2c='my_table5A_b2c';
  final table6A='my_table6A';
  final table6A_gst='my_table6A_gst';
  final table7A='my_table7A';
  final tableDeshbord='my_table_Deshbord';
  final tablePeriods='my_Periods_deshbord';
  //table for Deshbord gst


  static const columnRegularComposion='RegCom';
  static const columnYear='year';
  static const columnQuarter='Quarter';
  static const columnPeriod='period';
  static const columnId1='id';

//bussiness profile gst
  static const columnName='name';
  static const columnId='id';
  static const columnage='age';
  static const columnaddar='adhaar';
  static const columnTan='tan';
  static const columnPan='pan';
  static const columnMsme='MSME';
  static const columnGst='gst';
  static const columnBankaccount='Bank';
  static const columnBankDetails='bankDetails';
  static const columnIncorporation='incorporation';


//table for gst
  static const columnId2='id';
  static const columnGsrn='gsrn';
  static const columnPos='pos';
  static const columnInvoiceNo='InvoiceNo';
  static const columnInvoiceDate='InvoiceDate';
  static const columnInvoiceValue='Invoicevalue';
  static const columnCgst='CGST';
  static const columnSgst='SGST';
  static const columnRate='RATE';
  static const columnNature='Nature';
  static const columnSource='Source';

//table for gst1 5A_b2c
  static const columnId3='id';

  static const columnPos5A='pos5A';
  static const columnInvoiceNo5A='InvoiceNo54';
  static const columnSupplyType='SupplyType';
  static const columnInvoiceData5A='InvoiceData5A';
  static const columnInvoiceValue5A='Invoicevalue5A';
  static const columnCgst5A='CGST5A';
  static const columnSgst5A='SGST5A';
  static const columnTotalInvoiceVal='TotalVal5A';
  static const columnTurnover='Turnover';

 /* //table for gst1 6A
  static final columnId4='id';
  static final columnPos6A='pos6A';
  static final columnInvoiceNo6A='InvoiceNo6A';
  static final columnSupplyType6A='SupplyType6A';
  static final columnInvoiceData6A='InvoiceData6A';
  static final columnInvoiceValue6A='Invoicevalue6A';
  static final columnCgst6A='CGST6A';
  static final columnSgst6A='SGST6A';
  static final columnTotalInvoiceVal6A='TotalVal6A';
  static final columnTurnover6A='Turnover';*/

  //table for gst1 7b2c(Others)
  static const columnId7='id';
  static const columnPos7B='pos7A';
  static const columnSupplyType7B='SupplyType7';
  static const columnRate7B='Rate7b';
  static const columnCgst7B='CGST6A';
  static const columnSgst7B='SGST6A';
  static const columnCess='Cess';






  Database? _database;

  Databasehelper._privateConstructor();
  static final Databasehelper instance=Databasehelper._privateConstructor();
  Future<Database?> get databse async{
    if(_database!=null){
      return _database;
    }
    _database=await _initDatabase();
    return _database;


  }
  _initDatabase() async {
    Directory documentdirectry=await getApplicationDocumentsDirectory();
    String path=join(documentdirectry.path,_databasename);
    return await openDatabase(path, version:_databaseversion,onCreate:_onCreate);

  }

  Future _onCreate(Database db,int version) async{
    await db.execute(
        '''CREATE TABLE $tableNew(
    $columnId INTEGER PRIMARY KEY,
    $columnName INTEGER NOT NULL,
    $columnage INTEGER NOT NULL,
    $columnTan INTEGER NOT NULL,
    $columnPan INTEGER NOT NULL,
    $columnMsme INTEGER NOT NULL,
    $columnGst INTEGER NOT NULL,
    $columnBankDetails INTEGER NOT NULL,
    $columnBankaccount INTEGER NOT NULL,
    $columnaddar INTEGER NOT NULL,
    $columnIncorporation INTEGER NOT NULL
     )'''
    );
    //database for gstr 4a_4b_6b_gstr1


    await db.execute(
        '''CREATE TABLE $tableNew2(
    $columnId2 INTEGER PRIMARY KEY,
    $columnGsrn INTEGER NOT NULL,
    $columnPos INTEGER NOT NULL,
    $columnInvoiceNo INTEGER NOT NULL,
    $columnInvoiceDate INTEGER NOT NULL,
    $columnInvoiceValue INTEGER NOT NULL,
    $columnCgst INTEGER NOT NULL,
    $columnSgst INTEGER NOT NULL,
    $columnRate INTEGER NOT NULL,
    $columnNature INTEGER NOT NULL,
    $columnSource INTEGER NOT NULL
     )'''
    );
    //database for gstr 5a_b2c

    await db.execute('''
      CREATE TABLE $table5A_b2c (
        $columnId3 INTEGER PRIMARY KEY,
        $columnPos5A INTEGER NOT NULL,
        $columnInvoiceNo5A INTEGER NOT NULL,
        $columnSupplyType TEXT NOT NULL,
        
        $columnInvoiceData5A TEXT NOT NULL,
        $columnInvoiceValue5A REAL NOT NULL,
        $columnCgst5A REAL NOT NULL,
        
        $columnSgst5A REAL NOT NULL,
        $columnTurnover REAL NOT NULL
      );
    ''');
    //database gstr 6A

    /*await db.execute('''
      CREATE TABLE $table6A_gst(
        $columnId4 INTEGER PRIMARY KEY,
        $columnPos6A INTEGER NOT NULL,
        $columnInvoiceNo6A INTEGER NOT NULL,
        $columnSupplyType6A TEXT NOT NULL,
        
        $columnInvoiceData6A TEXT NOT NULL,
        $columnInvoiceValue6A REAL NOT NULL,
        $columnCgst6A REAL NOT NULL,
        $columnSgst6A REAL NOT NULL,
        $columnTotalInvoiceVal6A REAL NOT NULL,
      );
    ''');*/








  }



  //function to insert,query,update and delete
  Future<int> insert(Map <String,dynamic> row)async{
    Database? db=await instance.databse;
    return await db!.insert(tableNew,row);
  }



  //gst 4a table data
  Future<int> insert2(Map<String, dynamic> row) async {
    Database? db = await instance.databse;
    return await db!.insert(tableNew2, row);
  }


  //gst 5A_b2c table data
  Future<int> insert5A_B2C(Map<String, dynamic> row) async {
    Database? db = await instance.databse;
    return await db!.insert(table5A_b2c, row);
  }


  //gst dashboard quarter and period
  Future<int> insert6A(Map<String, dynamic> row) async {
    Database? db = await instance.databse;
    return await db!.insert(table6A_gst, row);
  }


  Future<List<Map<String,dynamic>> >quaryall()async{
    Database? db=await instance.databse;
    return await db!.query(tableNew2);
  }
  //gst 4a table data
  Future<List<Map<String, dynamic>>> queryAll2() async {
    Database? db = await instance.databse;
    return await db!.query(tableNew2);
  }
  Future<List<Map<String, dynamic>>> queryAll5A_B2C() async {
    Database? db = await instance.databse;
    return await db!.query(tableNew2);
  }



  Future<List<Map<String,dynamic>> >quaryspacific(int age)async{
    Database? db=await instance.databse;
    //var res= await db!.query(table ,where: "age< ?",whereArgs: [age]);
    var res=await db!.rawQuery('SELECT* FROM my_table WHERE age>? ',[age]);
    return res;
  }
  //gst 4a table data
  Future<List<Map<String, dynamic>>> querySpecific2(int pos) async {
    Database? db = await instance.databse;
    var res = await db!.rawQuery('SELECT * FROM $tableNew2 WHERE $columnPos=?', [pos]);
    return res;
  }

  Future<List<Map<String, dynamic>>> querySpecific5A_B2C(int pos) async {
    Database? db = await instance.databse;
    var res = await db!.rawQuery('SELECT * FROM $tableNew2 WHERE $columnPos=?', [pos]);
    return res;
  }


  Future<int?> deletedate(int id)async{
    Database? db=await instance.databse;
    var res=await db?.delete(tableNew,where: 'id=?',whereArgs: [id]);
    return res;
  }
//gst 4a table data
  Future<int?> deleteData2(int id) async {
    Database? db = await instance.databse;
    var res = await db?.delete(tableNew2, where: 'id=?',whereArgs: [id]);
    return res;
  }


  Future<int?>update(Map <String,dynamic> row )async{
    Database? db=await instance.databse;
    var res= await db!.update(tableNew ,row);
    return res;
  }
  //gst 4a table data
  Future<int?> update2(Map<String, dynamic> row) async {
    Database? db = await instance.databse;
    var res = await db!.update(tableNew2, row);
    return res;
  }


  Future<int?>delet(int id )async{
    Database? db=await instance.databse;
    var res= await db!.delete(
        tableNew ,where: 'id=?',whereArgs: [id]
    );
    return res;

  }
}

