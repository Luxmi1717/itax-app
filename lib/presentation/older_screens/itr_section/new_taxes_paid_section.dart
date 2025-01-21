import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:itax/models/itr_taxpaid_model.dart';
import 'package:itax/presentation/older_widgets/widgets/back_button.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/providers/providers_old/itr_provider%20copy.dart';
import 'package:itax/providers/providers_old/manually_itr_form16.dart';
import 'package:itax/utility/tax_calculators.dart';
import 'package:provider/provider.dart';



class ItrTaxesPaid extends StatefulWidget
{
  const ItrTaxesPaid({super.key});

  @override
  State<ItrTaxesPaid> createState() => _ItrTaxesPaidState();
}

class _ItrTaxesPaidState extends State<ItrTaxesPaid>with SingleTickerProviderStateMixin
{


  final _formKey = GlobalKey<FormState>();

  late final TabController _tabController;
  String financialYear = 'FY 2023-2024';
  AgeCategory age = AgeCategory.below60;

  IncomeTaxCalcResult? incomeTaxCalcResult;

  final List<String> TCSDetaia = [
    'Section(2)',
    '194',
    '194A',
    '194C',
    '194ND',

  ];

  final List<String> items = [
    'Section(2)',
    '194',
    '194A',
    '194C',
    '194ND',

  ];
  final List<String> NonSalaryHeadofIncome = [
    'Head of income',
    'Bussiness',
    'Other Source',
    'Cepital Gain',
    'Exempt Income',
    '194 N',
  ];
  String? selectedValue='Section(2)';
  String? selectedTcsValue='Section(2)';
  String? NonSalary='Head of income';


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final fyYear =
          Provider.of<ITRProvider>(context, listen: false).financialYear;

      setState(() {
        financialYear = fyYear == FinancialYear
            ? 'FY 2023-2024'
            : 'FY 2024-2025';
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    final width = size.width;
    final height = size.height;


    return Scaffold(

      appBar: AppBar(
        leading: const BlueBackButton(),
        backgroundColor: Theme
            .of(context)
            .colorScheme.surface,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Income Tax Calculator',
          // style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.blue,
              tabs: const [
                Tab(
                  child: Text('Advance & Assessment Tax'),
                ),
                //Tab(
                //child: Text('TDS Details'),
                //),

                Tab(
                  child: Text('TCS Details'),
                ),
                Tab(
                  child: Text('TDS  Non Salary'),
                ),
                Tab(
                  child: Text('TDS on Salary'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Flexible(
                child: TabBarView(
                  controller: _tabController,
                  children: [

                    buildAdvanceAssessmentSection(context),
                    // buildTDSDetailsSection(context),
                    buildTCSDetailsSection(context),
                    buildNonSalarySection(context),
                    buildSalarySection(context),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildAdvanceAssessmentSection(BuildContext context) {

    return Consumer<ManuallyITRTaxPaid>(builder: (BuildContext context, pro, child)
    {
      List<Map<String, String>> taxPaidRecords = pro.taxPaidRecords;
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [

          NewBlueTextField(
            controller: pro.textBSRcode,


            hintText: 'Enter BSRCode',
            onchanged: (value ) {
              pro.setbsrCode();



            },
            errorcode: pro.isBSRCodeValid == false
                ? 'please enter a valid BSRCode' : null,




          ),
          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.textBankName,

            hintText: 'Bank Name',
            onchanged: (value ) {
              pro.setbankName();



            },
            errorcode:pro.isBankNamevalibation==false? 'please enter in Name':null,



          ),
          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.textDate,

            hintText: 'Date',
            onchanged: (value ) {
              pro.setdata();

            },
            errorcode:pro.isdatavalibation==false? 'please enter in 21/11/2000 format':null,

          ),
          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.textChallanSr,

            hintText: 'Challan Sr.No',
            onchanged: (value ) {
              pro.setchallanNo();


            },
            errorcode:pro.isCallanNovalibation==false? 'please enter valid challan':null,
            keyboardType: TextInputType.number,

          ),
          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.texttax,

            hintText: 'Tax',
            keyboardType: TextInputType.number,

          ),



          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              pro.addRecord(Model_of_record_details(bsrcode: pro.textBSRcode.text, bankName: pro.textBankName.text, data: pro.textDate.text, tax: pro.texttax.text, challanSr: pro.textChallanSr.text));

            },

            child: const Text('Add Field'),
          ),


          const SizedBox(height: 16),


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 20,
              headingRowColor: WidgetStateColor.resolveWith((states) => const Color.fromARGB(255, 0, 85, 212)),
              columns: const [
                DataColumn(label: Text('BSRCode ',style: TextStyle(color: Colors.white),)),
                DataColumn(label: Text('BankName',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Date',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('CallanSr.No',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Tax',style: TextStyle(color: Colors.white))),


                // DataColumn(label: Text('Add invoice')),
              ],
              rows: pro.dataList.map((data) => DataRow(
                onSelectChanged: (value){

                },
                cells: [
                  DataCell(Text(data.bsrcode.toString())),
                  DataCell(Text(data.bankName.toString())),

                  DataCell(Text(data.data.toString())),
                  DataCell(Text(data.challanSr.toString())),
                  DataCell(Text(data.tax.toString())),
                ],
              )).toList(),),
          ),




        ],

      );



    });
  }


  /*Widget buildTDSDetailsSection(BuildContext context) {
    return Consumer<ManualITRCalculation>(builder: (BuildContext context, pro, child)
    {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Container(
            height: 50,
            width: MediaQuery.of(context).size.width*0.6,
            child: CustomDropdownButton2(
              hint: 'Select',
              dropdownItems: items,
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller: pro.TDSTanNumber,
            hintText: 'Enter Tan Number',
          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller: pro.TDSEmployer,
            hintText: 'Name of Employer',
          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller: pro.TDSIncomeChargeable,
            hintText: 'Income chargeable under the head salaries',
          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller: pro.TDSTotalTaxdeducted,
            hintText: 'Total Tax deducted ',
          ),


        ],
      );
    });
  }*/
  Widget buildTCSDetailsSection(BuildContext context) {
    return Consumer<ItrManuallyTCSDetails>(builder: (BuildContext context, pro, child)
    {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // SizedBox(
          //   height: 50,
          //   width: MediaQuery.of(context).size.width*0.6,
          //   child: CustomDropdownButton2(
          //     hint: 'Select',
          //     dropdownItems: items,
          //     value: selectedTcsValue,
          //     onChanged: (value) {
          //       setState(() {
          //         selectedTcsValue = value;
          //       });
          //     },
          //   ),
          // ),
          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.TCSTanNumber,
            hintText: 'Enter Tan Number',

            onchanged: (value ) {
              pro.setTanNumber();

            },
            errorcode:pro.isTanNumbervalibation==false? 'please enter valid Tan Number':null,
          ),
          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.TCSDeducted,
            hintText: 'Name of Deducted',

            onchanged: (value ) {
              pro.setDeducted();

            },
            errorcode:pro.isDeductedvalibation==false? 'please enter valid Deducted':null,
          ),
          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.TCSPurchesesAssets,
            hintText: 'Purcheses of assets',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.TCSTaxDeducted,
            hintText: 'Total Tax deducted ',

            keyboardType: TextInputType.number,

          ),
          ElevatedButton(
            onPressed: () {
              pro.addRecord(TCSDetails_record_details(selectedValue: selectedTcsValue.toString(), tanNumber: pro.TCSTanNumber.text, deducted: pro.TCSTaxDeducted.text, purchasesOfAssets: pro.TCSPurchesesAssets.text, totalTaxDeducted: pro.TCSTaxDeducted.text));

            },

            child: const Text('Add Field'),
          ),


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 20,
              headingRowColor: WidgetStateColor.resolveWith((states) => const Color.fromARGB(255, 0, 85, 212)),
              columns: const [
                DataColumn(label: Text('Select value ',style: TextStyle(color: Colors.white),)),
                DataColumn(label: Text('TanNumber',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Name of Deducted',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Purcheses of asserts',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('total tax',style: TextStyle(color: Colors.white))),


                // DataColumn(label: Text('Add invoice')),
              ],
              rows: pro.dataList.map((data) => DataRow(
                onSelectChanged: (value){

                },
                cells: [
                  DataCell(Text(data.selectedValue.toString())),
                  DataCell(Text(data.tanNumber.toString())),

                  DataCell(Text(data.deducted.toString())),
                  DataCell(Text(data.purchasesOfAssets.toString())),
                  DataCell(Text(data.totalTaxDeducted.toString())),
                ],
              )).toList(),),
          ),


        ],
      );
    });
  }

  Widget buildNonSalarySection(BuildContext context) {
    return Consumer<itrManuallyTDSNonSalary>(builder: (BuildContext context, pro, child)
    {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // SizedBox(
          //   height: 50,
          //
          //   width: MediaQuery.of(context).size.width*0.6,
          //   child: CustomDropdownButton2(
          //     hint: 'Select',
          //     dropdownItems: NonSalaryHeadofIncome,
          //     value:NonSalary,
          //     onChanged: (value) {
          //       setState(() {
          //         NonSalary = value;
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
              value: NonSalary,
              onChanged: (value) {
                setState(() {
                  NonSalary = value;
                });
              },  items: NonSalaryHeadofIncome
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
          const SizedBox(height: 16,),
          // SizedBox(
          //   height: 50,
          //
          //   width: MediaQuery.of(context).size.width*0.6,
          //   child: CustomDropdownButton2(
          //     hint: 'Select',
          //     dropdownItems: items,
          //     value:selectedValue,
          //     onChanged: (value) {
          //       setState(() {
          //         selectedValue = value;
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
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },  items: items
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
          BlueTextField(
            controller: pro.NonSalaryName,
            hintText: 'Name',
          ),
          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.NonSalartanPan ,
            hintText: 'Tan/Pan',

            onchanged: (value ) {
              pro.setNonSalaryTan();

            },
            errorcode:pro.isNonSalaryvalibationTan==false? 'please enter valid Tan Number':null,
          ),

          const SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.NonSalaryAmountPaid,
            hintText: 'Amount Paid/Credited Income offered ',
            keyboardType: TextInputType.number,


          ),
          const
          SizedBox(height: 16),
          NewBlueTextField(
            controller: pro.NonSalaryPaymentCredite,
            hintText: 'Data of Payment/credited',
            onchanged: (value ) {
              pro.setdateNonSalary();

            },
            errorcode:pro.isdateNonSalaryvalibation==false? 'please enter valid Data of Payment':null,


          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller: pro.NonSalarDeductionIncluSurcharge,
            hintText: 'Tax Deduction inclu.surcharge/edu.cess ',
          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller: pro.NonSalaryPaidCreditedIncome,
            hintText: 'Amoun out of to be allowed as credit',
          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller: pro.NonSalarCertificateNumber,
            hintText: 'Unique Certificate Number(optional)',
          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller: pro.NonSalaryCertificateNumber9,
            hintText: 'Unique Certificate Nuber (optional) 9 ',
          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller:pro.NonSalaryTDSDeducted,
            hintText: 'F.Y. in which TDS is Deducted (Optional) ',
          ),
          const SizedBox(height: 16),
          BlueTextField(
            controller: pro.NonSalaryHandOfSpouser,
            hintText: 'Amount out of in hand of spouser other income  ',
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              pro.addRecord(TDSDetails_record_details(headofIncome: NonSalary, Section2: selectedValue,Name: pro.NonSalaryName.text,TanPan: pro.NonSalaryTan,AmountPaidCredited: pro.NonSalaryAmountPaid.text,DataofPayment: pro.NonSalaryPaymentCredite.text, TaxDeductionIncluSurcharge:pro.NonSalarDeductionIncluSurcharge.text,UniqueCertificateNumber: pro.NonSalarCertificateNumber.text,UniqueCetificateNumber9: pro.NonSalaryCertificateNumber9.text,FyinwhichTDSIsDeducted: pro.NonSalaryTDSDeducted.text,AmountOutofInHandofSpouserOther: pro.NonSalaryHeadofIncome.text));

            },

            child: const Text('Add Field'),
          ),
          const SizedBox(height: 16),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 20,
              headingRowColor: WidgetStateColor.resolveWith((states) => const Color.fromARGB(255, 0, 85, 212)),
              columns: const [
                DataColumn(label: Text('Head of Income ',style: TextStyle(color: Colors.white),)),
                DataColumn(label: Text('Section2',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Name',style: TextStyle(color: Colors.white))),

                DataColumn(label: Text('TanPan',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('AmountPaid/Cre',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('DataPay/cre ',style: TextStyle(color: Colors.white),)),

                DataColumn(label: Text('TaxDeduction',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('AmountPaieCre',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('UniqueCeti',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('UniqueCeti9',style: TextStyle(color: Colors.white))),

                DataColumn(label: Text('FyinTDSDEducted',style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Amount out in hand',style: TextStyle(color: Colors.white))),


                // DataColumn(label: Text('Add invoice')),
              ],
              rows: pro.dataList.map((data) => DataRow(
                onSelectChanged: (value){

                },
                cells: [
                  DataCell(Text(data.headofIncome??''.toString())),
                  DataCell(Text(data.Section2.toString())),
                  DataCell(Text(data.Name.toString())),

                  DataCell(Text(data.TanPan.toString())),
                  DataCell(Text(data.AmountPaidCredited.toString())),
                  DataCell(Text(data.DataofPayment.toString())),

                  DataCell(Text(data.TaxDeductionIncluSurcharge.toString())),
                  DataCell(Text(data.AmountPaidCreditedIncome.toString())),
                  DataCell(Text(data.UniqueCertificateNumber.toString())),

                  DataCell(Text(data.UniqueCetificateNumber9.toString())),
                  DataCell(Text(data.FyinwhichTDSIsDeducted.toString())),
                  DataCell(Text(data.AmountOutofInHandofSpouserOther.toString())),
                ],
              )).toList(),),
          ),

        ],
      );});
  }
  Widget buildSalarySection(BuildContext context) {
    return Consumer<itrManuallyTDSonSalary>(builder: (BuildContext context, pro, child)
    {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          BlueTextField(
            controller: pro.SalaryTan,
            hintText: 'Tan Number',
          ),
          const SizedBox(height: 16),
          BlueTextField(controller: pro.SalaryNameDeducted, hintText: 'Name of Deducted',),
          const SizedBox(height: 16),
          BlueTextField(controller: pro.SalartanPurchasesofAsserts, hintText: 'Income chargeable under the head salaries',),
          const SizedBox(height: 16),

          BlueTextField(controller: pro.SalaryTotalTaxDuducted, hintText: 'Total Tax duducted',),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () {
            pro.addRecord(TDSOnSalaryDetails_record_details(tanNumber: pro.SalaryTan.text, Namededucted: pro.SalaryNameDeducted.text, IcomeChargeable: pro.SalartanPurchasesofAsserts.text, totalTaxDeducted: pro.SalaryTotalTaxDuducted.text));}, child: const Text('Add Field'),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(scrollDirection: Axis.horizontal, child: DataTable(
            columnSpacing: 20,
            headingRowColor: WidgetStateColor.resolveWith((states) => const Color.fromARGB(255, 0, 85, 212)),
            columns: const [

              DataColumn(label: Text('TanNumber',style: TextStyle(color: Colors.white))),
              DataColumn(label: Text('Name of Deducted',style: TextStyle(color: Colors.white))),
              DataColumn(label: Text('Income Chargeable',style: TextStyle(color: Colors.white))),
              DataColumn(label: Text('total tax',style: TextStyle(color: Colors.white))),


              // DataColumn(label: Text('Add invoice')),
            ],
            rows: pro.dataList.map((data) => DataRow(
              onSelectChanged: (value){

              },
              cells: [

                DataCell(Text(data.tanNumber.toString())),

                DataCell(Text(data.Namededucted.toString())),
                DataCell(Text(data.IcomeChargeable.toString())),
                DataCell(Text(data.totalTaxDeducted.toString())),
              ],
            )).toList(),),
          ),

        ],
      );});
  }
}

class FinancialYear {
}