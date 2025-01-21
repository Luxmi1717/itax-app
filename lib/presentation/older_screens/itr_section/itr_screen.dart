
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/shared/types.dart';
import 'package:itax/cubits/itr_cubit.dart';
import 'package:itax/cubits/itr_state.dart';
import 'package:itax/presentation/older_widgets/widgets/back_button.dart';


class ITRScreen extends StatefulWidget {
  const ITRScreen({super.key});

  @override
  State<ITRScreen> createState() => _ITRScreenState();
}

class _ITRScreenState extends State<ITRScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    final List<ITRMenuItem> itrMenu = [
      ITRMenuItem(
        title: 'Upload Form-16',
        description:
            'Smart tax filing made easy - upload your Form-16 and let our AI do the rest!',
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Form16SelectionModel();
            },
          );
        },
        icon: "assets/images/Terms and Conditions.png",
      ),
      ITRMenuItem(
        title: 'File Manually  ',
        description:
            'Do it yourself - File your taxes manually by filling the form',
        onTap: () {
          context.push('/file-itr/file-Manually');
        },
        icon: "assets/images/Create.png",
      ),
      ITRMenuItem(
        title: 'Challan Entry ',
        description:
            'Do it yourself - File your taxes manually by filling the form',
        onTap: () {
          context.push('/file-itr/challan-Entry');
        },
        icon: "assets/images/Task.png",
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BlueBackButton(),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'File ITR',
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
                  context
                      .read<ITRCubit>()
                      .processForm16(state.file, state.formType);
                } else if (state is ITRForm16Processed) {
                  print('Form-16 Processed');
                  context.push('/file-itr/upload');
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
                    // Image.asset(
                    //   'assets/images/fill_form.png',
                    //   height: 200,
                    //   width: 400,
                    // ),
                    SizedBox(height: height/40),
                  Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ITR',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: height/30),
                  ),),
                    const SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Choose your tax filing method:',
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
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: item.onTap,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff2457C5).withOpacity(0.100),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[200]!,
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        item.icon,
                                        color: Colors.grey,
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
                                                        const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                                  )
                                                : Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        item.title,
                                                        style: const TextStyle(
                                                            color: Colors.black),
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
                            ),
                          ),
                        );
                      },
                    ),
                    const DisclaimerWidget(),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class ITRMenuItem {
  final String title;
  final String description;
  final GestureTapCallback onTap;
  final String icon;
  final bool upcoming;

  ITRMenuItem({
    required this.title,
    required this.onTap,
    required this.icon,
    required this.description,
    this.upcoming = false,
  });
}

class DisclaimerWidget extends StatelessWidget {
  const DisclaimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Disclaimer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              content: const Text(
                'Our company, iTaxEasy Pvt Ltd, does not take any responsibility for the JSON generated using our AI tools or forms. The user is solely responsible for the accuracy and consistency of the data they provide. The JSON output may contain inconsistencies or errors.',
                style: TextStyle(fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: Colors.grey,
      ),
      label: const Text(
        'Disclaimer',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}

class Form16SelectionModel extends StatelessWidget {
  const Form16SelectionModel({super.key});

  @override
  Widget build(BuildContext context) {
    final itrCubit = BlocProvider.of<ITRCubit>(context);

    return Dialog(
      insetPadding: const EdgeInsets.all(
          16.0), // Increase the padding to increase the size of the dialog box
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Expand the buttons to fill the width
          children: [
            const Text(
              'Select Form 16 Type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildForm16Button(
                  context,
                  itrCubit,
                  Form16Type.providedByITDepartment,
                  'assets/images/provided_by_it_dpt.png',
                  'Provided By IT Dept',
                ),
                const SizedBox(height: 8.0),
                _buildForm16Button(
                  context,
                  itrCubit,
                  Form16Type.custom,
                  'assets/images/custom.png',
                  'Custom',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm16Button(BuildContext context, ITRCubit itrCubit,
      Form16Type formType, String imageAsset, String buttonText) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2.0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          _handleForm16Selection(context, itrCubit, formType);
        },
        child: Column(
          children: [
            Image.asset(
              imageAsset,
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
            ),
            const SizedBox(height: 8.0),
            Text(
              buttonText,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  void _handleForm16Selection(
      BuildContext context, ITRCubit itrCubit, Form16Type formType) {
    print(itrCubit.state);

    if (itrCubit.state is ITRProcessingForm16) {
      return;
    }

    itrCubit.selectFile(formType);
    Navigator.pop(context);
  }
}
