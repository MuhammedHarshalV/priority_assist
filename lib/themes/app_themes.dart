import 'package:flutter/material.dart';

import 'package:priority_assist/themes/app_colors.dart';


class Apptheme {
  static ThemeData lighttheme = ThemeData(
    //focus color means button background color
    focusColor: AppColors.appBlack,
    //bottomsheet background color
    cardColor: AppColors.appWhite,
    //scaffold background color
    scaffoldBackgroundColor: AppColors.appWhite,
    //bottomsheet elevated color
    hoverColor: AppColors.appCloseGrey,
    //bottomsheet circle background color
    hintColor: AppColors.appLightGrey,
    //bottomsheet close color
    shadowColor: AppColors.appCloseGrey,
    //notouch color
    splashColor: AppColors.appGrey,

    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.appBlack),
      //focus color means button text color
      labelLarge: TextStyle(color: AppColors.appWhite),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.appBlack,
    focusColor: AppColors.appWhite,
    cardColor: AppColors.appBlack,
    hoverColor: AppColors.appLightGrey,
    hintColor: AppColors.appBottomCircleBlack,
    shadowColor: AppColors.appBottomCircleBlack,
    splashColor: AppColors.appLightGrey,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.appWhite),
      labelLarge: TextStyle(color: AppColors.appBlack),
    ),
  );
}
