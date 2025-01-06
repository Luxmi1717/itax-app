import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/cubits/ocr_cubit.dart';
import 'package:itax/models/aadhaar_model.dart';
import 'package:itax/models/invoice_model.dart';

import 'package:flutter/material.dart';
import 'package:itax/models/pan_model.dart';


class OCRScreen extends StatefulWidget {
  const OCRScreen({super.key});

  @override
  State<OCRScreen> createState() => _OCRScreenState();
}

class _OCRScreenState extends State<OCRScreen> {
  final List<DashMenuItem> _ocrTools = [
    DashMenuItem(
      title: 'Aadhaar',
      path: '/ocr/aadhaar',
      color: Colors.red,
      icon: Icons.fingerprint_outlined,
    ),
    DashMenuItem(
      title: 'PAN',
      path: '/ocr/pan',
      color: Colors.blue,
      icon: Icons.badge_outlined,
    ),
    DashMenuItem(
      title: 'Invoice',
      path: '/ocr/invoice',
      color: Colors.blueGrey,
      icon: Icons.receipt_long_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'OCR',
            // style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TabBar(
                  labelColor: const Color(0xff2457C5),
                  indicatorColor: const Color(0xff2457C5),
                  unselectedLabelColor: const Color(0xff545454),
                  labelStyle: const TextStyle(
                    color: Color(0xff2457C5),
                  ),
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.asset(
                          //   "assets/images/scan.png",
                          //   scale: 2,
                          // ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Scan'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.asset("assets/images/collection.png"),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          const Text('Collection'),
                        ],
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: TabBarView(
                    children: [
                      buildScanTab(context),
                      buildDataTab(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildScanTab(BuildContext context) {
    int? selectedIndex;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: _ocrTools.map((item) {
        final index = _ocrTools.indexOf(item);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              final path = item.path;

              if (path != null) {
                context.push(path);
              }
            },
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: selectedIndex == index
                              ? mainBlueColor
                              : const Color(0xff999999),
                          width: 0.50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 1, //spread radius
                          blurRadius: 5, // blur radius
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Icon(item.icon,
                        color: selectedIndex == index
                            ? mainBlueColor
                            : const Color(0xff999999)),
                  ),
                ),
                Text(
                  item.title,
                  style: TextStyle(
                    color: selectedIndex == index
                        ? mainBlueColor
                        : const Color(0xff999999),
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Future<void> handleDelete(dynamic model) async {
    final ocrCubit = BlocProvider.of<OCRCubit>(context);

    if (model is AadhaarModel) {
      await ocrCubit.deleteAadhaar(model: model);
    } else if (model is PanModel) {
      await ocrCubit.deletePAN(model: model);
    } else {
      throw Exception('Invalid model type');
    }
  }

  Widget buildDataTab(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Aadhaar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ValueListenableBuilder<Box<AadhaarModel>>(
                  valueListenable:
                      Hive.box<AadhaarModel>('aadhaar_models').listenable(),
                  builder: (context, box, _) {
                    final models = box.values.toSet().toList();

                    return ListView.builder(
                      itemCount: models.length,
                      // gridDelegate:
                      //     const SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 1,
                      //   mainAxisSpacing: 16.0,
                      //   crossAxisSpacing: 16.0,
                      // ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final model = models[index];

                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => ModelDialog(
                                data: {
                                  'Year of Birth':
                                      model.data?.yearOfBirth ?? '',
                                  'Gender': model.data?.gender ?? '',
                                  'Aadhaar Number':
                                      model.data?.aadhaarNumber ?? '',
                                  'Name': model.data?.name ?? '',
                                },
                                onDelete: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Confirm Delete'),
                                      content: const Text(
                                        'Are you sure you want to delete this item?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            handleDelete(model);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  // Colors.deepOrangeAccent,
                                  Colors.white70,
                                  Colors.green.withOpacity(0.8)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height / 6,
                                        width: width / 5,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            image: DecorationImage(
                                                image: model.data?.gender ==
                                                        "male"
                                                    ? const AssetImage(
                                                        "assets/images/maledefult.png")
                                                    : const AssetImage(
                                                        "assets/images/female.png"),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: height / 60),
                                        Text(
                                          model.data?.name ?? 'No Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: height / 50),
                                        ),
                                        SizedBox(height: height / 200),
                                        Text(
                                          "DOB: ${model.data?.yearOfBirth ?? ""}",
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        SizedBox(height: height / 200),
                                        Text(
                                            "Gender: ${model.data?.gender ?? ""}",
                                            style: const TextStyle(
                                                color: Colors.grey)),
                                        SizedBox(height: height / 50),
                                        Container(
                                          // width: width/1.5,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width / 100),
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.red),
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Column(
                                            children: [
                                              Text(
                                                "आधार पहचान का प्रमाण है, नागरिकता का नहीं।",
                                                style: TextStyle(
                                                    fontSize: height / 80),
                                              ),
                                              Text(
                                                "Aadhaar is a proof of identify, not of citizenship.",
                                                style: TextStyle(
                                                    fontSize: height / 80),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: height / 120),
                                        Text(model.data?.aadhaarNumber ?? "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: height / 40,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(height: height / 100),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                    height: height / 500,
                                    width: width,
                                    color: Colors.red),
                                SizedBox(height: height / 100),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "मेरा  ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: height / 50),
                                    ),
                                    Text(
                                      "आधार",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: height / 50),
                                    ),
                                    Text(
                                      ",  मेरी पहचान",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: height / 50),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 50),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const Divider(),
                const SizedBox(height: 32),
                const SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'PAN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ValueListenableBuilder<Box<PanModel>>(
                  valueListenable:
                      Hive.box<PanModel>('pan_models').listenable(),
                  builder: (context, box, _) {
                    final models = box.values.toSet().toList();

                    return ListView.builder(
                      itemCount: models.length,
                      // gridDelegate:
                      //     const SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 2,
                      //   mainAxisSpacing: 16.0,
                      //   crossAxisSpacing: 16.0,
                      // ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final model = models[index];

                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => ModelDialog(
                                data: {
                                  'Name': model.data?.name ?? '',
                                  'Father\'s Name':
                                      model.data?.fatherName ?? '',
                                  'Year of Birth': model.data?.dob ?? '',
                                  'PAN Number': model.data?.pan ?? '',
                                },
                                onDelete: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Confirm Delete'),
                                      content: const Text(
                                        'Are you sure you want to delete this item?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            handleDelete(model);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  // Colors.deepOrangeAccent,
                                  Colors.white70,
                                  Colors.blue.withOpacity(0.8)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 18.sp),
                                  Row(
                                    children: [
                                      Container(
                                        height: height / 8,
                                        width: width / 5,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/maledefult.png"),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      SizedBox(width: width / 50),
                                      Column(
                                        children: [
                                          Text("स्थायी खाता संख्या कार्ड",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff444b75),
                                                  fontSize: 18.sp)),
                                          Text("Permanent Account Number Card",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff444b75),
                                                  fontSize: 18.sp)),
                                          SizedBox(height: height / 150),
                                          Text(
                                              model.data?.pan ??
                                                  'XXXXX XXXX XXXX XXXX',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: height / 50)),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height / 100),
                                  Text(
                                    "નામ/Name",
                                    style: TextStyle(
                                        color: const Color(0xff444b75),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(height: height / 400),
                                  Text(
                                    model.data?.name ?? "NO NAME",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(height: 18.sp),
                                  Text(
                                    "पिता का नाम/Father's Name",
                                    style: TextStyle(
                                        color: const Color(0xff444b75),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(height: height / 400),
                                  Text(
                                    model.data?.fatherName ?? "NO NAME",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(height: 18.sp),
                                  Text(
                                    "जन्म की तारीख/Date of Birth",
                                    style: TextStyle(
                                        color: const Color(0xff444b75),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(height: height / 400),
                                  Text(
                                    model.data?.dob ?? "NO DATE",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                // INVOICE

                const Divider(),
                const SizedBox(height: 32),
                const SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Invoice',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ValueListenableBuilder<Box<InvoiceModel>>(
                  valueListenable:
                      Hive.box<InvoiceModel>('invoice_models').listenable(),
                  builder: (context, box, _) {
                    final models = box.values.toSet().toList();

                    return ListView.builder(
                      itemCount: models.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final model = models[index];

                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => ModelDialog(
                                data: {
                                  'Buyer\'s GSTIN':
                                      model.data?.buyer?.gstin ?? '',
                                  'Buyer\'s State':
                                      model.data?.buyer?.state.toString() ?? '',
                                  'Buyer\'s Address':
                                      model.data?.buyer?.address ?? '',
                                  'Consignee\'s GSTIN':
                                      model.data?.supplier?.gstin ?? '',
                                  'Consignee\'s State':
                                      model.data?.supplier?.state.toString() ??
                                          '',
                                  'Consignee\'s Address':
                                      model.data?.supplier?.address ?? '',
                                  'Supplier\'s GSTIN':
                                      model.data?.supplier?.gstin ?? '',
                                  'Supplier\'s State':
                                      model.data?.supplier?.state.toString() ??
                                          '',
                                  'Supplier\'s Address':
                                      model.data?.supplier?.address ?? '',
                                  'Invoice No': model.data?.invoiceNo ?? '',
                                  'Date': model.data?.date ?? '',
                                  'Destination': model.data?.destination ?? '',
                                  'Chargeable Amount':
                                      model.data?.chargeableAmount.toString() ??
                                          '',
                                  'Tax Amount':
                                      model.data?.taxAmount.toString() ?? '',
                                  'Chargeable Amount (In Words)':
                                      model.data?.chargeableAmountInWords ?? '',
                                  'Tax Amount (In Words)':
                                      model.data?.taxAmountInWords ?? '',
                                  'CGST': model.data?.cgst.toString() ?? '',
                                },
                                onDelete: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Confirm Delete'),
                                      content: const Text(
                                        'Are you sure you want to delete this item?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            handleDelete(model);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          child: SizedBox(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.data?.invoiceNo ?? 'No Invoice No',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      model.data?.date ?? 'No Date',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      'Supplier GSTIN: ${model.data?.supplier?.gstin ?? 'N/A'}',
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      'Buyer GSTIN: ${model.data?.buyer?.gstin ?? 'N/A'}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashMenuItem {
  final String title;
  final String? path;
  final Color color;
  final IconData icon;

  DashMenuItem({
    required this.title,
    required this.path,
    required this.color,
    required this.icon,
  });
}

class ModelDialog extends StatelessWidget {
  final Map<String, String> data;
  final VoidCallback onDelete;

  const ModelDialog({
    super.key,
    required this.data,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Model Details'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: data.entries
              .map(
                (entry) => ListTile(
                  title: Text(entry.key),
                  subtitle: Text(entry.value),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: onDelete,
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.red),
          ),
          child: const Text('Delete'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          ),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
  