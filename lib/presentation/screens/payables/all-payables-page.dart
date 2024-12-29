import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/receivables-and-payables-screens/widgets/receivable-ageing-tile-widget.dart';
import 'package:itax/presentation/screens/receivables-and-payables-screens/widgets/receivables-customer-tile-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-1-tile.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-2-tile.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';

class AllPayablesPage extends StatefulWidget {
  const AllPayablesPage({super.key});

  @override
  _SalesMonthlyPageState createState() => _SalesMonthlyPageState();
}

class _SalesMonthlyPageState extends State<AllPayablesPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Rs 50,21,333',
        subtitle: 'Total Amount',
        pageTitle: 'Payables',
        onBackPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
ReceivablesCustomerTileWidget(
                ifShowWhatsapp: false,
                leadingText: 'Monu Pathak',
                title1: 'Credit days',
                subtitle1: '10 Days',
                title2: 'Avg Day',
                subtitle2: '60 Days',
                bottomText: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
                trailingText: '₹ 1,02,500'),
                ReceivablesCustomerTileWidget(
                ifShowWhatsapp: false,
                leadingText: 'Monu Pathak',
                title1: 'Credit days',
                subtitle1: '10 Days',
                title2: 'Avg Day',
                subtitle2: '60 Days',
                bottomText: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
                trailingText: '₹ 1,02,500')
            
            
            
            
            
          ],
        ),
      ),
    );
  }
}


