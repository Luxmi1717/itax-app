import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('More', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromRGBO(76, 176, 80, 1),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Premium Membership',
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                    Text('Upgrade for more features',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('My Companies'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
                        Divider(color: Colors.grey,  thickness: 0.1,),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Manage User'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
                                    Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('GSP Setup'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Other',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help and Support'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
                                    Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),

            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
                                    Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
                                    Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
