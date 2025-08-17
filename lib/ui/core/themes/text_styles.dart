import 'package:cinebox_app_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static final titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final subtitleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final regularSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final regularMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final boldSmall = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  static final boldMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final semiBoldMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final boldLarge = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

  static final lightGreyRegular = TextStyle(
    fontSize: 14,
    color: AppcColors.lightGrey,
  );

  static final lightGreySmall = TextStyle(
    fontSize: 12,
    color: AppcColors.lightGrey,
  );

  static final errorText = TextStyle(
    fontSize: 14, 
    color: AppcColors.redColor
  );

  static var appBarTitleStyle;
}
