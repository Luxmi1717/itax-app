
//import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:itax/presentation/older_widgets/widgets/back_button.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/providers/providers_old/itr_provider.dart';
import 'package:itax/providers/providers_old/manually_itr_form16.dart';

import 'package:provider/provider.dart';


import 'package:country_picker/country_picker.dart';

class ManuallyITRSection extends StatefulWidget {
  const ManuallyITRSection({super.key});

  @override
  State<ManuallyITRSection> createState() => _ManuallyITRSectionState();
}

class _ManuallyITRSectionState extends State<ManuallyITRSection> {
  TextEditingController text=TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController AssementYear = TextEditingController();
  TextEditingController financialYear = TextEditingController();
  TextEditingController CountryName = TextEditingController();

  String  _selectedCountry='Select Country *';
  String _selectCountryCode = '';

  final List<String> Gender = [
    'Select Gender',
    'Male',
    'Fimale',
    'other',

  ];

  final List<String> Status = [
    'Resdinatial Status',
    'R-Residant',
    'ROR',
    'NRI',

  ];
  final List<String>  EmployeStatus= [
    'SelectemployeStatus',
    'OTH',
    'PSU',
    'SGOVT',
    'CGOVT',
  ];
  String? SelectemployeStatus='SelectemployeStatus';





  @override
  void initState() {
    super.initState();

    // Get the provider instance
    final provider = Provider.of<ITRProvider>(context, listen: false);
    final isFY2023 = provider.financialYear == FinancialYear.fy2022_2023;

    final AyLabel = isFY2023 ? ' 2022-23' : ' 2023-24';
    final fyLabel= isFY2023?  ' ${2022-1}-${2023-1}':' ${2023-1}-${24-1}';


    // Set initial values in the text controllers
    provider.financialYear= provider.financialYear = isFY2023
        ? FinancialYear.fy2023_2024
        : FinancialYear.fy2022_2023;
    AssementYear.text=AyLabel;
    financialYear.text=fyLabel;
    selectedState = stateCodes[0];

  }

  StateSelection? selectedState;
  String? StateCode;

  List<StateSelection> stateCodes = [
    StateSelection('Select','State *'),
    StateSelection('35', 'Andaman and Nicobar Islands'),
    StateSelection('37', 'Andhra Pradesh'),
    StateSelection('12', 'Arunachal Pradesh'),
    StateSelection('18', 'Assam'),
    StateSelection('10', 'Bihar'),
    StateSelection('04', 'Chandigarh'),
    StateSelection('22', 'Chhattisgarh'),
    StateSelection('30', 'Dadra and Nagar Haveli and Daman and Diu'),
    StateSelection('07', 'Delhi'),
    StateSelection('30', 'Goa'),
    StateSelection('24', 'Gujarat'),
    StateSelection('06', 'Haryana'),
    StateSelection('02', 'Himachal Pradesh'),
    StateSelection('01', 'Jammu and Kashmir'),
    StateSelection('20', 'Jharkhand'),
    StateSelection('29', 'Karnataka'),
    StateSelection('32', 'Kerala'),
    StateSelection('32', 'Ladakh'),
    StateSelection('31', 'Lakshadweep'),
    StateSelection('23', 'Madhya Pradesh'),
    StateSelection('27', 'Maharashtra'),
    StateSelection('14', 'Manipur'),
    StateSelection('17', 'Meghalaya'),
    StateSelection('15', 'Mizoram'),
    StateSelection('13', 'Nagaland'),
    StateSelection('21', 'Odisha'),
    StateSelection('34', 'Puducherry'),
    StateSelection('03', 'Punjab'),
    StateSelection('08', 'Rajasthan'),
    StateSelection('11', 'Sikkim'),
    StateSelection('33', 'Tamil Nadu'),
    StateSelection('36', 'Telangana'),
    StateSelection('16', 'Tripura'),
    StateSelection('09', 'Uttar Pradesh'),
    StateSelection('05', 'Uttarakhand'),
    StateSelection('19', 'West Bengal'),
  ];





  String? SelectGender='Select Gender';


  String? SelectResidance='Resdinatial Status';
  @override
  Widget build(BuildContext context) {

    CountryName.text='$_selectCountryCode  $_selectedCountry'.toString();



    return Scaffold(
      appBar: AppBar(
        leading: const BlueBackButton(),
        backgroundColor: Theme
            .of(context)
            .colorScheme.surface,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Computation of Income',
          // style: Theme.of(context).textTheme.titleLarge,
        ),
      ),


      body: Consumer<itrManuallyProfileSection>(builder: (BuildContext context, pro, child){

        return Container(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              NewBlueTextField(
                hintText: 'Assessment year',
                onchanged: (value) {

                }, controller: AssementYear,



              ),

              const SizedBox(height: 16),
              NewBlueTextField(
                hintText: 'Financial Year',
                onchanged: (value ) {


                }, controller: financialYear,



              ),
              const SizedBox(height: 16),
              NewBlueTextField(
                hintText: 'Name',
                onchanged: (value ) {
                  pro.setName();

                }, controller: pro.nameController,
                errorcode: pro.isNamevalibation == false ? 'please enter a valid Middle Name' : null,



              ),
              const SizedBox(height: 16),

              NewBlueTextField(
                hintText: 'Middle Name',
                onchanged: (value ) {

                  pro.setMiddleName();

                }, controller: pro.MiddleNameController,
                errorcode: pro.isMiddleNamevalibation == false
                    ? 'please enter a valid Name'
                    : null,



              ),
              const SizedBox(height: 16),

              NewBlueTextField(
                hintText: 'Ser Name',
                onchanged: (value) {

                  pro.setSerName();

                }, controller: pro.SerNameController,
                errorcode: pro.isSerNamevalibation == false ? 'please enter a valid Name' : null,



              ),
              const SizedBox(height: 16),
              NewBlueTextField(
                hintText: 'Father Name',
                onchanged: (value ) {
                  pro.setFatherName();

                }, controller: pro.fatherNameController, errorcode: pro.isFathervalibation == false ? 'please enter a FatherName' : null,


              ),
              const SizedBox(height: 16),
              NewBlueTextField(
                controller: pro.dobController,

                hintText: 'Date of Birth',
                onchanged: (value ) {
                  pro.set_dateofbrith();

                },
                errorcode:pro.isdateofbrith==false? 'please enter in 2023-03-31 format':null,

              ),


              const SizedBox(height: 16),

              Container(
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

                child: ExpansionTile(

                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Fill all  Address  details',
                              style: TextStyle(fontWeight: FontWeight.bold)),

                        ],

                      ),

                    ],
                  ),


                  initiallyExpanded: false,
                  onExpansionChanged: (isExpanded) {
                    if (isExpanded) {
                    }
                  },
                  children: [



                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'Flat No *',
                            onchanged: (value) {



                            }, controller: pro.flatNoController,




                          ),
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'Buildding No',
                            onchanged: (value) {



                            }, controller: pro.BuilddingNoController,



                          ),
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'Building Name',
                            onchanged: (value) {



                            }, controller: pro.BuildingNameController,




                          ),
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'Street',
                            onchanged: (value) {



                            }, controller:pro.StreetController,



                          ),
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'Area *',
                            onchanged: (value) {



                            }, controller: pro.areaController,



                          ),
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'City *',
                            onchanged: (value) {



                            }, controller: pro.cityController,



                          ),
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'District',
                            onchanged: (value) {

                              pro.setSerName();
                              pro.setdistrict();

                            }, controller: pro.districtController,
                            errorcode:pro.isdistrict==false? 'please enter correct district':null,


                          ),
                          const SizedBox(height: 16),

                          Container(
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

                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                onTap:(){
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (country) {
                                      setState(() {
                                        _selectedCountry = country.name;
                                        _selectCountryCode=country.phoneCode;
                                      });
                                    },
                                  );


                                },

                                controller: CountryName,




                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
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


                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton<StateSelection>(
                                  value: selectedState,
                                  onChanged: (StateSelection? newValue) {
                                    setState(() {
                                      selectedState = newValue;
                                      StateCode=newValue!.code.toString();
                                    });
                                  },
                                  items: stateCodes.map<DropdownMenuItem<StateSelection>>((StateSelection value) {


                                    return DropdownMenuItem<StateSelection>(
                                      value: value,



                                      child: Text('${value.code} - ${value.name}'),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          NewBlueTextField(
                            hintText: 'PIN *',
                            onchanged: (value) {

                              pro.setSerName();
                              pro.setPincode();

                            }, controller: pro.PancodeController,

                            errorcode:pro.isPincode==false? 'please enter correct Pin':null,


                          ),
                          const SizedBox(height: 16),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
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

                child: ExpansionTile(

                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Fill all BankDetails',
                              style: TextStyle(fontWeight: FontWeight.bold)),

                        ],

                      ),

                    ],
                  ),


                  initiallyExpanded: false,
                  onExpansionChanged: (isExpanded) {
                    if (isExpanded) {
                    }
                  },
                  children: [



                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'IFSCCode',
                            onchanged: (value) {
                              pro.setIFSCCode();


                            }, controller: pro.IfscCodeController,


                            errorcode: pro.isIFSCCodevalibation == false
                                ? 'please enter a valid IFSCCode'
                                : null,


                          ),
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'BankName',
                            onchanged: (value) {
                              pro.setBankName();



                            }, controller: pro.BankNameController,

                            errorcode: pro.isBankNamevalibation == false
                                ? 'please enter a valid Name'
                                : null,

                          ),
                          const SizedBox(height: 16),
                          NewBlueTextField(
                            hintText: 'Bank account',
                            onchanged: (value ) {
                              pro.setbank();

                            }, controller: pro.bankAccountController,

                            errorcode: pro.isBankvalibation == false
                                ? 'please enter a valid bank'
                                : null,

                          ),
                          const SizedBox(height: 16),






                        ],
                      ),
                    ),
                  ],
                ),
              ),



              const SizedBox(height: 16),
              NewBlueTextField(
                hintText: 'Residance',
                onchanged: (value ) {
                  pro.setResidanceName();

                }, controller: pro.residenceController,
                errorcode: pro.isResidancevalibation == false
                    ? 'please enter a valid Residance'
                    : null,



              ),



              const SizedBox(height: 16),
              NewBlueTextField(
                hintText: 'PAN Number',
                onchanged: (value ) {
                  pro.setPANnumberName();

                }, controller: pro.panNumberController,
                errorcode: pro.isPanNumbervalibation == false
                    ? 'please enter a valid Pan Number'
                    : null,
              ),
              const SizedBox(height: 16),




              NewBlueTextField(
                hintText: 'Data of filling',
                onchanged: (value ) {
                  pro.setdata();

                }, controller: pro.dateOfFillingController,

                errorcode: pro.isdatavalibation == false
                    ? 'please enter a valid 2000-01-01'
                    : null,

              ),

              const SizedBox(height: 16),

              // SizedBox(
              //   height: 50,
              //   width: MediaQuery.of(context).size.width*0.6,
              //   child: CustomDropdownButton2(
              //     hint: 'Select',
              //     dropdownItems: Gender,
              //     value: SelectGender,
              //     onChanged: (value) {
              //       setState(() {
              //         SelectGender = value;
              //       });
              //     },
              //   ),
              // ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width*0.6,
                child: DropdownButton2(
                  hint: const Text('Select'),
                  //  dropdownItems: items,
                  value: SelectGender,
                  onChanged: (value) {
                    setState(() {
                      SelectGender = value;
                    });
                  },  items: Gender
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                    .toList(),
                ),
              ),
              const SizedBox(height: 16),
              // SizedBox(
              //   height: 50,
              //   width: MediaQuery.of(context).size.width*0.6,
              //   child: CustomDropdownButton2(
              //     hint: 'Select',
              //     dropdownItems: Status,
              //     value: SelectResidance,
              //     onChanged: (value) {
              //       setState(() {
              //         SelectResidance = value;
              //       });
              //     },
              //   ),
              // ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width*0.6,
                child: DropdownButton2(
                  hint: const Text('Select'),
                  //  dropdownItems: items,
                  value: SelectResidance,
                  onChanged: (value) {
                    setState(() {
                      SelectResidance = value;
                    });
                  },  items: Status
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                    .toList(),
                ),
              ),
              const SizedBox(height: 16),

              NewBlueTextField(
                hintText: 'phone Number',
                onchanged: (value) {

                  pro.setSerName();
                  pro.setphoneNumer();

                }, controller:pro.phoneNumberController ,

                errorcode: pro.isphoneNumer == false
                    ? 'please enter a valid phone Number'
                    : null,
              ),
              const SizedBox(height: 16),
              NewBlueTextField(
                hintText: 'Gmail',
                onchanged: (value)
                {
                  pro.setSerName();
                  pro.setgmail();
                }, controller: pro.gmailController,

                errorcode: pro.isgmail == false
                    ? 'please enter a valid gmail'
                    : null,
              ),

              const SizedBox(height: 16),
              NewBlueTextField(
                hintText: 'AdhaarCardNo',
                onchanged: (value){
                  pro.setAdharCard();
                }, controller: pro.adharCardController,
                errorcode: pro.isAdharCardvalibation == false? 'please enter a valid aadharCard' : null,
              ),


              const SizedBox(height: 16),
              // SizedBox(
              //   height: 50,
              //   width: MediaQuery.of(context).size.width*0.6,
              //   child: CustomDropdownButton2(
              //     hint: 'Select',
              //     dropdownItems:EmployeStatus,
              //     value: SelectemployeStatus,
              //     onChanged: (value) {
              //       setState(() {
              //         SelectemployeStatus = value;
              //       });
              //     },
              //   ),
              // ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width*0.6,
                child: DropdownButton2(
                  hint: const Text('Select'),
                  //  dropdownItems: items,
                  value: SelectemployeStatus,
                  onChanged: (value) {
                    setState(() {
                      SelectemployeStatus = value;
                    });
                  },  items: EmployeStatus
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                    .toList(),
                ),
              ),
              const SizedBox(height: 16),




              ElevatedButton(onPressed: (){
                pro.updateSelectGender(SelectGender.toString());
                pro.updateSelectResidence(SelectResidance.toString());
                pro.updatedataofbirth(dobController.text);
                pro.updateAssessmentYear(AssementYear.text);
                pro.updateFinancialYear(financialYear.text);
                pro.updateCountryCode(_selectCountryCode);
                pro.updateStateCode(StateCode.toString());
                pro.updateemployeStatus(SelectemployeStatus.toString());

              }, child: const Text('Save Profile')),


            ],
          ),

        );
      }),

    );
  }


}
class StateSelection {
  final String code;
  final String name;
  StateSelection(this.code, this.name);
}


