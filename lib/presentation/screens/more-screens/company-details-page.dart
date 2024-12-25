import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';

class CompanyDetailsPage extends StatelessWidget {
  const CompanyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Company Details', style: TextStyle(color: Colors.black, fontSize: 20)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: mainBlueColor),
                  onPressed: () {},
                ),
                Text('Edit', style: TextStyle(color: mainBlueColor, fontSize: 16)),
              ],
            ),
          ),
        ],
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
              trailing: Icon(Icons.delete_forever, color: Colors.red,),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.1),
          ],
        ),
    ));
  }
}