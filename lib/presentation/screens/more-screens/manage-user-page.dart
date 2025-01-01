import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/more-screens/slider-widgets/add-user-slider-widget.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              icon:  Icon(Icons.search, color: blackColor, size: 35.sp,),
              onPressed: () {},
            ),
          ),
        ],
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Text('Manage User', style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold)),
        
      ),
      

      body: Stack(
        children: [
          
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                 ListTile(
                    tileColor: const Color.fromARGB(255, 228, 239, 255),
                    leading: const CircleAvatar(
                      backgroundColor: mainBlueColor,
                      child: Icon(Icons.person),
                    ),
                    title:  Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Text(
                          'Shahbaz Alam',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          '851684900 | Admin',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: const SizedBox(
                      width: 80, // Limit the width of the trailing row
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.edit,
                            color: mainBlueColor,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
            
                  const SizedBox(height: 25,), 
            
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20.w,),
                      Text('Other Members', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                    ],
                  ),
                   SizedBox(height: 10.h,),
            
            
                  ListTile(
                    tileColor: whiteColor,
                    leading:  CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.person),
                    ),
                    title:  Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Text(
                          'Pawan Gupta',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          '851684900 | Sub User | Edit',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: const SizedBox(
                      width: 80, // Limit the width of the trailing row
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.edit,
                            color: mainBlueColor,
                          ),
                          SizedBox(width: 8), // Space between icons
                          Icon(Icons.delete_forever, color: Colors.red),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
            ListTile(
                    tileColor: whiteColor,
                    leading:  CircleAvatar(
                     backgroundColor: Colors.grey[200],
                      child: Icon(Icons.person),
                    ),
                    title:  Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Text(
                          'Shahbaz Alam',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          '851684900 | Admin',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: const SizedBox(
                      width: 80, // Limit the width of the trailing row
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.edit,
                            color: mainBlueColor,
                          ),
                          SizedBox(width: 8), // Space between icons
                          Icon(Icons.delete_forever, color: Colors.red),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
            
            
            
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.1),
                   
                  
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 100.h, // Adjust the vertical position
              right: 40.w,  // Adjust the horizontal position
              child: FloatingActionButton.extended(
              onPressed: () {
                openBottomSheet(context, AddUserSlider());
              },
              label: const Text(
                'Add User',
                style: TextStyle(color: whiteColor),
              ),
              icon: const Icon(
                Icons.person_add,
                color: whiteColor,
              ),
              backgroundColor: mainBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
        ],
      ),
      


    );
  }
}


void openBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        child: content,
      );
    },
  );
}
