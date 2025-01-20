import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/models/menu_item_model.dart';
import 'package:itax/utility/size_utils.dart';

import 'package:itaxeasy/utility/size_utils.dart';

import '../../../config/Appcolor.dart';
import '../../../config/image_constant.dart';
import '../../../models/menu_item_model.dart';
import '../../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';





class PostOffiecLinks extends StatefulWidget {
  const PostOffiecLinks({super.key});

  @override
  State<PostOffiecLinks> createState() => _PostOffiecLinksState();
}

class _PostOffiecLinksState extends State<PostOffiecLinks> {

  final List<MenuItemModel> _menuItems = [
  MenuItemModel(title: 'PinCode Information', path: '/services/pincode_information', icon: const Icon(Icons.search,),),
  MenuItemModel(title: 'Pin by City', path: '/services/pin_by_city', icon: const Icon(Icons.check_box_outlined,),),


  ];


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final width = size.width;
    int? selectedIndex;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:_buildAppBar(context),
      body:


      Column(
        children: [
          const SizedBox(height:50,),
          SizedBox(
            height: height/3.4,

            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: .5,
                mainAxisExtent: 200,

              ),
              shrinkWrap: true,
              itemCount: _menuItems.length,
              scrollDirection: Axis.horizontal,
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
      text: "Post Office Services",
    ),
  );
}

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Office Services'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListMenuItem(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PineCodeInformationPage()));
              },
              icon: const Icon(
                Icons.link,
                color: Colors.black87,
              ),
              text: 'PinCode Information',
            ),
            const SizedBox(height: 16),
            ListMenuItem(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PinbyCityPage()));

                },
              icon: const Icon(
                Icons.check_box_outlined,
                color: Colors.black87,
              ),
              text: 'Pin by City',
            ),
            const SizedBox(height: 16),
            // ListMenuItem(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const PostofficebyCiyPage()));
            //
            //
            //   },
            //   icon: const Icon(
            //     Icons.link,
            //     color: Colors.black87,
            //   ),
            //   text: 'PostOffice by City',
            // ),
            // const SizedBox(height: 16),


          ],
        ),
      ),
    );
  }
}*/
