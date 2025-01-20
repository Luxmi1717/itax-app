import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import 'package:url_launcher/url_launcher.dart';

class FileHandleApi {
  // save pdf file function
  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir =  await getExternalStorageDirectory();
    final file = File('${dir?.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  // open pdf file function
  static Future openFile(File file) async {

      final url = file.path;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
  }
}