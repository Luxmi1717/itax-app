import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';

class GSPSetupPage extends StatelessWidget {
  const GSPSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: const Text('GSP Setup', style: TextStyle(color: Colors.black, fontSize: 18)),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
                       onPressed: () => GoRouter.of(context).go('/home'),

            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Logout GSP',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('GSP Details', style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 241, 241),
                        borderRadius: BorderRadius.circular(10),
                       
                      ),
                      child: const Column(
                        children: [
                          Row(children: [
                            Text('GSP Username: '),
                            Spacer(),
                            Text('shaiz@0703')
                          ],),
                          SizedBox(height: 15,),
                          Row(
                          children: [
                            Text('GSP Password: '),
                            Spacer(),
                            Text('***************')
                          ],
                        )
                        ],
                      ),
                    )

                ]))));
  }
}
