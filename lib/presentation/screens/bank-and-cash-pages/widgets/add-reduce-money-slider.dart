import 'package:flutter/material.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';
import 'package:itax/presentation/widgets/date_picker_widget.dart';

class AddReduceMoneySlider extends StatefulWidget {
  @override
  _AddReduceMoneySliderState createState() => _AddReduceMoneySliderState();
}

class _AddReduceMoneySliderState extends State<AddReduceMoneySlider> {
  String _selectedOption = 'Add Money';

  @override
  Widget build(BuildContext context) {
    final TextEditingController _amountController = TextEditingController();
    final TextEditingController _payForController = TextEditingController();
    final TextEditingController _amount2Controller = TextEditingController();
    final TextEditingController _remarkController = TextEditingController();
    final TextEditingController _dateController = TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add or Reduce Money',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Radio<String>(
                  value: 'Add Money',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                Text('Add Money'),
                Radio<String>(
                  value: 'Reduce Money',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                Text('Reduce Money'),
              ],
            ),
            SizedBox(height: 16),
            CustomTextInput(
              controller: _amountController,
              hintText: 'Select Amount',
              ifPasswordField: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CustomTextInput(
              controller: _payForController,
              hintText: 'Select Amount',
              ifPasswordField: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextInput(
                    controller: _amount2Controller,
                    hintText: 'Select Amount',
                    ifPasswordField: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter amount';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 8), // Added spacing between the inputs
                Expanded(
                  child: DateFieldPicker(
                    controller: _dateController,
                    hintText: 'Select Dates',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomTextInput(
              controller: _remarkController,
              hintText: 'Select Amount',
              ifPasswordField: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            BlueButton(
              title: 'Save',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
