import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itax/config_old/Appcolor.dart';

import '../text_view/text_view.dart';


class EditTextFormField extends StatelessWidget{
  final TextInputType textInputType;
  final String ?labelText;
  final TextStyle ?labelStyle;
  final TextStyle ?hintStyle;
  final TextStyle ?textStyle;
  final double ?width;
  final double ?height;
  final String ?hintText;
  final bool ?enabled;
  final bool ?textErrorEnable;
  final String ?textErrorMSG;

  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  final int ?maxLength;
  final Color ?borderColor;
  final Color? backgroundColor;
  final double ?radius;
  final Widget ?suffixIcon;
  final Widget ?prefix;
  final EdgeInsets ?contentPadding;
  final TextCapitalization ?textCapitalization;


  const EditTextFormField({super.key,
    required this.textInputType,
    this.labelText,
    this.hintText,
    this.validator,
    required this.controller,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.radius,
    this.maxLength,
    this.inputFormatters,
    this.borderColor,
    this.backgroundColor,
    this.height,
    this.width,
    this.enabled,
    this.suffixIcon,
    this.prefix,
    this.contentPadding,
    this.onChanged,
    this.onTap,
    this.textErrorEnable,
    this.textErrorMSG,
    this.textCapitalization
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.fromLTRB(1, 0, 0, 5),
      // padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 0.h),
      width: width??342,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: width??342,
           // height: height??42,
            // decoration: BoxDecoration (
            //   color: backgroundColor??AppColor.borderWhiteColor,
            //   borderRadius: BorderRadius.circular(radius??8),
            //   border: textErrorEnable==true?Border.all(width: 0.5,color: AppColor.redColor):
            //   Border.all(width: 0.8,color: borderColor??AppColor.borderWhiteColor),
            //   boxShadow: const [
            //     BoxShadow(
            //       color:AppColor.borderBoxShadowWhiteColor,
            //       offset: Offset(0, 4),
            //       blurRadius: 2,
            //     ),
            //   ],
            // ),
            alignment: Alignment.centerLeft,
            child: TextFormField(
              keyboardType: textInputType,
              inputFormatters: inputFormatters,
              controller: controller,
              autofocus: false,
              showCursor: true,
              // readOnly: true,

              enabled:enabled,
              onTap: onTap,
              maxLength: maxLength,
              textCapitalization:textCapitalization??TextCapitalization.none,
              onChanged:onChanged,
              validator: validator,

              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius??12),
                      borderSide:  BorderSide(color:borderColor??AppColor.borderWhiteColor)
                  ),
                contentPadding:contentPadding??const EdgeInsets.fromLTRB(10, 15, 10, 15),
                counterText: '',
                labelText: labelText,
                hintText: hintText,
                  filled: true,
                  fillColor: Colors.white,
                prefix: prefix,
               // border: InputBorder.none,
                suffixIcon: suffixIcon

              ),
            )),
          textErrorEnable==true?Container(
            margin: const EdgeInsets.only(left: 2,top:2,),
            child: TextView(
              text:'$textErrorMSG',
              overflow: true,
              maxLines: 5,
            ),
          ):Container(),
        ],
      ),
    );
  }

}