
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class PickJsonFile extends StatefulWidget {
  const PickJsonFile({super.key});

  @override
  State<PickJsonFile> createState() => _PickJsonFileState();
}

class _PickJsonFileState extends State<PickJsonFile> {
  String _fileText='';
  final String _fileContents='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: _pickFile, child: const Text('pick file'))


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
        print(jsonData);


      }
      File file0=File(result!.files.single.path!);
      setState(() {

        _fileText=file0.path;


      });

      PlatformFile file = result.files.first;




    }else {
      // Permission denied, handle the error
      //
      // ...
      print('error');
    }
  }




  }


