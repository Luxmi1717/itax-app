// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:itax/config/colors.dart';
// import 'package:flutter_to_pdf/flutter_to_pdf.dart';

// class TablePage extends StatelessWidget {
//   final String title;
//   final List<Map<String, String>> firstList;
//   final List<Map<String, String>> secondList;

//   const TablePage({
//     Key? key,
//     required this.title,
//     required this.firstList,
//     required this.secondList,
//   }) : super(key: key);

//   Widget buildTable(List<Map<String, String>> data) {
//     return Table(
//       border: TableBorder.all(),
//       columnWidths: const {
//         0: FlexColumnWidth(1),
//         1: FlexColumnWidth(2),
//       },
//       children: [
//         const TableRow(
//           decoration: BoxDecoration(color: Colors.grey),
//           children: [
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text('Key', style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child:
//                   Text('Value', style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//           ],
//         ),
//         ...data.map((map) {
//           return TableRow(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(map.keys.first,
//                     style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(map.values.first,
//                     style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.bold,
//                         color: mainBlueColor)),
//               ),
//             ],
//           );
//         }).toList(),
//       ],
//     );
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.picture_as_pdf),
//             onPressed: () => generatePdf(context),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               buildTable(firstList),
//               const SizedBox(height: 16),
//               const SizedBox(height: 8),
//               buildTable(secondList),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// Future<void> generatePdf(BuildContext context) async {
//   final ExportDelegate exportDelegate = ExportDelegate();

//  ExportFrame(
//   frameId: 'someFrameId',
//   exportDelegate: exportDelegate,
//   child: TablePage(), 
// );

// // export the frame to a PDF Document
// final pdf = await exportDelegate.exportToPdfDocument('someFrameId');

// }


