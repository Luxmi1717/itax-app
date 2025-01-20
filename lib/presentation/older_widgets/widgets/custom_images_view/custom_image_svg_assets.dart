import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageSVGAssetsView extends StatelessWidget{
  final String imagesAssets;

  final double ?width;
  final double ?height;
  final EdgeInsets ?margin;
  final EdgeInsets ?padding;

  final double ?imgWidth;
  final double ?imgHeight;
   final BoxFit ?fit;
   final Alignment ?alignment;
   final Color ?color;

   final void Function()? onTap;
  const CustomImageSVGAssetsView({super.key,
    required this.imagesAssets,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.onTap,
    this.fit,
    this.imgWidth,
    this.imgHeight,
    this.alignment,
    this.color
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment:alignment,
        child: SvgPicture.asset(
          imagesAssets,
          height: imgHeight,
          width: imgWidth,
          fit: fit??BoxFit.none,
          color:color,
          //height: 193,width: 184,
        ),
      ),
    );
  }


}