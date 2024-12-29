import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/e-way-bill/slider-widgets/gsp-login-slider.dart';

class GSPSetupLoginPage extends StatelessWidget {
  const GSPSetupLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('GSP Setup', style: TextStyle(color: Colors.black, fontSize: 18)),
        actions:  [
          InkWell(
            onTap: (){
              openBottomSheet(context, GspLoginSlider());
            },
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Login',
                style: TextStyle(color: mainBlueColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/login-gsp.png'),
            ],
        ),
            ),
      ));
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
