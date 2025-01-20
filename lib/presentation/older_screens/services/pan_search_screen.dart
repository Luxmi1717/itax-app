import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/pan_details_cubit.dart';
import 'package:itax/cubits/pan_details_state.dart';
import 'package:itax/models/pan_details_model.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/itr-section/widgets/form-widgets.dart';
import 'package:itaxeasy/utility/size_utils.dart';
import 'package:itaxeasy/widgets/back_button.dart';
import 'package:flutter/material.dart';


class PanSearchScreen extends StatefulWidget {
  const PanSearchScreen({super.key});

  @override
  State<PanSearchScreen> createState() => _PanSearchScreenState();
}

class _PanSearchScreenState extends State<PanSearchScreen> {
  final panController = TextEditingController();

  late final String? token;

  PanDetails? panDetails;

  @override
  initState() {
    super.initState();

    token = BlocProvider.of<AuthCubit>(context, listen: false)
        .getLoggedInUser()
        .token;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: const BlueBackButton(),
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'PAN Search',
            // style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: BlocConsumer<PanDetailsCubit, PanDetailsState>(
          listener: (context, state) {
            print(state);
            if (state is PanDetailsSuccess) {
              setState(() {
                panDetails = state.panDetails;
              });
              // Display the panDetails or perform further actions
            } else if (state is PanDetailsError) {
              final error = state.error;
              // Display the error or perform error handling

              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error.toString(),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            if (state is PanDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PanDetailsError) {
              final error = state.error;
              return Center(
                child: Text(error),
              );
            } else if (panDetails != null) {
              final details = panDetails!;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PAN: ${details.data.pan}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          Text(
                            'First Name: ${details.data.firstName}',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            'Last Name: ${details.data.lastName}',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            'Status: ${details.data.status}',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            'Aadhaar Seeding Status: ${details.data.aadhaarSeedingStatus}',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            'Category: ${details.data.category}',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            'Last Updated: ${details.data.lastUpdated}',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    BlueTextField(
                      controller: panController,
                      hintText: 'PAN No',
                    ),
                    const SizedBox(height: 16),
                    NeomorphicButton(
                        onTap: () {
                          final cubit = context.read<PanDetailsCubit>();
                          cubit.getPanDetails(token!, panController.text);
                        },
                        buttonText: 'Search'),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 38.h,
    leading: AppbarLeadingIconbutton(
      onTap: (){
        Navigator.pop(context);
      },
      imagePath: ImageConstant.imgGoBack,
      margin: EdgeInsets.only(
        left: 13.h,
        top: 15.v,
        bottom: 15.v,
      ),
    ),
    centerTitle: true,
    title: AppbarTitle(
      text: "Search by GSTIN",
    ),
  );
}