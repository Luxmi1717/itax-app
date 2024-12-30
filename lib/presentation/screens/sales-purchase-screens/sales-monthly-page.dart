import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sales-options-slider.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sort-by-slider-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-1-tile.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-2-tile.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';

class SalesMonthlyPage extends StatefulWidget {
  const SalesMonthlyPage({super.key});

  @override
  _SalesMonthlyPageState createState() => _SalesMonthlyPageState();
}

class _SalesMonthlyPageState extends State<SalesMonthlyPage> {
  final List<String> tags = [
    "Monthly",
    "Customers",
    "Paid",
    "Unpaid",
    "e-way Bills"
  ];
  int selectedIndex = 0;

  final Map<int, Widget> content = {
    0: const MonthlySection(),
    1: const CustomersSection(),
    2: const Text("Monthly sales data", style: TextStyle(fontSize: 18)),
    3: const Text("Quarterly sales data", style: TextStyle(fontSize: 18)),
    4: const Text("Yearly sales data", style: TextStyle(fontSize: 18)),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Rs 50,21,333',
        subtitle: 'Total sales',
        pageTitle: 'Sales',
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
      body: Column(
        children: [
          // Horizontal Scrollable Tags
          Container(
            height: 40.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                        color: isSelected ? mainBlueColor : (Colors.grey[300] ?? Colors.grey),
                        width: 1.0,
                      ),
                      color: isSelected ? const Color.fromARGB(255, 221, 232, 248) : Colors.grey[300],
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(children: [
              Icon(Icons.calendar_today, color: mainBlueColor,),
              Text('Financial Year', style: TextStyle(color: blackColor, fontSize: 14)),
              Text(' (1Apr 24 to 31 Mar 25)'),
              Spacer(),
              Text('Change', style: TextStyle(color: mainBlueColor, fontSize: 14)),
              
            
            ],),
          ),

          const Divider(thickness: 3),

          // Dynamic Content Area
          Expanded(
            child: Center(
              child: content[selectedIndex] ?? const Text("No data available"),
            ),
          ),
        ],
      ),
    );
  }
}


class MonthlySection extends StatelessWidget {
  const MonthlySection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TileTypeOne(leadingText: 'Money', trailingText: 
          'Rs 50,21,333', onTap: (){
            GoRouter.of(context).go('/sales-on-day');

          },),
          TileTypeOne(leadingText: 'Money', trailingText: 'Rs 50,21,333', onTap: (){
            GoRouter.of(context).go('/sales-on-day');

          },),
          TileTypeOne(leadingText: 'Money', trailingText: 'Rs 50,21,333', onTap: (){
            GoRouter.of(context).go('/sales-on-day');

          },),
          
          
        ],
      ),
    );
  }
}

class CustomersSection extends StatelessWidget {
  const CustomersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TileTypeTwo(leadingText: 'Monu Pathak', subText: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5', trailingText: '₹ 7,20,200', onTap: (){
            GoRouter.of(context).go('/sales-per-user');
          },),
                    TileTypeTwo(
              leadingText: 'Sanjay Sharma',
              subText: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
              trailingText: '₹ 28,305', onTap: (){
            GoRouter.of(context).go('/sales-per-user');
              }),

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
