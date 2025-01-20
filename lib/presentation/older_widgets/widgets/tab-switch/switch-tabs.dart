import 'package:flutter/material.dart';
import 'package:itax/utility/size_utils.dart';

class PricingStockTabFormWidget extends StatefulWidget {
  final List<String> tabNames;
  final List<Widget> tabContents;

  const PricingStockTabFormWidget({
    super.key,
    required this.tabNames,
    required this.tabContents,
  })  : assert(tabNames.length == tabContents.length);

  @override
  _PricingStockTabFormWidgetState createState() =>
      _PricingStockTabFormWidgetState();
}

class _PricingStockTabFormWidgetState extends State<PricingStockTabFormWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabNames.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: widget.tabNames.map((tabName) => Tab(text: tabName)).toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 600.h, // Adjust the height according to your layout
            child: TabBarView(
              controller: _tabController,
              children: widget.tabContents,
            ),
          ),
        ),
      ],
    );
  }
}
