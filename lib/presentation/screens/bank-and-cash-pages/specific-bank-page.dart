
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/bank-tile-widget.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';
import 'package:itax/presentation/widgets/blue_button.dart';

class SpecificBankPage extends StatefulWidget {
  const SpecificBankPage({super.key});

  @override
  State<SpecificBankPage> createState() => _SalesOnDayPageState();
}

class _SalesOnDayPageState extends State<SpecificBankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 24.w),
        
       
        
        child: BlueButton(title: 'add/reduce money', onPressed: (){})
      ),
      appBar: CustomAppBar(
          title: '₹ 27,08,015', subtitle: 'Total Balance', pageTitle: 'State Bank of India'),
      body:  Column(
        children: [
          // Horizontal Scrollable Tags

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: mainBlueColor,
                ),
                Text('Financial Year',
                    style: TextStyle(color: blackColor, fontSize: 14)),
                Text(' (1Apr 24 to 31 Mar 25)'),
                Spacer(),
                Text('Change',
                    style: TextStyle(color: mainBlueColor, fontSize: 14)),
              ],
            ),
          ),

          Divider(thickness: 3),

          // Dynamic Content Area
          Expanded(
            child: CustomersSection(),
          ),
          // BlueButton(title: 'Add/Reduce Money', onPressed: () {}),
        ],
      ),
    );
  }
}

class CustomersSection extends StatelessWidget {
  const CustomersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BankTile(leadingText1: 'Monu Pathak', leadingText2: '14 Nov 24', leadingText3: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5', leadingContainerText: 'Payment', trailingText: '+ ₹ 1,28,300', trailingTextColor: Colors.green),
                    BankTile(
              leadingText1: 'Monu Pathak',
              leadingText2: '14 Nov 24',
              leadingText3: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
              leadingContainerText: 'Receipt',
              trailingText: '- ₹ 1,28,300',
              trailingTextColor: Colors.red),

        ],
      ),
    );
  }
}
