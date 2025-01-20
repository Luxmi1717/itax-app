import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config_old/Appcolor.dart';
import 'package:itax/config_old/image_constant.dart';
import 'package:itax/models/menu_item_model.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:itax/presentation/older_widgets/widgets/app_bar/custom_app_bar.dart';
import 'package:itax/utility/size_utils.dart';

import '../../../older_widgets/widgets/app_bar/appbar_title.dart';





class GSTLinks extends StatefulWidget {
  const GSTLinks({super.key});

  @override
  State<GSTLinks> createState() => _GSTLinksState();
}

class _GSTLinksState extends State<GSTLinks> {

  final List<MenuItemModel> _menuItems = [
    MenuItemModel(title: 'Search by GSTIN', path: '/services/gstin', icon: const Icon(Icons.search,),),
    MenuItemModel(title: 'Search by PAN', path: '/services/pan_Search', icon: const Icon(Icons.search,),),

    MenuItemModel(title: 'Track GST Return', path: '/services/track_gstReturn', icon: const Icon(Icons.link,),),

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
        appBar:_buildAppBar(context),
        body: Column(

          children: [
            const SizedBox(height: 40,),
            SizedBox(
              height: height*.8,
              width: width,
              child:

              GridView.builder(
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
          ],
        ),
      ),

    );
  }
}
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 38.h,
    leading: AppbarLeadingIconbutton(
      onTap: (){
        Navigator.pop(context);
      },
      imagePath: ImageConstant.imgGoBack,
      margin: EdgeInsets.only(
        left: 13.h,
        top: 15.v,
        bottom: 15.v,
      ),
    ),
    centerTitle: true,
    title: AppbarTitle(
      text: "Search by GSTIN",
    ),
  );
}

