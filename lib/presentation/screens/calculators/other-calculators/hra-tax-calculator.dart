import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/text-decoration-widget.dart';
import 'package:itax/presentation/widgets/blue_button.dart';


class HRPCalc extends StatefulWidget {
  const HRPCalc({super.key});

  @override
  State<HRPCalc> createState() => _HRATaxCalculatorState();
}

class _HRATaxCalculatorState extends State<HRPCalc> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController actualHRAController = TextEditingController();
  TextEditingController rentPaidController = TextEditingController();
  TextEditingController basicSalaryController = TextEditingController();

  bool isMetroCity = false;
  String exemptedHRA = "0";
  String taxableHRA = "0";

  void calculateHRA(String hra, String rent, String salary) {
    if (_formKey.currentState!.validate()) {
      double actualHRA = double.parse(hra);
      double rentPaid = double.parse(rent);
      double basicSalary = double.parse(salary);

      // Calculate 50% of basic salary for metro cities or 40% for non-metro cities
      double cityPercentage = isMetroCity ? 0.50 : 0.40;
      double salaryPercentage = basicSalary * cityPercentage;

      // Calculate Rent Paid - 10% of Basic Salary
      double rentExcess = rentPaid - (0.10 * basicSalary);

      // Determine exempted HRA
      double exempted = actualHRA;
      exempted = exempted > salaryPercentage ? salaryPercentage : exempted;
      exempted = exempted > rentExcess ? rentExcess : exempted;

      // Taxable HRA
      double taxable = actualHRA - exempted;

      setState(() {
        exemptedHRA = exempted.toStringAsFixed(2);
        taxableHRA = taxable.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('HRA Tax Calculator'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const textdecoration(text: 'Actual HRA Received'),
              const SizedBox(height: 15),
              BlueTextField(
                controller: actualHRAController,
                initialValue: actualHRAController.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter Actual HRA Received';
                },
                hintText: 'Enter Actual HRA',
              ),
              const SizedBox(height: 15),
              const textdecoration(text: 'Rent Paid'),
              const SizedBox(height: 15),
              BlueTextField(
                controller: rentPaidController,
                initialValue: rentPaidController.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter Rent Paid';
                },
                hintText: 'Enter Rent Paid',
              ),
              const SizedBox(height: 15),
              const textdecoration(text: 'Basic Salary'),
              const SizedBox(height: 15),
              BlueTextField(
                controller: basicSalaryController,
                initialValue: basicSalaryController.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter Basic Salary';
                },
                hintText: 'Enter Basic Salary',
              ),
              const SizedBox(height: 15),
              const textdecoration(text: 'City of Residence'),
              const SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(
                    value: isMetroCity,
                    onChanged: (value) {
                      setState(() {
                        isMetroCity = value!;
                      });
                    },
                  ),
                  const Text(
                    'Metro City (Delhi, Mumbai, Chennai,\n Kolkata)',
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              BlueButton(
                onPressed: () {
                  calculateHRA(
                    actualHRAController.text,
                    rentPaidController.text,
                    basicSalaryController.text,
                  );
                },
                title: 'Calculate',
              ),
              const SizedBox(height: 25),
              const textdecoration(text: 'Results'),
              const SizedBox(height: 15),
              Card(
                color: Colors.blue[50],
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Actual HRA Received: ₹${actualHRAController.text}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(
                        '${isMetroCity ? '50%' : '40%'} of Basic Salary: ₹${(double.tryParse(basicSalaryController.text) ?? 0) * (isMetroCity ? 0.50 : 0.40)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Rent Paid - 10% of Basic Salary: ₹${(double.tryParse(rentPaidController.text) ?? 0) - (0.10 * (double.tryParse(basicSalaryController.text) ?? 0))}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Amount of Exempted HRA: ₹$exemptedHRA',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'HRA Chargeable to Tax: ₹$taxableHRA',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
