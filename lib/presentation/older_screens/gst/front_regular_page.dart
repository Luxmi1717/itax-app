
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/models/gst/gstr1_model.dart';
import 'package:itax/presentation/older_screens/gst/regular.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/presentation/older_widgets/widgets/custom_button.dart';
import 'package:itax/presentation/older_widgets/widgets/gst_card2.dart';
import 'package:itax/providers/providers_old/gstr1_json_pro.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import 'gstr3b/gstr3b_page.dart';

class RegularCardPage extends StatefulWidget {
  const RegularCardPage({super.key});

  @override
  State<RegularCardPage> createState() => _RegularCardPageState();
}

class _RegularCardPageState extends State<RegularCardPage> {

  String _fileText='';
  final String _fileContents='';
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;

    return Scaffold(

      appBar: _buildAppBar(context),

      body: Container(
        color: Colors.grey.shade300,
        child: Column(

          children: [
            const SizedBox(height: 20,),
            Center(
              child: Card2(text: 'Details of outward suppllies of goods or services. GSTR1',
                Row:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegularPage()));
                      }, width: size.width*0.3,
                    child:
                    const Center(child: Text('ONLINE', style: TextStyle(fontWeight:FontWeight.bold, color: Colors.white,),),),),
                    CustomButton(onTap: () {

                      _pickFile();

                    }, width: size.width*0.3,
                      child:
                      const Center(child: Text('OFFLINE',
                        style: TextStyle(fontWeight:FontWeight.bold,

                          color: Colors.white,
                        ),),
                      ),),
                  ],
                ), ),
            ),
            const SizedBox(height: 20,),
            Card2(
              Row : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(onTap: () {  }, width: size.width*0.2,
                    child:
                    const Center(child: Text('VIEW',
                      style: TextStyle(fontWeight:FontWeight.bold,

                        color: Colors.white,
                      ),),
                    ),),
                  CustomButton(onTap: () {  }, width: size.width*0.35,
                    child:
                    const Center(child: Text('DOWNLOAD',
                      style: TextStyle(fontWeight:FontWeight.bold,

                        color: Colors.white,
                      ),),
                    ),),
                ],
              ), text: 'GSTR-2A',
            ),
            const SizedBox(height: 20,),
            Card2(
               Row:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const GSTR3b()));

                }, width: size.width*0.3,
                  child:
                  const Center(child: Text('ONLINE',
                    style: TextStyle(fontWeight:FontWeight.bold,

                      color: Colors.white,
                    ),),
                  ),),
                CustomButton(onTap: () {

                }, width: size.width*0.3,
                  child:
                  const Center(child: Text('OFFLINE',
                    style: TextStyle(fontWeight:FontWeight.bold,

                      color: Colors.white,
                    ),),
                  ),),
              ],
            ), text: 'GSTR-3B',
            ),



          ],
        ),
      ),


    );
  }

  void _pickFile() async {


    var status = await Permission.storage.request();
    if(status.isGranted){
      await Permission.storage.request();
      FilePickerResult? result=await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],

      );
      if(result!=null && result.files.single.path !=null){
        PlatformFile file=result.files.first;
        print(file.name);
        print(file.bytes);
        print(file.path);
        print(file.size);
        String? path = file.path;
        String? jsonContent = await File(path!).readAsString();
        dynamic jsonData = json.decode(jsonContent);
        var myData = MyData.fromJson(jsonData);

        Provider.of<MyDataModel>(context, listen: false).setMyData(myData);
        print(myData.gstin);
        for (var b2b in myData.b2b) {
          print('CTIN: ${b2b.ctin}');
          for (var inv in b2b.inv) {
            print('INUM: ${inv.inum}');
            print('IDT: ${inv.idt}');
            print('VAL: ${inv.val}');
            print('POS: ${inv.pos}');
            print('RCHRG: ${inv.rchrg}');
            for (var itm in inv.itms) {
              print('NUM: ${itm.num}');
              print('TX_VAL: ${itm.itmDet.txVal}');
              print('RT: ${itm.itmDet.rt}');
              print('CAMT: ${itm.itmDet.camt}');
              print('SAMT: ${itm.itmDet.samt}');
              print('CSAMT: ${itm.itmDet.csamt}');
            }
          }
        }

        print(jsonData);





      }
      File file0=File(result!.files.single.path!);
      setState(() {

        _fileText=file0.path;


      });






    }else {
      // Permission denied, handle the error
      //
      // ...
     Utils.flushbarErrorMessage('error in promission', context);
    }
  }

}


PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 38.h,
    leading: AppbarLeadingIconbutton(
      onTap: (){
        Navigator.pop(context);
      },
      imagePath: ImageConstant.imgGoBack,
      margin: EdgeInsets.only(
        left: 13.h,
        top: 15.v,
        bottom: 15.v,
      ),
    ),
    centerTitle: true,
    title: AppbarTitle(
      text: "Regular",
    ),
  );
}