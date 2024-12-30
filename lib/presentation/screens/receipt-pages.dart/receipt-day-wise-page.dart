import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-3-tile.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';

class ReceiptDayWisePage extends StatefulWidget {
  const ReceiptDayWisePage({super.key});

  @override
  State<ReceiptDayWisePage> createState() => _SalesOnDayPageState();
}

class _SalesOnDayPageState extends State<ReceiptDayWisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '₹ 11,200',
        subtitle: 'Total Receipt',
        pageTitle: 'Receipt(Nov 2024)',
        onBackPressed: () {
          GoRouter.of(context).go('/home');
        },
      ),
      body: const Column(
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
          TileTypeThree(
              leadingText1: '#5',
              leadingText2: '5 Nov\'24',
              leadingText3: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
              trailingText: '₹ 1,28,300',
              ifTrailingContainer: true,
              trailingContainerContent: 'Unpaid',
              ifGreen: false)
        ],
      ),
    );
  }
}
