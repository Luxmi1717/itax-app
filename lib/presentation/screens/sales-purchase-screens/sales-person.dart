import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sales-options-slider.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sort-by-slider-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-4-tile.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';

class SalesPerUserPage extends StatefulWidget {
  const SalesPerUserPage({super.key});

  @override
  State<SalesPerUserPage> createState() => _SalesOnDayPageState();
}

class _SalesOnDayPageState extends State<SalesPerUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Rs 7,21,333',
        subtitle: 'Total sales',
        pageTitle: 'Monu Pathak',
        onBackPressed: () {
          GoRouter.of(context).go('/home');
        },
        onSortPressed: () {
          openBottomSheet(context, const SortByOptionsSlider());
        },
        onMorePressed: () {
          openBottomSheet(context, const SalesOptionsSlider());
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
