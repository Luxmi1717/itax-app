import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/more-screens/slider-widgets/add-user-slider-widget.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              icon: const Icon(Icons.search, color: blackColor),
              onPressed: () {},
            ),
          ),
        ],
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Manage User', style: TextStyle(color: Colors.black, fontSize: 20)),
        
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    openBottomSheet(context, AddUserSlider());
  },
  label: const Text('Add User', style: TextStyle(color: whiteColor),),
  icon: const Icon(Icons.person_add, color: whiteColor,),
  backgroundColor: mainBlueColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
  ),
),

      body: SingleChildScrollView(
        child: Column(
          children: [
           ListTile(
              tileColor: const Color.fromARGB(255, 228, 239, 255),
              leading: const CircleAvatar(
                backgroundColor: mainBlueColor,
                child: Icon(Icons.person),
              ),
              title: const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    'Shahbaz Alam',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '851684900 | Admin',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
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

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                Text('Other Members', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),


            ListTile(
              tileColor: whiteColor,
              leading: const CircleAvatar(
                backgroundColor: mainBlueColor,
                child: Icon(Icons.person),
              ),
              title: const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    'Pawan Gupta',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '851684900 | Sub User | Edit',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
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
              leading: const CircleAvatar(
                backgroundColor: mainBlueColor,
                child: Icon(Icons.person),
              ),
              title: const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    'Shahbaz Alam',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '851684900 | Admin',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
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
