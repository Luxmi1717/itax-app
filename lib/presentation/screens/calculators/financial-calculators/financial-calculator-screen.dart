import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/presentation/widgets/blue_button.dart';




class FinancialCalculator extends StatefulWidget {
  const FinancialCalculator({super.key});

  @override
  State<FinancialCalculator> createState() => _FinancialCalculatorState();
}

class _FinancialCalculatorState extends State<FinancialCalculator> {
  List<String> year = [
    "Bank Calulator",
    ""
        "Simple Intrest Calculator",
    "Compound Intrest Calculator"
  ];
  List<String> Income = [
    "Income Taxt Calculation",
    ""
        "HRA Calculator",
    "Capital Gain",
  ];
  List<String> GST = [
    "GST Calculator",
    "GST Calc",
  ];
  List<String> Loan = [
    "Loan Calculators",
    "Loan Against Property",
    "Business Loan Cal",
    "Car Loan Cal",
    'Personal Loan Cal',
    'Home Loan cal'
  ];

  List<String> Invest = [
    "Investment Calculation",
    "Post office Mis",
    "CAGR Calculator",
    "RD calculator",
    "FD Calculator",
    'Lump Sum Calculator',
    'Sip Calculator'
  ];
  List<String> lnsurance = ["NPS",];

  String selectvalue = 'Bank Calulator';
  String selectvalue1 = 'Income Taxt Calculation';
  String selectvalue2 = 'GST Calculator';
  String selectvalue3 = 'Loan Calculators';
  String selectvalue4 = 'NPS';
  String selectvalue5 = 'Investment Calculation';
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Financial Calculator'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 50,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.blue[600],
                      ),
                      elevation: 30,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      value: selectvalue,
                      items: year.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (country) {
                        setState(() {
                          selectvalue = country!;
                          switch (country) {
                            case 'Simple Intrest Calculator':
                           //   navProvider.navigate('/simple_intrest');
                            context.push('/calculate/PersonalLoanCal/SimpleIntrest');
                              break;
                              case 'Compound Intrest Calculator':
                            //  navProvider.navigate('/compound_intrest');
                              context.push('/calculate/PersonalLoanCal/CompoundIntrest');
                              break;
                              default:
                              break;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 50,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 0, 85, 212),
                      ),
                      elevation: 30,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      value: selectvalue1,
                      items: Income.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (country) {
                        setState(() {
                          selectvalue1 = country!;
                          switch (country) {
                            case 'HRA Calculator':
                             // navProvider.navigate('/hrp_calc');
                            context.push('/calculate/hra');
                              break;
                            case 'Capital Gain':
                             // navProvider.navigate('/capital_calc');
                              context.push('/calculate/PersonalLoanCal/CapitalGain');
                              break;

                            default:
                              break;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(padding: const EdgeInsets.only(left: 15),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 50,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color:Color.fromARGB(255, 0, 85, 212),
                      ),
                      elevation: 30,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      value: selectvalue2,
                      items: GST.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (country) {
                        setState(() {
                          selectvalue2 = country!;
                          switch (country) {
                            case 'GST Calc':
                             // navProvider.navigate('/gst_calc');
                              context.push('/calculate/PersonalLoanCal/GSTCalc');
                              break;

                            default:
                              break;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 50,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 33, 150, 243),
                      ),
                      elevation: 30,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      value: selectvalue3,
                      items: Loan.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (country) {
                        setState(() {
                          selectvalue3 = country!;
                          switch (country) {
                            case 'Loan Against Property':
                             // navProvider.navigate('/pb_calc');
                            context.push('/calculate/PersonalLoanCal/PropertyBusinessCalc');
                            break;
                            case 'Business Loan Cal':
                              //navProvider.navigate('/bl_calc');
                            context.push('/calculate/PersonalLoanCal/BusinessLoanCalc');
                            break;
                            case 'Car Loan Cal':
                             // navProvider.navigate('/cl_calc');
                            context.push('/calculate/PersonalLoanCal/CarLaonCal');
                            break;
                            case 'Personal Loan Cal':
                             // navProvider.navigate('/pl_calc');
                            context.push('/calculate/PersonalLoanCal/PersonalLoanCal');
                            break;
                            case 'Home Loan cal':
                             // navProvider.navigate('/home_calc');
                            context.push('/calculate/PersonalLoanCal/HomeLoan');
                            break;

                            default:
                              break;
                          }
                        });
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 50,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 33, 150, 243),
                      ),
                      elevation: 30,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      value: selectvalue5,
                      items: Invest.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (country) {
                        setState(() {
                          selectvalue5 = country!;
                          switch (country) {
                            case 'Post office Mis':
                            // navProvider.navigate('/pb_calc');
                              context.push('/calculate/PersonalLoanCal/PostOfficeMissCalculator');
                              break;
                            case 'CAGR Calculator':
                            //navProvider.navigate('/bl_calc');
                              context.push('/calculate/PersonalLoanCal/CagrCalulator');
                              break;
                            case 'RD calculator':
                            // navProvider.navigate('/cl_calc');
                              context.push('/calculate/PersonalLoanCal/RDCalculator');
                              break;
                            case 'FD Calculator':
                            // navProvider.navigate('/pl_calc');
                              context.push('/calculate/PersonalLoanCal/FDCalculator');
                              break;
                            case 'Lump Sum Calculator':
                            // navProvider.navigate('/home_calc');
                              context.push('/calculate/PersonalLoanCal/LumpSumCalculator');
                              break;
                            case 'Sip Calculator':
                            // navProvider.navigate('/home_calc');
                              context.push('/calculate/PersonalLoanCal/SipCalculator');
                              break;

                            default:
                              break;
                          }
                        });
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 50,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 0, 85, 212),
                      ),
                      elevation: 30,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      value: selectvalue4,
                      items: lnsurance.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (country) {
                        setState(() {
                          selectvalue4 = country!;
                          switch (country) {
                            case 'NPS':
                             // navProvider.navigate('/nps_calc');
                              context.push('/calculate/PersonalLoanCal/NPScalc');
                              break;
                              default:
                              break;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // PrimaryButton(
                  //   onTap: () {},
                  //   child: const Center(
                  //       child: Text(
                  //     'Download Details Calculator(PDF)',
                  //     style: TextStyle(color: Colors.white),
                  //   )),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
