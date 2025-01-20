// import 'package:flutter/material.dart';
// import 'package:itax/presentation/screens/itr-section/widgets/input-taxt-widget.dart';
// import 'package:itax/providers/manually_itr_form16.dart';
// import 'package:provider/provider.dart';


// class TaxPayable extends StatefulWidget {
//   final String calculatorName;
//   const TaxPayable({super.key,required this.calculatorName});

//   @override
//   State<TaxPayable> createState() => _TaxPayableState();
// }

// class _TaxPayableState extends State<TaxPayable> {
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
//                 return   Container(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text('234A :- Delay in Fill in the return of income'),
//                       const SizedBox(height: 4.0),
//                       Row(
//                         children: [
//                           Row(
//                             children: [

//                               InputTaxt(onChanged: (value) {


//                               },controller: pro.business,),

//                               const SizedBox(width: 5,)
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4.0),
//                       const Text('234B :- Dalay in advance tax'),
//                       const SizedBox(height: 4.0),
//                       Row(
//                         children: [

//                           InputTaxt(onChanged: (value) {



//                           },controller: pro.profession,),

//                           const SizedBox(width: 5,),


//                         ],
//                       ),
//                       const SizedBox(height: 4.0),
//                       const Text('234C :- interest on tax'),
//                       const SizedBox(height: 4.0),
//                       Row(
//                         children: [

//                           InputTaxt(onChanged: (value) {



//                           },controller: pro.profession,),

//                           const SizedBox(width: 5,),


//                         ],
//                       ),
//                       const SizedBox(height: 4.0),
//                       const Text('234F :- Penalty late filling'),
//                       const SizedBox(height: 4.0),
//                       Row(
//                         children: [

//                           InputTaxt(onChanged: (value) {



//                           },controller: pro.profession,),

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
