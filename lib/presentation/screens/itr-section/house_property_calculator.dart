// import 'package:flutter/material.dart';
// import 'package:itax/presentation/screens/itr-section/widgets/input-taxt-widget.dart';
// import 'package:itax/presentation/screens/itr-section/widgets/year-button-widget.dart';
// import 'package:itax/providers/manually_itr_form16.dart';
// import 'package:provider/provider.dart';


// class HousePropertyScreen extends StatefulWidget {
//   final String calculatorName;

//   const HousePropertyScreen({super.key, required this.calculatorName});

//   @override
//   State<HousePropertyScreen> createState() => _HousePropertyScreenState();
// }

// class _HousePropertyScreenState extends State<HousePropertyScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey,
//               child: Center(
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: height / 40,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: width / 20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 widget.calculatorName,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: height / 40),
//               ),
//               SizedBox(height: height / 40),
//               Consumer<ManualITRCalculation>(
//                 builder: (context, pro, child) {
//                   return Container(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const SizedBox(height: 4.0),
//                         const Text(
//                           'Interest Paid/Payable on Housing Loan',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                         const SizedBox(height: 10.0),
//                         _buildLoanInput(pro, '1. Interest on Housing Loan',
//                             pro.housingLoanTextController, pro.SetHousigLoan),
//                         const SizedBox(height: 10.0),
//                         _buildLetOutPropertyInput(pro),
//                         const SizedBox(height: 10.0),
//                         _buildNetAnnualValue(pro),
//                         const SizedBox(height: 5.0),
//                         _buildDeductions(pro),
//                         const SizedBox(height: 10.0),
//                         _buildIncomeFromLetOutProperty(pro),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               _buildDoneButton(context, height, width),
//               SizedBox(height: height / 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLoanInput(ManualITRCalculation pro, String label,
//       TextEditingController controller, Function onChanged) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         const SizedBox(height: 4.0),
//         Row(
//           children: [
//             InputTaxt(
//               onChanged: (value) {
//                 onChanged();
//                 pro.salarytotal();
//                 pro.totalIncome();
//                 pro.SetNetamount();
//                 pro.setincome();
//               },
//               controller: controller,
//             ),
//             const Spacer(),
//             YearButton(onChanged2: (bool) {}),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildLetOutPropertyInput(ManualITRCalculation pro) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Income from Let-out Property',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//         const SizedBox(height: 10.0),
//         _buildLoanInput(
//             pro,
//             '1. Annual Letable Value / Rent Received or Receivable',
//             pro.AnnualRentReceivedTextControler,
//             pro.SetHousigLoanLetOutProperty),
//         _buildLoanInput(
//             pro,
//             '2. Less Municipal Taxes Paid During the year',
//             pro.MunicipalTaxesPaidTextControler,
//             pro.SetHousigLoanLetOutProperty),
//         _buildLoanInput(pro, '3. Less: Unrealized Rent',
//             pro.UnrealizedTextControler, pro.SetHousigLoanLetOutProperty),
//       ],
//     );
//   }

//   Widget _buildNetAnnualValue(ManualITRCalculation pro) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           '4. Net Annual value: ',
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Color.fromARGB(255, 0, 85, 212),
//               fontSize: 17),
//         ),
//         Text(
//           pro.TotalAnnualLetableValue.toString(),
//           style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Color.fromARGB(255, 0, 85, 212),
//               fontSize: 17),
//         ),
//       ],
//     );
//   }

//   Widget _buildDeductions(ManualITRCalculation pro) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 5.0),
//         const Text('Less Deductions from Net Annual Value',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//         const SizedBox(height: 5.0),
//         _buildLoanInput(
//             pro,
//             'Standard Deduction @30% of Net Annual Value',
//             pro.LessDeductionFromNetAnnualTextControler,
//             pro.SetHousigLoanLetOutProperty),
//         const SizedBox(height: 10.0),
//         const Text('! Interest on Housing Loan'),
//         _buildLoanInput(pro, '', pro.InterestHousingLoanTextControler,
//             pro.SetHousigLoanLetOutProperty),
//       ],
//     );
//   }

//   Widget _buildIncomeFromLetOutProperty(ManualITRCalculation pro) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 10.0),
//         const Text('! Income from Let-out House Property',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 0, 85, 212),
//                 fontSize: 17)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text('${pro.TotalLetOutHouseProperty}',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 0, 85, 212),
//                     fontSize: 17)),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildDoneButton(BuildContext context, double height, double width) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Container(
//           height: height / 20,
//           width: width / 5,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//             gradient:
//                 const LinearGradient(colors: [Color(0xff2457C5), Colors.white]),
//           ),
//           child: Center(
//             child: Text(
//               "Done",
//               style:
//                   TextStyle(fontWeight: FontWeight.bold, fontSize: height / 50),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
