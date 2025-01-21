import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/utility/size_utils.dart';
import 'package:share_plus/share_plus.dart';

class PdfViewScreens extends StatelessWidget {
  final String urlPath;
  const PdfViewScreens({
    required this.urlPath,
     super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: PDFView(
          filePath: urlPath,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: false,
          onRender: (pages) {},
          onError: (error) {
            log(error.toString());
          },
          onPageError: (page, error) {
            log('$page: ${error.toString()}');
          },
          onViewCreated: (PDFViewController pdfViewController) {},
        ),

      ),
    floatingActionButton: FloatingActionButton(
    onPressed: () async {
    await Share.share(urlPath);

    },
      backgroundColor: appTheme.blue800Af,
      child: const Icon(Icons.share),

    ),
    );
  }
}
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 42.h,
    leading: AppbarLeadingIconbutton(
      onTap: (){
        Navigator.pop(context);
      },
      imagePath: ImageConstant.imgGoBack,
      margin: EdgeInsets.only(
        left: 17.h,
        top: 15.v,
        bottom: 15.v,
      ),
    ),
    centerTitle: true,
    title: AppbarTitle(
      text: "Pdf Details",
    ),
  );
}