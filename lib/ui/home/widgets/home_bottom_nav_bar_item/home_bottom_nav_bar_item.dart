import 'package:cinebox_app_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class HomeBottomNavBarItem extends BottomNavigationBarItem {
  HomeBottomNavBarItem({
    required Icon activeAsset,
    required Icon inativeAsset,
    required String label,
    Color activeColor = AppcColors.colorPrimary,
    Color inactiveColor = Colors.grey,
    double iconWidth = 20,
    double iconHeight = 20,
    double marginTop = 10,
  }) : super(
         icon: Container(
           margin: EdgeInsets.only(top: marginTop),
           child: Icon(inativeAsset.icon, size: iconWidth, color: Colors.grey),
         ),
         activeIcon: Container(
           margin: EdgeInsets.only(top: marginTop),
           child: Icon(activeAsset.icon, size: iconWidth, color: activeColor),
         ),
         label: label,
       );
}
