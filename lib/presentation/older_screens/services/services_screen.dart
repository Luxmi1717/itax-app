import 'package:itax/config_old/Appcolor.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_title.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';

import '/models/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final List<MenuItemModel> _menuItems = [
    MenuItemModel(title: 'GST Links', path: '/services/MCA/gst', icon: const Icon(Icons.shopping_cart,),),
    MenuItemModel(title: 'IncomeTax ', path: '/services/MCA/IncomeTaxLinks', icon: const Icon(Icons.attach_money,),),

    MenuItemModel(title: 'MCA', path: '/services/MCA', icon: const Icon(Icons.apartment_outlined,),),
    MenuItemModel(title: 'Bank', path: '/services/MCA/bank', icon: const Icon(Icons.account_balance_outlined,),),
    MenuItemModel(title: 'Post Office', path: '/services/MCA/postofficelink', icon: const Icon(Icons.local_post_office,),),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int? selectedIndex;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar:_buildAppBar(context),
        body: SizedBox(
          height: height/1.1,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            
            itemCount: _menuItems.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    final path = _menuItems[index].path;

                    context.push(path);
                                    },
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: selectedIndex == index ? AppColor.theamColor : const Color(0xff999999),width: 0.50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), //color of shadow
                                spreadRadius: 1, //spread radius
                                blurRadius: 5, // blur radius
                                // offset: const Offset(0, 2), // changes position of shado
                              ),
                            ],
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Icon(_menuItems[index].icon.icon,color: selectedIndex == index ? AppColor.theamColor : const Color(0xff999999)),
                        ),
                      ),
                      SizedBox(height: height/80),
                      Text(_menuItems[index].title,style: TextStyle(color:  selectedIndex == index ? AppColor.theamColor : const  Color(0xff999999),),)
                    ],
                  ),
                ),
              );
            },  ),
        ),
      ),

    );
  }
}
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    centerTitle: true,
    title: AppbarTitle(
      text: "Services",
    ),
  );
}