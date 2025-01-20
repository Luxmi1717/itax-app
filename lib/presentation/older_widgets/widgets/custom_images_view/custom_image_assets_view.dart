import 'package:flutter/material.dart';

class CustomImageAssetsView extends StatelessWidget{
  final String imagesAssets;

  final double ?width;
  final double ?height;
   final BoxFit ?fit;
   final Color ?color;

   final void Function()? onTap;
  const CustomImageAssetsView({super.key,
    required this.imagesAssets,
    this.width,
    this.height,
    this.onTap,
    this.fit,
    this.color
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        imagesAssets,
        fit: fit,
        color:color,
        height: height,width: width,
      ),
    );
  }


}