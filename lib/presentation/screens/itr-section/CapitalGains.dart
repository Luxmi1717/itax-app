// import 'package:flutter/material.dart';
// import 'package:itax/presentation/screens/itr-section/widgets/input-taxt-widget.dart';
// import 'package:itax/providers/manually_itr_form16.dart';
// import 'package:provider/provider.dart';


// class CapitalGains extends StatefulWidget {
//   final String calculatorName;
//   const CapitalGains({super.key,required this.calculatorName});

//   @override
//   State<CapitalGains> createState() => _CapitalGainsState();
// }

// class _CapitalGainsState extends State<CapitalGains> {
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
//             child: CircleAvatar(backgroundColor: Colors.grey,child: Center(child: Icon(Icons.arrow_back,color: Colors.white,size: height/40)),),
//           ),
//         ),
//       ),
//       body:  Padding(
//         padding: EdgeInsets.symmetric(horizontal: width/20),
//         child: Column(
//           children: [
//             Text(widget.calculatorName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: height/40)),
//             SizedBox(height: height/40),
//             Consumer<ManualITRCalculation>(
//               builder: (BuildContext context, pro, child) {
//                 return  Container(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text('Short Term Capital Gain -Taxable at No'),
//                       const SizedBox(height: 4.0),
//                       Row(
//                         children: [
//                           InputTaxt(onChanged: (value) {
//                             pro.settotalCapital();
//                             pro.totalIncome();
//                             pro.SetNetamount();
//                             pro.setincome();
//                           },controller:pro.textshorCapital,),

//                           const SizedBox(width: 5,),

//                           const SizedBox(width: 5,),



//                         ],
//                       ),
//                       const SizedBox(height: 5.0),
//                       const Text('Long Term Captial Gain - Taxable @ 20%'),
//                       const SizedBox(height: 5.0),
//                       Row(
//                         children: [

//                           InputTaxt(onChanged: (value) {

//                             pro.settotalCapital();
//                             pro.totalIncome();
//                             pro.SetNetamount();
//                             pro.setincome();
//                           },controller:pro.longCapital ,),

//                           const SizedBox(width: 5,),

//                         ],
//                       ),
//                       const SizedBox(height: 5.0),
//                       const Text('Long Term Capital Gain - Taxable @ 10%'),
//                       const SizedBox(height: 5.0),
//                       Row(
//                         children: [

//                           InputTaxt(onChanged: (value) {

//                             pro.settotalCapital();
//                             pro.totalIncome();
//                             pro.SetNetamount();
//                             pro.setincome();
//                           },controller: pro.longCapital10Controller,),


//                           const SizedBox(width: 5,),

//                         ],
//                       ),
//                       const SizedBox(height: 5.0),
//                       const Text('Short Term Capital Gain -Taxable @ 15%'),
//                       const SizedBox(height: 5.0),
//                       Row(
//                         children: [
//                           InputTaxt(onChanged: (value) {

//                             pro.settotalCapital();
//                             pro.totalIncome();
//                             pro.SetNetamount();
//                             pro.setincome();
//                           },controller: pro.shortCapital15, ),


//                           const SizedBox(width: 5,),

//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             const Spacer(),
//             Align(
//               alignment: Alignment.centerRight,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   height: height/20,
//                   width: width/5,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset: const Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       gradient: const LinearGradient(colors: [
//                         Color(0xff2457C5),
//                         Colors.white
//                       ])
//                   ),
//                   child: Center(child: Text("Done",style: TextStyle(fontWeight: FontWeight.bold,fontSize: height/50),)),
//                 ),
//               ),
//             ),
//             SizedBox(height: height/20)
//           ],
//         ),
//       ),
//     );
//   }
// }
