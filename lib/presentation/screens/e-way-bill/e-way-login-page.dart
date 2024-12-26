import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/widgets/blue_button.dart';

class EWayLogin extends StatelessWidget {
  const EWayLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
        title: const Text(
          'Login eWay Bill User',
          style: TextStyle(color: whiteColor, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Follow below steps to register with your GST '),
                    Text("Suvidha Provider(GSP) on E-way Bill Portal"),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 228, 228),
                ),
                child: const Text(
                  'Step 1',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 12), // Spacing between icon and text
                        Flexible(
                          child: Text(
                            'Login to E-way Bill Portal : https://ewaybillgst.gov.in/',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            'Click on Registration in the left menu & select For GSP',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 12),
                        Flexible(
                          child: Text('Click Send OTP'),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            'Verify OTP',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 228, 228),
                ),
                child: const Text(
                  'Step 2',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            'Click the Add/New Button',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          'Select your GST Suvidha Provider (GSP) in the GSP Name dropdown',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          'Enter 3 letter Suffix ID and a password',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          'Re-enter the User Name & Password & Click ADD',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                                    BlueButton(title: 'Process to GSP Login', onPressed: () {}), 
                                    const SizedBox(height: 20),


                  ],
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
