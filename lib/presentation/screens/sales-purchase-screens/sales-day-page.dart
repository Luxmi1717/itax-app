import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/date-filter-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sales-options-slider.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sort-by-slider-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-3-tile.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';

class SalesOnDayPage extends StatefulWidget {
  const SalesOnDayPage({super.key});

  @override
  State<SalesOnDayPage> createState() => _SalesOnDayPageState();
}

class _SalesOnDayPageState extends State<SalesOnDayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Rs 50,21,333',
        subtitle: 'Total sales',
        pageTitle: 'Sales',
        onBackPressed: () {
          GoRouter.of(context).push('/home');
        },
        onSortPressed: () {
          openBottomSheet(context, const SortByOptionsSlider());
        },
        onMorePressed: () {
          openBottomSheet(context, const SalesOptionsSlider());
        },
      ),
      body: Column(
        children: [
          // Horizontal Scrollable Tags

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: InkWell(
              onTap: () {
                openBottomSheet(context, const DateOptionsSlider());
              },
              child: const Row(
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
          ),

          const Divider(thickness: 3),

          // Dynamic Content Area
          const Expanded(
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
              leadingText1: '#123',
              leadingText2: '14 Nov\'24',
              leadingText3: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
              trailingText: '₹ 1,28,300',
              ifTrailingContainer: true,
              trailingContainerContent: 'Paid',
              ifGreen: true)
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
