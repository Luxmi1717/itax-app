// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:itax/cubits/auth_cubit.dart';
// import 'package:itax/cubits/invoice_cubit.dart';
// import 'package:itax/cubits/invoice_state.dart';
// import 'package:itax/models/Invoice/invoice_party_create.dart';
// import 'package:itax/presentation/older_screens/gst/login_gst_page.dart';
// import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
// import 'package:itax/providers/services-old/utils/utils.dart';



// class AddPartyPage extends StatefulWidget {
//   const AddPartyPage({super.key});

//   @override
//   _AddPartyPageState createState() => _AddPartyPageState();
// }

// class _AddPartyPageState extends State<AddPartyPage> {
//   String? selectedPartyType;
//   final List<String> partyTypes = ["Supplier", "Customer"];
//   final TextEditingController _partyNameController = TextEditingController();
//   final TextEditingController _gstinController = TextEditingController();
//   final TextEditingController _panController = TextEditingController();
//   final TextEditingController _tanController = TextEditingController();
//   final TextEditingController _upiController = TextEditingController();
//   final TextEditingController _userIdController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _bankNameController = TextEditingController();
//   final TextEditingController _bankAccountNumberController =
//       TextEditingController();
//   final TextEditingController _bankIfscController = TextEditingController();
//   final TextEditingController _bankBranchController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String _selectedPartyType = 'Customer';

//   late String token;

//   @override
//   void initState() {
//     super.initState();

//     final user =
//         BlocProvider.of<AuthCubit>(context, listen: false).getLoggedInUser();

//     token = user.token!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<InvoiceCubit, InvoiceState>(
//       builder: (context, state) => Scaffold(
//         appBar: _buildAppBar(context),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     PartyTypeButton(
//                       icon: Icons.person,
//                       text: 'Customer',
//                       onPressed: () {
//                         setState(() {
//                           _selectedPartyType = 'Customer';
//                         });
//                       },
//                       isSelected: _selectedPartyType == 'Customer',
//                     ),
//                     const SizedBox(width: 16),
//                     // PartyTypeButton(
//                     //   icon: Icons.store,
//                     //   text: 'Supplier',
//                     //   onPressed: () {
//                     //     setState(() {
//                     //       _selectedPartyType = 'Supplier';
//                     //     });
//                     //   },
//                     //   isSelected: _selectedPartyType == 'Supplier',
//                     // ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const SectionTitle(title: 'Personal Details'),
//                 const SizedBox(height: 16),
//                 const SizedBox(height: 8),
//                 StyledTextField(
//                   label: 'Party Name',
//                   controller: _partyNameController,
//                   hintText: 'Enter party name',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter part name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 8),
//                 StyledTextField(
//                   label: 'GSTIN',
//                   controller: _gstinController,
//                   hintText: 'Enter GSTIN',
//                   nextController: _panController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter GSTIN';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 28),

//                 DropdownButtonFormField<String>(
//                   value: selectedPartyType,
//                   hint: const Text("Select Party Type"),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedPartyType = newValue!;
//                     });
//                   },
//                   items:
//                       partyTypes.map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   decoration: InputDecoration(
//                     labelText: "Party Type",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 // const SizedBox(height: 8),
//                 // StyledTextField(
//                 //   label: 'PAN',
//                 //   controller: _panController,
//                 //   hintText: 'Enter PAN',
//                 // ),
//                 // const SizedBox(height: 8),
//                 // StyledTextField(
//                 //   label: 'TAN',
//                 //   controller: _tanController,
//                 //   hintText: 'Enter TAN',
//                 // ),
//                 const SizedBox(height: 16),
//                 const SectionTitle(title: 'Business Details'),
//                 const SizedBox(height: 16),
//                 StyledTextField(
//                   label: 'UPI',
//                   controller: _upiController,
//                   hintText: 'Enter UPI',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter UPI';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 8),
//                 StyledTextField(
//                   label: 'User ID',
//                   controller: _userIdController,
//                   hintText: 'Enter User ID',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter user id';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 8),
//                 StyledTextField(
//                   label: 'Email',
//                   controller: _emailController,
//                   hintText: 'Enter email',
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 8),
//                 StyledTextField(
//                   label: 'Phone',
//                   controller: _phoneController,
//                   hintText: 'Enter phone',
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter phone';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 8),
//                 StyledTextField(
//                   label: 'Address',
//                   controller: _addressController,
//                   hintText: 'Enter address',
//                   maxLines: 3,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter email address';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 const SectionTitle(title: 'Bank Details'),
//                 const SizedBox(height: 16),
//                 StyledTextField(
//                   label: 'Bank Name',
//                   controller: _bankNameController,
//                   hintText: 'Enter bank name',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter bank name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 8),
//                 StyledTextField(
//                   label: 'Bank Account Number',
//                   controller: _bankAccountNumberController,
//                   hintText: 'Enter account number',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter account number';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 8),
//                 StyledTextField(
//                   label: 'Bank IFSC',
//                   controller: _bankIfscController,
//                   hintText: 'Enter IFSC',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter ifsc';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 8),
//                 StyledTextField(
//                   label: 'Bank Branch',
//                   controller: _bankBranchController,
//                   hintText: 'Enter bank branch',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter bank branch';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 NeomorphicButton(
//                   onTap: () {
//                     if (_formKey.currentState!.validate()) {
//                       bool isValid = validateGSTIN(_gstinController.text);
//                       {
//                         if (isValid) {
//                           final party = Party(
//                             partyName: _partyNameController.text,
//                             type: _selectedPartyType.toLowerCase(),
//                             gstin: _gstinController.text,
//                             pan: _panController.text,
//                             tan: _tanController.text,
//                             upi: _upiController.text,
//                             email: _emailController.text,
//                             phone: _phoneController.text,
//                             address: _addressController.text,
//                             bankName: _bankNameController.text,
//                             bankAccountNumber:
//                                 _bankAccountNumberController.text,
//                             bankIfsc: _bankIfscController.text,
//                             bankBranch: _bankBranchController.text,
//                           );

//                           BlocProvider.of<InvoiceCubit>(context)
//                               .createParty(token, party);
//                         } else {
//                           Utils.flushbarErrorMessage(
//                               'GSTIN code is invalid', context);
//                         }
//                       }
//                     }
//                   },
//                   buttonText: 'Add Party',
//                   isLoading: state is PartyCreatingState,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       listener: (context, state) {
//         if (state is PartyErrorState) {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text("Could not add party.")));
//         } else if (state is PartyCreatedState) {
//           ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("$_selectedPartyType created.")));
//         }
//       },
//     );
//   }
// }

// class PartyTypeButton extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final VoidCallback onPressed;
//   final bool isSelected;

//   const PartyTypeButton({
//     super.key,
//     required this.icon,
//     required this.text,
//     required this.onPressed,
//     required this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: isSelected ? Colors.blue : Colors.grey,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               size: 36,
//               color: isSelected ? Colors.blue : Colors.grey,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               text,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                 color: isSelected ? Colors.blue : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  final TextEditingController? nextController;
  String? Function(String?)? validator;

  StyledTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.nextController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Colors.grey,
                )
              ]),
          child: TextFormField(
            validator: validator,
            onChanged: (text) {
              if (label == "GSTIN" && text.length > 2) {
                nextController!.text = text.length > 12
                    ? text.substring(2, 12)
                    : text.substring(2, text.length);
              }
            },
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const Divider(
          color: Colors.grey, // You can customize the color
          height: 1, // Adjust the thickness of the line
        ),
      ],
    );
  }
}

// PreferredSizeWidget _buildAppBar(BuildContext context) {
//   return CustomAppBar(
//     leadingWidth: 42.h,
//     leading: AppbarLeadingIconbutton(
//       onTap: () {
//         Navigator.pop(context);
//       },
//       imagePath: ImageConstant.imgGoBack,
//       margin: EdgeInsets.only(
//         left: 17.h,
//         top: 15.v,
//         bottom: 15.v,
//       ),
//     ),
//     centerTitle: true,
//     title: AppbarTitle(
//       text: "Add Party",
//     ),
//   );
// }
