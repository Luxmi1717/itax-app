import 'dart:ui';

class NavigationDrawerModel{
  int? id;
  String ?title;
  String ?icon;
  Color ?textColor;
  Color ?iconColor;
  bool isSelected;
  List<NavChildItem>? navChildItem;
  NavigationDrawerModel({this.id,this.title,this.icon,this.iconColor,this.textColor,
    required this.isSelected,this.navChildItem});
}

class NavChildItem{
  int? id;
  String ?title;
  String ?icon;
  Color ?textColor;
  Color ?iconColor;
  bool isSelected;
  NavChildItem({this.id,this.title,this.icon,this.iconColor,
    this.textColor,required this.isSelected});

}
