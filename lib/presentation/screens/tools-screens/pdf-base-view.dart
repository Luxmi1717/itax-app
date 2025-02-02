import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/utility/tools-services.dart';

class ToolsBaseViewScreen extends StatelessWidget {
  const ToolsBaseViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.mainGradient,
        ),
      ),
      leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(Icons.arrow_back_ios, color: Colors.white)),
          title: Text('Converters', style: TextStyle(color: Colors.white, fontSize: 20.sp)),

    ),
    body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 4.w),
                      height: 1,
                      color: mainBlueColor,
                    ),
                  ),
                  Text(
                    'Services',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: mainBlueColor),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 4.w),
                      height: 1,
                      color: mainBlueColor,
                    ),
                  ),
                ],
              ),
        ),
            SizedBox(height: 14.h),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(toolsServiceList.length, (index) {
                return InkWell(
                  onTap: () {
                    GoRouter.of(context)
                        .push(toolsServiceList[index].navigationPath);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(
                                toolsServiceList[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 80.h,
                        width: 90.w,
                      ),
                      SizedBox(
                          height: 12.h), // Space between the image and the text
                      Text(
                        toolsServiceList[index]
                            .name, // Replace with your text property
                        style: TextStyle(
                          fontSize: 15.sp, // Adjust font size as needed
                          fontWeight: FontWeight.w500,
                          color: Colors.black, // Text color
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }),
            )



      ],),
    ),
    );
  }
}
