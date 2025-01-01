import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';

class GSPSetupPage extends StatelessWidget {
  const GSPSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
            bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: const Color.fromARGB(255, 218, 218, 218),
              height: 1.0,
            ),
            ),
          backgroundColor: whiteColor,
          title:  Text('GSP Setup',
              style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold)),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => GoRouter.of(context).push('/home'),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Logout GSP',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 27),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                       Text('GSP Details', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                       SizedBox(
                        height: 32.h,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Column(
                          children: [
                            Row(
                              children: [
                                Text('GSP Username: ', style: TextStyle(fontSize: 16.sp,)),
                                Spacer(),
                                Text('shaiz@0703', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text('GSP Password: ', style: TextStyle(
                                        fontSize: 16.sp,
                                       )),
                                Spacer(),
                                Text('***************', style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      )
                    ]))));
  }
}
