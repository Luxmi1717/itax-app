import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';

class CompanyDetailsPage extends StatelessWidget {
  const CompanyDetailsPage({super.key});

  Widget _buildTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Company Details',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: mainBlueColor),
                  onPressed: () {},
                ),
                const Text('Edit',
                    style: TextStyle(color: mainBlueColor, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset('assets/logo.png', height: 100),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('"Where Comfort Powers Performance"',
                    style: TextStyle(fontSize: 14,color: Colors.grey)),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            _buildTile('Business Name', 'Shaiz Enterprise'),
            _buildTile('GST Number', '22AAAAA0000A1Z5'),
            _buildTile('Aadhar Number', '999941057058'),
            _buildTile('PAN Number', 'ABCTY1234D'),
            _buildTile('Mobile Number', '8466232323'),
            _buildTile('Email ID', 'shaiz0702@gmail.com'),
            _buildTile('Registration Number', '123456789'),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),

            const Padding(padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Business Adress', style: TextStyle(fontSize: 20, color: blackColor, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('Akshya Nagar 1st Block 1st Cross, Rammurthy nagar',
                    style: TextStyle(fontSize: 12, )),
                                    SizedBox(height: 4),

                    Row(children: [
                      Text('State:',style: TextStyle(color: Colors.grey),),
                                            Text(
                        'Karnataka:',
                        style: TextStyle(color: Colors.black),
                      ),



                    ],),
                    Row(
                    children: [
                      Text(
                        'Pincode:',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '560016:',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
