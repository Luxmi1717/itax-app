import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/receivables-and-payables-screens/widgets/receivable-ageing-tile-widget.dart';
import 'package:itax/presentation/screens/receivables-and-payables-screens/widgets/receivables-customer-tile-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sales-options-slider.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sort-by-slider-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-1-tile.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-2-tile.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';

class ReceivablesPage extends StatefulWidget {
  const ReceivablesPage({super.key});

  @override
  _SalesMonthlyPageState createState() => _SalesMonthlyPageState();
}

class _SalesMonthlyPageState extends State<ReceivablesPage> {
  final List<String> tags = [
    
    "Customers",
    'Ageing Summary',
  ];
  int selectedIndex = 0;

  final Map<int, Widget> content = {
   
    0: const CustomersSection(),
    1: const AgeinSummarySection(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Rs 50,21,333',
        subtitle: 'Total Amount',
        pageTitle: 'Receivables',
        onBackPressed: () {},
        onSortPressed: () {
          openBottomSheet(context, const SortByOptionsSlider());
        },
        onMorePressed: () {
          openBottomSheet(context, const SalesOptionsSlider());
        },
      ),
      body: Column(
        children: [
          
          Container(
            height: 40.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.center,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tags.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? mainBlueColor
                                : (Colors.grey[300] ?? Colors.grey),
                            width: 1.0,
                          ),
                          color: isSelected
                              ? const Color.fromARGB(255, 221, 232, 248)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          tags[index],
                          style: TextStyle(
                            color: isSelected ? mainBlueColor : Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          

          const Divider(thickness: 3),

          // Dynamic Content Area
          Expanded(
            child: content[selectedIndex] ?? const Text("No data available"),
          ),
        ],
      ),
    );
  }
}

class AgeinSummarySection extends StatelessWidget {
  const AgeinSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ReceivablesAgeingTileWidget(
            topLeftText: "Monu Pathak",
            topRightText: "₹ 1,02,500",
            titleSubtitleList: [
              {'title': '1-45 days ', 'subtitle': '₹ 69,500'},
              {'title': '46-90 days', 'subtitle': '₹ 71,800'},
              {'title': '91-180 days', 'subtitle': '₹ 0.00'},
              {'title': '180+ days', 'subtitle': '₹ 0.00'},
            ],
            bottomText: "Mob: 8825464741  |  GST: 22AAAAA0000A1Z5",
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
          ReceivablesCustomerTileWidget(leadingText: 'Monu Pathak', title1: 'Credit days', subtitle1: '10 Days', title2: 'Avg Day', subtitle2: '60 Days', bottomText: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5', trailingText: '₹ 1,02,500', ifShowWhatsapp: true,),
                    ReceivablesCustomerTileWidget(
                      ifShowWhatsapp: true,
              leadingText: 'Monu Pathak',
              title1: 'Credit days',
              subtitle1: '10 Days',
              title2: 'Avg Day',
              subtitle2: '60 Days',
              bottomText: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
              trailingText: '₹ 1,02,500')

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
