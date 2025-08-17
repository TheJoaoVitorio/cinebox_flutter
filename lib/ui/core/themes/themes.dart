import 'package:cinebox_app_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_app_flutter/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static get theme => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppcColors.backgroundColor),
    scaffoldBackgroundColor: AppcColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppcColors.backgroundColor,
      titleTextStyle: AppTextStyles.semiBoldMedium.copyWith(
        color: Colors.black,
      ),
    ),
  );
}
