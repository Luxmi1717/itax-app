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
              icon: Icon(Icons.search, color: blackColor),
              onPressed: () {},
            ),
          ),
        ],
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('My Companies', style: TextStyle(color: Colors.black, fontSize: 20)),
        
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
  onPressed: () {},
  label: Text('Add Company', style: TextStyle(color: whiteColor),),
  icon: Icon(Icons.business, color: whiteColor,),
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
              leading: Icon(Icons.business, color: mainBlueColor,),
              title: Text('Demo Company'),
              trailing: Icon(Icons.delete_forever, color: Colors.red,),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.1),
             ListTile(
              tileColor: whiteColor,
              leading: Icon(Icons.business, color: mainBlueColor,),
              title: Text('Shaiz Enterprises'),
              trailing: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.1,)
          ],
        ),
      ),
      


    );
  }
}