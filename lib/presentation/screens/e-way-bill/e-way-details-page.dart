import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/e-way-bill/slider-widgets/e-way-bill-success-slider.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';
import 'package:itax/presentation/widgets/date_picker_widget.dart';
import 'package:itax/presentation/widgets/search_feild_widget.dart';

class EWayDetailsPage extends StatefulWidget {
  const EWayDetailsPage({super.key});

  @override
  _EWayDetailsPageState createState() => _EWayDetailsPageState();
}

class _EWayDetailsPageState extends State<EWayDetailsPage> {
  int _selectedOption = 0;
  final TextEditingController documentTypeSearchController =
      TextEditingController();
  final TextEditingController subSupplySearchController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController transporterNameController =
      TextEditingController();
  final TextEditingController modeController = TextEditingController();

  void _showModeOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Select Mode', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
               SizedBox(height: 12.h),
              ListTile(
                title: const Text('Road'),
                onTap: () {
                  setState(() {
                    modeController.text = 'Road';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Rail'),
                onTap: () {
                  setState(() {
                    modeController.text = 'Rail';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Air'),
                onTap: () {
                  setState(() {
                    modeController.text = 'Air';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Ship or Ship Cum Road/Rail'),
                onTap: () {
                  setState(() {
                    modeController.text = 'Ship or Ship Cum Road/Rail';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        title: const Text(
          'E-Way Bill Details',
          style: TextStyle(color: whiteColor, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Radio Button Section
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    const Text('Supply Type'),
                    const SizedBox(width: 16.0),
                    Radio(
                      value: 0,
                      groupValue: _selectedOption,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                    const Text('Outward'),
                    const SizedBox(width: 12.0),
                    Radio(
                      value: 1,
                      groupValue: _selectedOption,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                    const Text('Inward'),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              // Date and Search Fields Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DateFieldPicker(
                      controller: dateController,
                      hintText: 'Enter Date',
                    ),
                    const SizedBox(height: 16.0),
                    SearchField(
                      controller: subSupplySearchController,
                      hintText: 'Sub Supply Type',
                    ),
                    const SizedBox(height: 16.0),
                    SearchField(
                      controller: documentTypeSearchController,
                      hintText: 'Document Type',
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              // Transporter Details Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.add_circle, color: Colors.black),
                        SizedBox(width: 8.0),
                        Text(
                          'Transporter Details',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    CustomTextInput(
                      controller: transporterNameController,
                      hintText: 'Transporter Name',
                      ifPasswordField: false,
                      validator: (value) => null,
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextInput(
                      controller: transporterNameController,
                      hintText: 'Transporter ID',
                      ifPasswordField: false,
                      validator: (value) => null,
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              // Part B Details Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.add_circle, color: Colors.black),
                        SizedBox(width: 8.0),
                        Text(
                          'Part B Details',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    GestureDetector(
                      onTap: _showModeOptions,
                      child: AbsorbPointer(
                        child: CustomTextInput(
                          controller: modeController,
                          hintText: 'Mode',
                          ifPasswordField: false,
                          validator: (value) => null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomTextInput(
                            controller: transporterNameController,
                            hintText: 'Doc Number',
                            ifPasswordField: false,
                            validator: (value) => null,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          flex: 1,
                          child: DateFieldPicker(
                            controller: dateController,
                            hintText: 'Select Date',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlueButton(
                title: 'Generate eWay Bill',
                onPressed: () {
                  openBottomSheet(context, EwayBillSuccessSlider());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void openBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        child: content,
      );
    },
  );
}
