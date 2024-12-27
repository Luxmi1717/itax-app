import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/type-4-tile.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';

class ReceiptPerUserPage extends StatefulWidget {
  const ReceiptPerUserPage({super.key});

  @override
  State<ReceiptPerUserPage> createState() => _SalesOnDayPageState();
}

class _SalesOnDayPageState extends State<ReceiptPerUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Rs 7,21,333',
        subtitle: 'Total Receipt',
        pageTitle: 'Monu Pathak',
        onBackPressed: () {},
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
          TileTypeFour(
              leadingText1: '#123',
              leadingText2: '14Nov\'24',
              trailingText: '₹ 30,500',
              ifLeadingContainer: true,
              trailingContainerContent: 'Unpaid',
              ifGreen: false)
        ],
      ),
    );
  }
}
