import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/bank-tile-widget.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/widgets/add-reduce-money-slider.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sales-options-slider.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sort-by-slider-widget.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';
import 'package:itax/presentation/widgets/blue_button.dart';

class CashInOfficePage extends StatefulWidget {
  const CashInOfficePage({super.key});

  @override
  State<CashInOfficePage> createState() => _SalesOnDayPageState();
}

class _SalesOnDayPageState extends State<CashInOfficePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 24.w),
          child: BlueButton(
              title: 'Add/Reduce Money',
              onPressed: () {
                GoRouter.of(context).push('/bank-add-money');
              })),
      appBar: CustomAppBar(
          title: '₹ 27,08,015',
          subtitle: 'Total Balance',
          pageTitle: 'Cash in Office',
          onMorePressed: () {
            openBottomSheet(context, const SalesOptionsSlider());
          },
          onSortPressed: () {
            openBottomSheet(context, const SortByOptionsSlider());
          },
          onBackPressed: () {
            GoRouter.of(context).push('/home');
          }),
      body: Column(
        children: [
          // Horizontal Scrollable Tags

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.h),
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
          BankTile(
              leadingText1: 'Monu Pathak',
              leadingText2: '14 Nov 24',
              leadingText3: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
              leadingContainerText: 'Payment',
              trailingText: '+ ₹ 1,28,300',
              trailingTextColor: Colors.green),
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
