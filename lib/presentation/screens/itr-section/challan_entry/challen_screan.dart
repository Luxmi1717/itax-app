import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:itax/cubits/itr_cubit.dart';
import 'package:itax/cubits/itr_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class ChallanEntryScrean extends StatefulWidget {
  const ChallanEntryScrean({super.key});

  @override
  State<ChallanEntryScrean> createState() => _ChallanEntryScreanState();
}

class _ChallanEntryScreanState extends State<ChallanEntryScrean> {
  final String url =
      'https://eportal.incometax.gov.in/iec/foservices/#/e-pay-tax-prelogin/user-details';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    final List<ITRMenuItem> itrMenu = [
      ITRMenuItem(
        title: 'Chick hear for Challan',
        description:
            'Please fill in the below details for tax payment through (i) Net Banking (ii) Debit Card (iii) Over the Counter (iv) NEFT/RTGS',
        onTap: () {
          launchUrlString(
              'https://eportal.incometax.gov.in/iec/foservices/#/e-pay-tax-prelogin/user-details');
        },
        icon: "assets/images/Task.png",
      ),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Make Challan Tax Website',
            // style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child:
                  BlocConsumer<ITRCubit, ITRState>(listener: (context, state) {
                if (state is ITRFileSelected) {
                  // context.read<ITRCubit>().processForm16(state.file);
                } else if (state is ITRForm16Processed) {
                  print('Form-16 Processed');
                  context.push('/file-itr');
                } else if (state is ITRProcessingError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                }
              }, builder: (context, state) {
                if (state is ITRProcessingForm16) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Processing Form-16',
                      ),
                    ],
                  );
                }

                return Column(
                  children: [
                    Image.asset(
                      'assets/images/fill_form.png',
                      height: 200,
                      width: 400,
                    ),
                    const SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Official IncomeTax government website',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: itrMenu.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = itrMenu[index];

                        final theme = Theme.of(context);

                        final itemColor = item.upcoming
                            ? Colors.blueGrey[500]
                            : theme.primaryColor;

                        return Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: item.onTap,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    item.icon,
                                    color: itemColor,
                                  ),
                                  const SizedBox(width: 32),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        !item.upcoming
                                            ? Text(
                                                item.title,
                                                style:
                                                    TextStyle(color: itemColor),
                                              )
                                            : Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    item.title,
                                                    style: TextStyle(
                                                        color: itemColor),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue[50],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    child: const Text(
                                                      'Upcoming',
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        const SizedBox(height: 8),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Text(
                                            item.description,
                                            softWrap: true,
                                          ),
                                        ),
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
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  /*Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }*/

  _launchURL(BuildContext context, String url) async {
    bool launched = await canLaunch(url);

    if (launched) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to open URL'),
        ),
      );
    }
  }
}

class ITRMenuItem {
  final String title;
  final String description;
  final String icon;
  final bool upcoming;
  final VoidCallback onTap;

  ITRMenuItem({
    required this.title,
    required this.description,
    required this.icon,
    this.upcoming = false,
    required this.onTap,
  });
}

/* final _formKey = GlobalKey<FormState>();
  late final TabController _tabController;
  String financialYear = 'FY 2023-2024';
  AgeCategory age = AgeCategory.below60;

  IncomeTaxCalcResult? incomeTaxCalcResult;


  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final fyYear =
          Provider
              .of<ITRProvider>(context, listen: false)
              .financialYear;

      setState(() {
        financialYear = fyYear == FinancialYear.fy2022_2023
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
            .backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Income Tax Calculator',
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
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
                  child: Text('Type of Payment'),
                ),
                //Tab(
                //child: Text('TDS Details'),
                //),

                Tab(
                  child: Text('Fill all details'),
                ),
                Tab(
                  child: Text('Tax Applicable'),
                ),
                Tab(
                  child: Text('Challan Pending'),
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

                    buildTypeofPayment(context),
                    buildFillAllfield(context),
                    buildFillAllfield(context),
                    buildFillAllfield(context),
                    // buildTDSDetailsSection(context),
                    // buildTCSDetailsSection(context),
                    // buildNonSalarySection(context),
                    // buildSalarySection(context),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildTypeofPayment(BuildContext context) {
    TextEditingController text = TextEditingController();


    return Consumer<CallanTypeofPayment>(
        builder: (BuildContext context, pro, child) {
          return Column(
            children: [
              RadioListTile(
                title: Text('Advance Tax'),
                value: 1,
                groupValue: pro.selectedValue,
                onChanged: (value) {
                  pro.setPaymentType(int.parse(value.toString()));
                },
              ),
              RadioListTile(
                title: Text('Self Assessment Tax'),
                value: 2,
                groupValue: pro.selectedValue,
                onChanged: (value) {
                  pro.setPaymentType(int.parse(value.toString()));
                },
              ),
              RadioListTile(
                title: Text('Tax on Regular Assesment'),
                value: 3,
                groupValue: pro.selectedValue,
                onChanged: (value) {
                  pro.setPaymentType(int.parse(value.toString()));
                },
              ),
              RadioListTile(
                title: Text('Surtax'),
                value: 4,
                groupValue: pro.selectedValue,
                onChanged: (value) {
                  pro.setPaymentType(int.parse(value.toString()));
                },
              ),
              RadioListTile(
                title: Text('Tax on Distributed Profit of Domestic Compainies'),
                value: 5,
                groupValue: pro.selectedValue,
                onChanged: (value) {
                  pro.setPaymentType(int.parse(value.toString()));
                },
              ),
              RadioListTile(
                title: Text('Tax on Distributed Income to Unit Holder'),
                value: 6,
                groupValue: pro.selectedValue,
                onChanged: (value) {
                  pro.setPaymentType(int.parse(value.toString()));
                },
              ),
              RadioListTile(
                title: Text('Other Reciepts'),
                value: 7,
                groupValue: pro.selectedValue,
                onChanged: (value) {
                  pro.setPaymentType(int.parse(value.toString()));
                },
              ),


            ],
          );
        });
  }

  Widget buildFillAllfield(BuildContext context) {
    TextEditingController text = TextEditingController();


    return Consumer<CallanTypeofPayment>(
        builder: (BuildContext context, pro, child) {
          return Column(
          children: [
            NewBlueTextField(
              controller:text,
              hintText: 'Amount of Tax ',

              keyboardType: TextInputType.number,

            ),
            SizedBox(height: 16,),
            NewBlueTextField(
              controller:text,
              hintText: 'Surcharge',

              keyboardType: TextInputType.number,

            ),
            SizedBox(height: 16,),
            NewBlueTextField(
              controller:text,
              hintText: 'H. & Edu Cess',

              keyboardType: TextInputType.number,

            ),
            SizedBox(height: 16,),
            NewBlueTextField(
              controller:text,
              hintText: 'Total',

              keyboardType: TextInputType.number,

            ),
            SizedBox(height: 16,),
            SizedBox(height: 16,),
            NewBlueTextField(
              controller:text,
              hintText: 'Interest',

              keyboardType: TextInputType.number,

            ),
            SizedBox(height: 16,),

            NewBlueTextField(
              controller:text,
              hintText: 'Other',

              keyboardType: TextInputType.number,

            ),
            SizedBox(height: 16,),
            NewBlueTextField(
              controller:text,
              hintText: 'Penalty',

              keyboardType: TextInputType.number,

            ),
            SizedBox(height: 16,),



          ],

            );
        });
  }

}*/
