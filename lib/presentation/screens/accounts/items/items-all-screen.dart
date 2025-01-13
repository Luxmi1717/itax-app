import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/accounts/widgets/app-bar-all-items.dart';
import 'package:itax/presentation/screens/accounts/widgets/items-tile.dart';

class AllItemsScreen extends StatefulWidget {
  const AllItemsScreen({Key? key}) : super(key: key);

  @override
  State<AllItemsScreen> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends State<AllItemsScreen> {
  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (selectedIndex) {
      case 0:
        content = const AllItemsContent();
        break;
      case 1:
        content = const InStockContent();
        break;
      case 2:
        content = const OutOfStockContent();
        break;
      default:
        content = const AllItemsContent();
    }

    return Scaffold(
      appBar: AllItemsAppBar(
        selectedIndex: selectedIndex,
        onTabSelected: onTabSelected,
      ),
      body: Expanded(
          child: Stack(
        children: [
          Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 15.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.w),
                      ),
                    ),
                  ),

                  SizedBox(
                      width: 10
                          .w), // Add spacing between the search field and the container
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    height: 50.h, // Same height as the search field
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/sort.png', // Replace with your image asset path
                        fit: BoxFit.cover,
                        height: 30
                            .h, // Ensure the image fits well within the container
                        width: 30.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            content
          ]),
          Positioned(
            bottom: 30.h,
            right: 20.w,
            child: InkWell(
              onTap: () {
                GoRouter.of(context).go('/add-new-items');
              },
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: mainBlueColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Center(
                    child:SvgPicture.asset('assets/images/itax-icons/accounts-icons/buy.svg', height: 18.h, width: 18.w,),
                  ),
                  Text(
                    'Add Item',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
                        ),
            ),)
        ],
      )),
    );
  }
}

// Widgets for redering the content of the screens
class AllItemsContent extends StatelessWidget {
  const AllItemsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ItemsTile(
              productName: 'Adidas',
              salesPrice: 20,
              purchasePrice: 20,
              currentStock: 20,
              onTap: (){
                GoRouter.of(context).go('/item-details');
              },),
          ItemsTile(
              productName: 'Puma',
              salesPrice: 120,
              purchasePrice: 20,
              currentStock: 20,
               onTap: () {
              GoRouter.of(context).go('/item-details');
            },
          ),
          ItemsTile(
              productName: 'Nike',
              salesPrice: 20,
              purchasePrice: 20,
              currentStock: 20,
               onTap: () {
              GoRouter.of(context).go('/item-details');
            },
          ),
        ],
      ),
    );
  }
}

class InStockContent extends StatelessWidget {
  const InStockContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ItemsTile(
              productName: 'Nike',
              salesPrice: 20,
              purchasePrice: 20,
              currentStock: -20,
               onTap: () {
              GoRouter.of(context).go('/item-details');
            },
          ),
          ItemsTile(
              productName: 'Sparx',
              salesPrice: 20,
              purchasePrice: 40,
              currentStock: -45,
               onTap: () {
              GoRouter.of(context).go('/item-details');
            },
          ),
          ItemsTile(
              productName: 'Nike',
              salesPrice: 20,
              purchasePrice: 20,
              currentStock: 20,
               onTap: () {
              GoRouter.of(context).go('/item-details');
            },
          ),
        ],
      ),
    );
  }
}

class OutOfStockContent extends StatelessWidget {
  const OutOfStockContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ItemsTile(
              productName: 'Nike',
              salesPrice: 20,
              purchasePrice: 20,
              currentStock: 20,
               onTap: () {
              GoRouter.of(context).go('/item-details');
            },
          ),
          ItemsTile(
              productName: 'Nike',
              salesPrice: 20,
              purchasePrice: 20,
              currentStock: 20,
               onTap: () {
              GoRouter.of(context).go('/item-details');
            },
          ),
          ItemsTile(
              productName: 'Nike',
              salesPrice: 20,
              purchasePrice: 20,
              currentStock: 20,
               onTap: () {
              GoRouter.of(context).go('/item-details');
            },
          ),
        ],
      ),
    );
  }
}
