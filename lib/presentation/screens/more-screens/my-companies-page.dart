import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';

class MyCompaniesPage extends StatelessWidget {
  const MyCompaniesPage({super.key});

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
        title: const Text('My Companies', style: TextStyle(color: Colors.black, fontSize: 20)),
        
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
  onPressed: () {},
  label: const Text('Add Company', style: TextStyle(color: whiteColor),),
  icon: const Icon(Icons.business, color: whiteColor,),
  backgroundColor: mainBlueColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
  ),
),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              tileColor: whiteColor,
              leading: const Icon(Icons.business, color: mainBlueColor,),
              title: const Text('Demo Company'),
              trailing: const Icon(Icons.delete_forever, color: Colors.red,),
              onTap: () {},
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.1),
             ListTile(
              tileColor: whiteColor,
              leading: const Icon(Icons.business, color: mainBlueColor,),
              title: const Text('Shaiz Enterprises'),
              trailing: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onTap: () {},
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.1,)
          ],
        ),
      ),
      


    );
  }
}