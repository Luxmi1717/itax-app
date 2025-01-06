import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/itr-section/BusinessandProfession.dart';
import 'package:itax/presentation/screens/itr-section/OtherSources.dart';
import 'package:itax/presentation/screens/itr-section/house_property_calculator.dart';
import 'package:itax/presentation/screens/itr-section/profile_sction_itr.dart';
import 'package:itax/presentation/screens/itr-section/selerry_less_sd.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/providers/manually_itr_form16.dart';

import 'package:provider/provider.dart';

import 'CapitalGains.dart';
import 'Examption_deduction_form.dart';
import 'TaxPayable.dart';
import 'jsondownload.dart';
import 'new_taxes_paid_section.dart';

class Manually_File extends StatefulWidget {
  const Manually_File({super.key});

  @override
  State<Manually_File> createState() => _Manually_FileState();
}

class _Manually_FileState extends State<Manually_File> {
  final _formKey = GlobalKey<FormState>();

  final bool _isExpanded = false;
  final bool _switchValue = true;
  bool status = false;

  final double _text = 0;
  final String _text1 = '';

  @override
  Widget build(BuildContext context) {
    final itrManualy = Provider.of<ManualITRCalculation>(context);
    final itrManualyProfile = Provider.of<itrManuallyProfileSection>(context);
    final itrManuallTaxPaid = Provider.of<ManuallyITRTaxPaid>(context);
    final itrTDSNonSalary = Provider.of<itrManuallyTDSNonSalary>(context);
    final itrTDSonSalary = Provider.of<itrManuallyTDSonSalary>(context);
    final itrTCSDetail = Provider.of<ItrManuallyTCSDetails>(context);
    int ? TatolTexPaid=itrManuallTaxPaid.totalAdvanceTax+itrTDSonSalary.totalamount+itrTDSNonSalary.totalamount+itrManuallTaxPaid.totalSelfAssessmentTax+itrTCSDetail.totalamount;
      int ? TaxReturn=itrManualy.tax.toInt()-TatolTexPaid;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Manually Fill ITR',
            // style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/40),
                  child: Column(
                      children: [
                        SizedBox(height: height/40),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ManuallyITRSection()));
                                },
                                child: Container(
                                  height: height/8,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        offset: const Offset(0, 2),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child:  Row(
                                    children:  [
                                      Image.asset("assets/images/Get Revenue.png",color: const Color(0xff666666)),
                                      SizedBox(width: width/45),
                                       Text(
                                        'Profile Saction',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: height/60,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width/30),
                            Consumer<ManualITRCalculation>(
                              builder: (BuildContext context, pro, child) {
                                return Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SelerryLess(calculatorName: "Salary Less SD & P Tax"),));
                                    },
                                    child: Container(
                                      height: height/8,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: const Offset(0, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child:  Row(
                                        children:  [
                                          Image.asset("assets/images/Love for Money.png"),
                                          SizedBox(width: width/45),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Salary Less SD & P Tax',
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height/60,
                                                  ),
                                                ),
                                                Text(pro.salary.toString(),
                                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: height/50),
                        Row(
                          children: [
                            Consumer<ManualITRCalculation>(
                              builder: (BuildContext context, pro, child) {
                                return Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HousePropertyScreen(calculatorName: "House Property Income from House Property")));
                                    },
                                    child: Container(
                                      // height: height/8,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: const Offset(0, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child:  Row(
                                        children:  [
                                          Image.asset("assets/images/Vector.png"),
                                          SizedBox(width: width/45),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'House Property Income from House Property',
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height/60,
                                                  ),
                                                ),
                                                pro.housingLoan!=0?Text(pro.housingLoan.toString(),
                                                    style: const TextStyle(fontWeight: FontWeight.bold)):Text(pro.TotalLetOutHouseProperty.toString(),
                                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: width/30),
                            Consumer<ManualITRCalculation>(
                              builder: (BuildContext context, pro, child) {
                                return Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CapitalGains(calculatorName: "Capital Gains")));
                                    },
                                    child: Container(
                                      height: height/8,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: const Offset(0, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child:  Row(
                                        children:  [
                                          Image.asset("assets/images/Money Bag Franc (1).png"),
                                          SizedBox(width: width/45),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Capital Gains',
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height/60,
                                                  ),
                                                ),
                                                Text(pro.totalcapital.toString(),
                                                    style: const TextStyle(fontWeight: FontWeight.bold))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: height/50),
                        Row(
                          children: [
                            Consumer<ManualITRCalculation>(
                              builder: (BuildContext context, pro, child) {
                                return Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OtherSources(calculatorName: "Other Sources")));
                                    },
                                    child: Container(
                                      height: height/8,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: const Offset(0, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child:  Row(
                                        children:  [
                                          Image.asset("assets/images/Caretaker.png"),
                                          SizedBox(width: width/45),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Other Sources",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height/60,
                                                  ),
                                                ),
                                                Text(pro.totalinterest.toString(),
                                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: width/30),
                            Consumer<ManualITRCalculation>(
                              builder: (BuildContext context, pro, child) {
                                return Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => const BusinessandProfession(calculatorName: "Business and Profession"),));
                                    },
                                    child: Container(
                                      height: height/8,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: const Offset(0, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child:  Row(
                                        children:  [
                                          Image.asset("assets/images/Earth Planet.png"),
                                          SizedBox(width: width/45),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Business and Profession',
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height/60,
                                                  ),
                                                ),
                                                Text(pro.totalBusiness.toString(),
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Container(
                          padding:  const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Income',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Consumer<ManualITRCalculation>(builder:(BuildContext context, pro, child) {
                                return  Text('₹${pro.TotalIncone}',
                                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17));
                              }),

                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Consumer<ManualITRCalculation>(
                              builder: (BuildContext context, pro, child) {
                                return Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExamptionDeduction()));
                                    },
                                    child: Container(
                                      height: height/8,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: const Offset(0, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child:  Row(
                                        children:  [
                                          Image.asset("assets/images/Prefab House.png"),
                                          SizedBox(width: width/45),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Exemption & Deductions',
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height/60,
                                                  ),
                                                ),
                                                Consumer<ManualITRCalculation>(builder:(BuildContext context, pro, child) {
                                                  return  Text('₹${pro.totalExaptionDeduction}',
                                                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17));
                                                }),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: width/30),
                            Consumer<ManualITRCalculation>(
                              builder: (BuildContext context, pro, child) {
                                return Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TaxPayable(calculatorName: "Tax Payable")));
                                    },
                                    child: Container(
                                      height: height/8,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: const Offset(0, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child:  Row(
                                        children:  [
                                          Image.asset("assets/images/Money Bag Franc (2).png"),
                                          SizedBox(width: width/45),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Tax Payable",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height/60,
                                                  ),
                                                ),
                                                Text(pro.totalinterest.toString(),
                                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Container(
                          padding:  const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Net Income',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Consumer<ManualITRCalculation>(builder:(BuildContext context, pro, child) {
                                return  Text('₹${pro.netamount}',
                                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17));
                              }),

                            ],
                          ),
                        ),
                        Consumer<ManualITRCalculation>(
                          builder: (BuildContext context, pro, child) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ItrTaxesPaid()));
                              },
                              child: Container(
                                height: height/8,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: const Offset(0, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child:  Row(
                                  children:  [
                                    Image.asset("assets/images/Duration Finance.png"),
                                    SizedBox(width: width/45),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Taxes Paid',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height/60,
                                            ),
                                          ),
                                          Text(TatolTexPaid.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: width/30),

                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [


                              Text(
                                TaxReturn>0?'Net Tax Payable':'Refund',
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(TaxReturn.abs().toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),


                                ],
                              ),


                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),

                        Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child) {
                          return BlueButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>const JsonDownloadButton()));
                            },
                            title: 'Download JSON',
                          );
                        },),
                        SizedBox(height: height/40),

                      ]
                  ),
                )
            ),


          ),

        )
    );
  }


}





