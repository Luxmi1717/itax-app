import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class PDFToolsScreen extends StatefulWidget {
  const PDFToolsScreen({super.key});

  @override
  State<PDFToolsScreen> createState() => _PDFToolsScreenState();
}

class _PDFToolsScreenState extends State<PDFToolsScreen> {
  final List<PDFMenuItem> _pdfTools = [
    PDFMenuItem(
      title: 'Merge PDF',
      path: '/pdf/merge',
      icon: const Icon(
        Icons.picture_as_pdf_outlined,
      ),
      image: "assets/images/margepdf.png",
      des: "Combine PDFs in the order you want the easy way",
    ),
    PDFMenuItem(
      title: 'Convert Image To PDF',
      path: '/image-to-pdf',
      icon: const Icon(
        Icons.image_outlined,
      ),
      image: "assets/images/imagetopdf.png",
      des: "Convert JPG images to PDF in seconds. ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios, color: whiteColor,),
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'PDF Tools',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 50),
          child: Column(
            children: [
              // Removed SingleChildScrollView
              Expanded(
                child: GridView.builder(
                  itemCount: _pdfTools.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0, // Add spacing between grid items
                    crossAxisSpacing: 8.0, // Add spacing between grid items
                    childAspectRatio:
                        0.75, // Adjust this ratio to control item size
                  ),
                  itemBuilder: (context, index) {
                    final item = _pdfTools[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => context.push(item.path),
                        child: Container(
                          width: width / 4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2.h,
                                blurRadius: 2.h,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 50),
                            child: Column(
                              mainAxisSize:
                                  MainAxisSize.min, // Prevent overflow
                              children: [
                                SizedBox(height: height / 50),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(item.image,
                                        height: height / 10),
                                  ],
                                ),
                                SizedBox(height: height / 50),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    fontSize: height / 55,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: height / 90),
                                Text(
                                  item.des,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: height / 65,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PDFMenuItem {
  final String title;
  final String path;
  final Icon icon;
  final String image;
  final String des;

  PDFMenuItem({
    required this.title,
    required this.path,
    required this.icon,
    required this.image,
    required this.des,
  });
}
