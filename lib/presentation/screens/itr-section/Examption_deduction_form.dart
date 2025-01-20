

// import 'package:flutter/material.dart';
// import 'package:itax/presentation/screens/itr-section/widgets/input-taxt-widget.dart';
// import 'package:itax/presentation/screens/itr-section/widgets/year-button-widget.dart';
// import 'package:itax/providers/form_16_calculation.dart';
// import 'package:itax/providers/manually_itr_form16.dart';
// import 'package:provider/provider.dart';



// class ExamptionDeduction extends StatefulWidget {
//   const ExamptionDeduction({super.key});

//   @override
//   State<ExamptionDeduction> createState() => _ExamptionDeductionState();
// }

// class _ExamptionDeductionState extends State<ExamptionDeduction> {


//   double Totalsalary=0.0;
//   double basicsalary=0.0 ;
//   double HRAsalary=0.0 ;
//   double Bounusalary=0.0 ;
//   double othersalary=0.0 ;
//   double total2salary=0.0;
//   double gainssalary=0.0;
//   double sourcesalary=0.0;
//   double FixedDeposits=0.0;
//   double Bankaccount=0.0;
//   double otherinterest=0.0;

//   bool _isExpanded = false;
//   final bool _switchValue = true;
//   bool status = false;







//   @override
//   Widget build(BuildContext context) {

//     print('hello');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Exemptions & Deductions'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {

//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80C ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.visible80C.toString(),
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),

//                         ],

//                       ),
//                       const Text('Life Incurance, PPF,EPF,ELSS,NPS ',
//                         style: TextStyle(),
//                       ),
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (isExpanded) {
//                     if (isExpanded) {


//                     }
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('Employee Provident Fund'),
//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               Row(
//                                 children: [
//                                   InputTaxt(onChanged: (value) {


//                                     pro.setTotaldC80();
//                                     pro.setVisibleC80();
//                                     pro.SetExemptionDeductions();
//                                     pro.SetNetamount();
//                                     pro.setincome();

//                                   },controller: pro.textEmployeeFund, ),
//                                   const SizedBox(width: 5,),
//                                   YearButton(onChanged2: (value) {
//                                     pro.providentFoundValue(value);
//                                   },)
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 4.0),
//                           const Text('Equity Linked Saving Scheme'),
//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (value) {


//                                 pro.setTotaldC80();
//                                 pro.setVisibleC80();
//                                 pro.SetExemptionDeductions();
//                                 pro.setincome();

//                               },controller: pro.textEquityScheme, ),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.SavingSchemeValue(value);
//                               },),
//                             ],
//                           ),
//                           const SizedBox(height: 4.0),
//                           const Text('Life Insurance'),
//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (value) {


//                                 pro.setTotaldC80();
//                                 pro.setVisibleC80();
//                                 pro.SetExemptionDeductions();
//                                 pro.setincome();
//                               },controller: pro.textLifeInsurance, ),
//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.lifeInuranceValue(value);
//                               },),


//                             ],
//                           ),
//                           const SizedBox(height: 4.0),
//                           const Text('Public Provident Fund'),
//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (value) {


//                                 pro.setTotaldC80();
//                                 pro.setVisibleC80();
//                                 pro.SetExemptionDeductions();
//                                 pro.setincome();
//                               },controller: pro.textProvidentFund, ),
//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.publicProvicentFundValue(value);
//                               },),


//                             ],
//                           ),
//                           const SizedBox(height: 4.0),
//                           const Text('Tuition Fees'),
//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (value) {


//                                 pro.setTotaldC80();
//                                 pro.setVisibleC80();
//                                 pro.SetExemptionDeductions();
//                                 pro.setincome();
//                               },controller: pro.texttuitionfees, ),
//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.tuitionFeesValue(value);
//                               },),


//                             ],
//                           ),
//                           const SizedBox(height: 4.0),
//                           const Text('Housing Loan Principal'),
//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (value) {


//                                 pro.setTotaldC80();
//                                 pro.setVisibleC80();
//                                 pro.SetExemptionDeductions();
//                                 pro.setincome();
//                               },controller: pro.textHousingLoan, ),
//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.HousingLoanPrincipalValue(value);
//                               },),
//                             ],
//                           ),
//                           const SizedBox(height: 4.0),
//                           const Text('National Pension Scheme'),
//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (value) {

//                                 pro.setTotaldC80();
//                                 pro.setVisibleC80();
//                                 pro.SetExemptionDeductions();
//                                 pro.setincome();
//                               },controller: pro.textNationalScheme, ),
//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.NationalPensionSchemeValue(value);
//                               },),
//                             ],
//                           ),
//                           const SizedBox(height: 4.0),
//                           const Text('Others'),
//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (value) {

//                                 pro.setTotaldC80();
//                                 pro.setVisibleC80();
//                                 pro.SetExemptionDeductions();
//                                 pro.setincome();
//                               },controller: pro.textother80C, ),
//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.OthersMValue(value);
//                               },),


//                             ],
//                           ),


//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               }),

//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [


//                           const Text('80DD',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.texDeduction.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Permanent physical disability',

//                       ),
//                     ],
//                   ),
//                   initiallyExpanded: false,

//                   onExpansionChanged: (isExpanded) {
//                     if (!isExpanded) {
//                     }
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           MyRadioList(),

//                           const SizedBox(height: 4.0),

//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text) {
//                                 pro.calculateTaxDeduction1();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               },controller:pro.amountSpent,
//                               ),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.more80moreValue(value);
//                               },),
//                             ],
//                           ),
//                         ],
//                       ),

//                     ),
//                   ],
//                 );
//               }),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [


//                           const Text('80DDB',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.deductionAmount.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Medical Treatment Expenses',

//                       ),


//                     ],
//                   ),


//                   initiallyExpanded: false,

//                   onExpansionChanged: (isExpanded) {
//                     if (!isExpanded) {


//                     }
//                   },


//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 4.0),

//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text) {
//                                 pro.set80DDB();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();


//                               },controller:pro.text80DDB,
//                               ),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.MedicalTreatmentExpensesValue(value);
//                               },),


//                             ],
//                           ),


//                         ],
//                       ),

//                     ),
//                   ],
//                 );
//               }),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80EE',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.section24.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Home Loan Shoud be taken in fin.year 2016-2017',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.setSection24();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.textSextion24B,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.InterestonHomeLoanValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80CCD(1B) ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.CCD80.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('National Pension sheme-add benefit',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.setCCD80();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80CCD1B,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.NationalPensionshemeaddbenefitValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),

//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80EEA ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.EEA80.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Interest on loan  for affordable Housing',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 10.0),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('0'),
//                               Text('₹1,50,000 to limit' )
//                             ],

//                           ),

//                           const SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.setEEA80();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80EEA,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.InterestonloanforaffordableHousingValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Food Coupons ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.FoodCoupons.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Food Coupons',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 8.0),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('0'),
//                               Text('₹26,400 to limit' )
//                             ],

//                           ),

//                           const SizedBox(height: 8.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.setFoodCoupons();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.textFoodCoupons,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.FoodCouponsValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80U ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.U80.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Deduction for Disabled Individuals',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 2.0),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('0'),
//                               Text('₹1,25,000 to limit' )
//                             ],

//                           ),

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set80u();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80u,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.DeductionforDisabledIndividualsValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80EEB ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.EEB80.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Interest on Loan for purchase of Electric vehical',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 2.0),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('0'),
//                               Text('₹1,50,000 to limit' )
//                             ],

//                           ),

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set80EEB();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80EEB,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value ) {
//                                 pro.InterestonLoanforpurchaseofElectricvehicalValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),

//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80E ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.E80.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Interest on Education Loan',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 2.0),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('0'),
//                               Text('Not  limit' )
//                             ],

//                           ),

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set80E();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80E,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.InterestonEducationLoanValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80G-Eligible Deduction 50%',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.g80.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Donations',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set80G();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80g,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.donationsValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80G-elg Deduction 100%',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.g100.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Donations',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set100G();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80g100,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.donations2Value(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),

//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80GGA',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.GGA100.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Donations for Scientific Research and Rural',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set80GGA();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80GGA,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.DonationsforScientificResearchandRuralValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),

//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80GGC',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.GGC100.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Contribution to Poiltical Parties',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set80GGC();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80GGC,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.ContributiontoPoilticalPartiesValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Other Examptions',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.OhterExp.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Other Examptions',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.setOtherExp();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.textOtherExp,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.OtherExamptionsValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               /*ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Eligible HRA Exemption',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text('₹$sourcesalary',
//                               style: TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       Text('House Rent Allowance Exemption',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 setState(() {
//                                   FixedDeposits =double.parse(text! ) ;

//                                   if(text!.length==1)
//                                   {
//                                     FixedDeposits=double.parse(text!)*0;
//                                   }
//                                 });
//                                 sourcesalary=FixedDeposits+Bankaccount+otherinterest;

//                               }, ),

//                               SizedBox(width: 5,),
//                               YearButton(onChanged2: (bool ) {  },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 ),*/
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80 TTA ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.TTA80.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Interest From Saving Accounts',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 2.0),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('0'),
//                               Text('₹10,000 to limit' )
//                             ],

//                           ),

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set80TTA();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();
//                                 pro.settotalInterest();

//                               }, controller: pro.interestAccount,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.TTAValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80 TTB',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.TTB80.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Interest From Deposite for senior citizen',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 2.0),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('0'),
//                               Text('₹50,000 to limit' )
//                             ],

//                           ),

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set80TTB();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80TTB,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.TTa80Value(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('80 CCD(2)',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.cCD80.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Employers Contribution to NPS',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.set80CCD();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.text80CCD,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.CCD80Value(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),
//               Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
//                 return ExpansionTile(
//                   backgroundColor: Colors.grey.shade200,
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Standard Deduction',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(pro.StardDeduction.toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold))
//                         ],
//                       ),
//                       const Text('Standard Deduction',

//                       )
//                     ],
//                   ),


//                   initiallyExpanded: false,
//                   onExpansionChanged: (value) {
//                     setState(() {
//                       _isExpanded = value;
//                     });
//                   },
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [

//                           const SizedBox(height: 5.0),
//                           Row(
//                             children: [
//                               InputTaxt(onChanged: (text ) {
//                                 pro.setStardDeduction();
//                                 pro.SetExemptionDeductions();
//                                 pro.SetNetamount();
//                                 pro.setincome();

//                               }, controller: pro.textStardDeduction,),

//                               const SizedBox(width: 5,),
//                               YearButton(onChanged2: (value) {
//                                 pro.StandardDeductionValue(value);
//                               },),


//                             ],
//                           ),




//                         ],
//                       ),

//                     ),
//                   ],
//                 );}),




//             ],
//           ),
//         ),

//       ),

//     );


//   }
//   Widget   MyRadioList(){
//     return
//       Consumer<From16Calculation>(builder: (BuildContext context, pro, child) {
//         return Column(
//           children: [
//             RadioListTile(
//               title: const Text("'40% or more but less than 80%"),
//               value: 40,
//               groupValue: pro.disabilityPercentage,
//               onChanged: (value) {


//                 pro.setdisbilityPercentag(double.parse(value.toString()));
//                 pro.calculateTaxDeduction1();


//               },
//             ),
//             RadioListTile(
//               title: const Text("80% or more"),
//               value: 80,
//               groupValue: pro.disabilityPercentage,
//               onChanged: (value) {


//                 pro.setdisbilityPercentag(double.parse(value.toString()));
//                 pro.calculateTaxDeduction1();




//               },
//             ),

//           ],
//         );
//       });
//   }
//   Widget   MyRadioList80DDB(){
//     return
//       Consumer<From16Calculation>(builder: (BuildContext context, pro, child) {
//         return Column(
//           children: [
//             RadioListTile(
//               title: const Text("'age for less than 60%"),
//               value: 60,
//               groupValue: pro.agepercent,
//               onChanged: (value) {


//                 pro.setagapercent(double.parse(value.toString()));
//                 pro.calculateTaxDeduction1();


//               },
//             ),
//             RadioListTile(
//               title: const Text("age more than 60%"),
//               value: 100,
//               groupValue: pro.agepercent,
//               onChanged: (value) {


//                 pro.setagapercent(double.parse(value.toString()));
//                 pro.calculateTaxDeduction1();




//               },
//             ),

//           ],
//         );
//       });
//   }



//   Widget   MyRadioList2(){
//     return
//       Consumer<From16Calculation>(builder: (BuildContext context, pro, child) {
//         return Column(
//           children: [
//             RadioListTile(
//               title: const Text("Severe"),
//               value: 1,
//               groupValue: pro.selectvalue,
//               onChanged: (value) {

//                 setState(() {
//                   pro.setSelected(value!);
//                   pro.setTotalu80();
//                   pro.setincome();
//                 });



//               },
//             ),
//             RadioListTile(
//               title: const Text("Normal"),
//               value: 2,
//               groupValue: pro.selectvalue,
//               onChanged: (value) {
//                 setState(() {
//                   pro.setSelected(value!);
//                   pro.setTotalu80();
//                   pro.setincome();
//                 });



//               },
//             ),
//             RadioListTile(
//               title: const Text("None"),
//               value: 3,
//               groupValue: pro.selectvalue,
//               onChanged: (value) {
//                 setState(() {

//                   pro.setSelected(value!);
//                   pro.setTotalu80();
//                   pro.setincome();
//                 });
//               },
//             ),
//           ],
//         );
//       });
//   }


// }
