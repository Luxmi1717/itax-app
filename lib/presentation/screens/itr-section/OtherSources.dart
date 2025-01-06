import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/itr-section/widgets/input-taxt-widget.dart';
import 'package:itax/presentation/screens/itr-section/widgets/year-button-widget.dart';
import 'package:provider/provider.dart';

import '../../../providers/manually_itr_form16.dart';


class OtherSources extends StatefulWidget {
  final String calculatorName;
  const OtherSources({super.key, required this.calculatorName});

  @override
  State<OtherSources> createState() => _OtherSourcesState();
}

class _OtherSourcesState extends State<OtherSources> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: height / 40,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: Column(
          children: [
            Text(
              widget.calculatorName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: height / 40,
              ),
            ),
            SizedBox(height: height / 40),
            Consumer<ManualITRCalculation>(
              builder: (BuildContext context, pro, child) {
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Interest from Fixed Deposits'),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.4,
                            child: InputTaxt(
                              onChanged: (value) {
                                pro.settotalInterest();
                                pro.totalIncome();
                                pro.SetNetamount();
                                pro.setincome();
                              },
                              controller: pro.interestDeposit,
                            ),
                          ),
 const Spacer(),
                           YearButton(onChanged2: (value) {}),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      const Text('Interest from Saving Bank Account'),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.4 ,
                            child: InputTaxt(
                              onChanged: (value) {
                                pro.set80TTA();
                                pro.SetExemptionDeductions();
                                pro.settotalInterest();
                                pro.totalIncome();
                                pro.SetNetamount();
                                pro.setincome();
                              },
                              controller: pro.interestAccount,
                            ),
                          ),
                          const Spacer(),
                          YearButton(onChanged2: (value) {}),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      const Text('Other Source'),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.4,
                            child: InputTaxt(
                              onChanged: (value) {
                                pro.settotalInterest();
                                pro.totalIncome();
                                pro.SetNetamount();
                                pro.setincome();
                              },
                              controller: pro.otherSource,
                            ),
                          ),
                           const Spacer(),
                          YearButton(onChanged2: (value) {}),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: height / 20,
                  width: width / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    gradient: const LinearGradient(
                      colors: [Color(0xff2457C5), Colors.white],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height / 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 20),
          ],
        ),
      ),
    );
  }
}
