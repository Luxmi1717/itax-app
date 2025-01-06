import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import '../../../models/menu_item_model.dart';


class GSTLinks extends StatefulWidget {
  const GSTLinks({super.key});

  @override
  State<GSTLinks> createState() => _GSTLinksState();
}

class _GSTLinksState extends State<GSTLinks> {
  final List<MenuItemModel> _menuItems = [
    MenuItemModel(
      title: 'Search by GSTIN',
      path: '/services/gstin',
      icon: const Icon(
        Icons.search,
      ),
    ),
    MenuItemModel(
      title: 'Search by PAN',
      path: '/services/pan_Search',
      icon: const Icon(
        Icons.search,
      ),
    ),
    MenuItemModel(
      title: 'Track GST Return',
      path: '/services/track_gstReturn',
      icon: const Icon(
        Icons.link,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    int? selectedIndex;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: height * .8,
              width: width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 130,
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: .5,
                ),
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(.0),
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
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: selectedIndex == index
                                        ? mainBlueColor
                                        : const Color(0xff999999),
                                    width: 0.50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 5, // blur radius
                                    // offset: const Offset(0, 2), // changes position of shado
                                  ),
                                ],
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Icon(_menuItems[index].icon.icon,
                                  color: selectedIndex == index
                                      ? mainBlueColor
                                      : const Color(0xff999999)),
                            ),
                          ),
                          SizedBox(height: height / 80),
                          Text(
                            _menuItems[index].title,
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? mainBlueColor
                                  : const Color(0xff999999),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.mainGradient,
      ),
    ),
    leading: Icon(Icons.arrow_back_ios_new),
    title:  Text('GST Services',
        style: TextStyle(fontSize: 16.sp, color: Colors.white)),
  );
}
