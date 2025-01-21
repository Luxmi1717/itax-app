
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/itr_cubit.dart';
import 'package:itax/cubits/itr_state.dart';
import 'package:itax/models/itr_model.dart';
import 'package:itax/presentation/older_widgets/widgets/back_button.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/utility/date_time.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class FileITRScreen extends StatefulWidget {
  const FileITRScreen({super.key});

  @override
  State<FileITRScreen> createState() => _FileITRScreenState();
}

class _FileITRScreenState extends State<FileITRScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final assessmentYearController = TextEditingController();
  final incomeFromSalaryController = TextEditingController();
  final incomeFromHousePropertyController = TextEditingController();
  final incomeFromOtherSourcesController = TextEditingController();
  final deductionsController = TextEditingController();
  final taxableIncomeController = TextEditingController();
  final netTaxPayableController = TextEditingController();

  final fatherNameController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();
  final aadhaarController = TextEditingController();
  final panController = TextEditingController();

  final bankNameController = TextEditingController();
  final bankAccountNoController = TextEditingController();
  final ifscCodeController = TextEditingController();

  late final TabController _tabController;

  _initializeTextFields() {
    final currentState =
        BlocProvider.of<ITRCubit>(context, listen: false).state;

    if (currentState is ITRForm16Processed) {
      final data = currentState.form16Data;

      print(data.partAAssessmentYear);

      assessmentYearController.text =
          DateTimeUtil.processAssessmentYear(data.partAAssessmentYear);
      incomeFromSalaryController.text =
          data.incomeChargableUnderSalaries.toString();
      incomeFromHousePropertyController.text =
          data.incomeFromHousePropertyReported.toString();
      incomeFromOtherSourcesController.text =
          data.totalAmountOfOtherIncomeReportedByTheEmployee.toString();
      deductionsController.text = data.aggregateOfDeductibleAmount.toString();
      taxableIncomeController.text = data.totalTaxableIncome.toString();
      print(data.totalAmountOfTaxDepositedOrRemitted);
      netTaxPayableController.text =
          (data.totalAmountOfTaxDepositedOrRemitted - data.netTaxPayable)
              .abs()
              .toString();
      panController.text = data.partBPanOfEmployee;
    }
  }

  _initializeUserData() {
    final user =
        BlocProvider.of<AuthCubit>(context, listen: false).getLoggedInUser();

    final data = user.data;

    // token = user.token;

    if (data == null) {
      return;
    }

   fatherNameController.text = data.fatherName ?? '';

    panController.text = data.pan ?? panController.text;

   dobController.text = data.dob!;

    aadhaarController.text = data.aadhaar ?? '';
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _initializeTextFields();

    _initializeUserData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: const BlueBackButton(),
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'File ITR',
            // style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: BlocBuilder<ITRCubit, ITRState>(
            builder: (context, state) {
              if (state is ITRForm16Processed) {
                final data = state.form16Data;

                final primaryColor = Theme.of(context).primaryColor;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.blue,
                      tabs: const [
                        Tab(
                          child: Text('Preview'),
                        ),
                        Tab(
                          child: Text('Verification Details'),
                        ),
                        Tab(
                          child: Text('Download'),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Form(
                        key: _formKey,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            buildPreviewForm(primaryColor, data),
                            buildVerificationDetailsTab(primaryColor, data),
                            buildDownloadTab(data),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is ITRDownloaded) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('🎉 JSON Generated Successfully.'),
                );
              }

              return const Text('Something went wrong');
            },
          ),
        ),
      ),
    );
  }

  Widget buildPreviewForm(Color primaryColor, ITRModel data) {
    final isTaxPayable =
        data.netTaxPayable > data.totalAmountOfTaxDepositedOrRemitted;

    final taxLabel = isTaxPayable ? 'Net Tax Payable' : 'Net Tax Refundable';

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'Assessment Year',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        BlueSelectBox(
          icon: const Icon(Icons.edit_calendar_outlined),
          hintText: 'Assessment Year',
          options: const [
            '2022-23',
            '2023-24',
          ],
          controller: assessmentYearController,
        ),
        const SizedBox(height: 16),
        Text(
          'Income from Salary',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        BlueTextField(
          controller: incomeFromSalaryController,
          hintText: 'Income from Salary', 
        ),
        const SizedBox(height: 16),
        Text(
          'Income from House Property',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        BlueTextField(
          controller: incomeFromHousePropertyController,
          hintText: 'Income from House Property',
        ),
        const SizedBox(height: 16),
        Text(
          'Income from Other Sources',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        BlueTextField(
          controller: incomeFromOtherSourcesController,
          hintText: 'Income from Other Sources',
        ),
        const SizedBox(height: 16),
        Text(
          'Deductions',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        BlueTextField(
          controller: deductionsController,
          hintText: 'Deductions',
        ),
        const SizedBox(height: 16),
        Text(
          'Taxable Income',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        BlueTextField(
          controller: taxableIncomeController,
          hintText: 'Taxable Income',
        ),
        const SizedBox(height: 16),
        Text(
          taxLabel,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        BlueTextField(
          controller: netTaxPayableController,
          hintText: taxLabel,
        ),
      ],
    );
  }

  Widget buildVerificationDetailsTab(Color primaryColor, ITRModel data) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: _initializeUserData,
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Auto-fill Details'),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Father\'s Name',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BlueTextField(
                controller: fatherNameController,
                hintText: 'Father\'s Name',
              ),
              const SizedBox(height: 16),
              Text(
                'Complete Address (Separated by ,)',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BlueTextField(
                controller: addressController,
                hintText: 'Address',
                multiline: true,
              ),
              const SizedBox(height: 16),
              Text(
                'Date of Birth',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BlueDateTimeField(
                icon: const Icon(Icons.edit_calendar_outlined),
                controller: dobController,
                hintText: 'Date of Birth',
              ),
              const SizedBox(height: 16),
              Text(
                'Aadhaar',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BlueTextField(
                controller: aadhaarController,
                hintText: 'Aadhaar',
              ),
              const SizedBox(height: 16),
              Text(
                'PAN',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BlueTextField(
                initialValue: data.partBPanOfEmployee,
                controller: panController,
                hintText: 'Pan',
              ),
              const SizedBox(height: 16),
              Text(
                'Bank Name',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BlueTextField(
                controller: bankNameController,
                hintText: 'Bank Name',
              ),
              const SizedBox(height: 16),
              Text(
                'Bank Account No',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BlueTextField(
                controller: bankAccountNoController,
                hintText: 'Bank Account No',
              ),
              const SizedBox(height: 16),
              Text(
                'IFSC Code',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BlueTextField(
                controller: ifscCodeController,
                hintText: 'IFSC Code',
              ),
            ],
          );
        });
  }

  SizedBox buildButton(BuildContext context, {required onTap, required label}) {
    return SizedBox(
      width: double.maxFinite,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDownloadTab(ITRModel data) {
    return BlocConsumer<ITRCubit, ITRState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ITRDownloading,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/success_circle.png',
                    width: 96,
                    height: 96,
                  ),
                  const Text(
                    'Congratulations!',
                    // style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Your JSON file is ready',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  NeomorphicButton(
                    onTap: () {
                      context.read<ITRCubit>().saveJson(
                            data: data.toJSON(),
                            aadhaar: aadhaarController.text,
                            pan: panController.text,
                            address: addressController.text,
                            dob: dobController.text,
                            fatherName: fatherNameController.text,
                            bankAccountNo: bankAccountNoController.text,
                            bankName: bankNameController.text,
                            ifscCode: ifscCodeController.text,
                          );
                    },
                    buttonText: 'Download',
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is ITRDownloadError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        } else if (state is ITRDownloaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'ITR JSON Saved',
              ),
            ),
          );
        }
      },
    );
  }
}
