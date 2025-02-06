import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pick_or_save/pick_or_save.dart';

class TablePdfApi {
  
  static Future<File> generateTablePdf(
    List<Map<String, String>> list1,
    List<Map<String, String>> list2,
    String title,
  ) async {
    final pdf = pw.Document();

    // Function to build table from list
    pw.Widget buildTable(List<Map<String, String>> data) {
      return pw.Table(
        border: pw.TableBorder.all(),
        columnWidths: {
          0: pw.FlexColumnWidth(1),
          1: pw.FlexColumnWidth(2),
        },
        children: [
          pw.TableRow(
            children: [
              pw.Text('', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ],
          ),
          ...data.map(
            (row) => pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5),
                  child: pw.Text(row.keys.first),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5),
                  child: pw.Text(
                    row.values.first,
                    style: pw.TextStyle(color: PdfColors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }


    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Center(
              child: pw.Text(
                title,
                style: pw.TextStyle(
                  fontSize: 30,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
           
           
            pw.SizedBox(height: 8),
            buildTable(list1),
            pw.SizedBox(height: 20),
           
            pw.SizedBox(height: 8),
            buildTable(list2),
          ],
        ),
      ),
    );

    // Get directory to save file
    final outputDir = await getApplicationDocumentsDirectory();
    final file = File('${outputDir.path}/CalculationTable.pdf');

    // Save file
    await file.writeAsBytes(await pdf.save());

    // Use PickOrSave to save the file
    final params = FileSaverParams(
      localOnly: true,
      saveFiles: [
        SaveFileInfo(
          filePath: file.path,
          fileName: "CalculationTable.pdf",
        ),
      ],
    );

    await _fileSaver(params);

    return file;
  }
}




Future<List<String>?> _fileSaver(FileSaverParams params) async {
  final _pickOrSavePlugin = PickOrSave();
  List<String>? result;

  try {
    result = await _pickOrSavePlugin.fileSaver(params: params);
  } on PlatformException catch (e) {
    print('Error saving file: $e');
  } catch (e) {
    print('Unexpected error: $e');
  }

  return result;
}


