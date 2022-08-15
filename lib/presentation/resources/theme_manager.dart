import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      // ripple color
      splashColor: ColorManager.primaryLight,
      // will be used incase of disabled button for example
      // accentColor: ColorManager.grey,
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.lightGrey,
          elevation: AppSize.s1_5),
      dataTableTheme: DataTableThemeData(
        dividerThickness: 0.8,
        dataRowHeight: AppSize.s60,
        headingTextStyle: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s12),
        dataTextStyle: getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),   
      ),    
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s16)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primaryOpacity70),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s4)))),

      // Text theme
      textTheme: TextTheme(
          headline1: getSemiBoldStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s16),
          headline2: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16),
          headline3:
              getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
          headline4: getRegularStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          subtitle1: getMediumStyle(
              color: ColorManager.lightGrey, fontSize: FontSize.s14),
          subtitle2: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          bodyText2: getMediumStyle(color: ColorManager.lightGrey),
          caption: getRegularStyle(color: ColorManager.grey1),
          bodyText1: getRegularStyle(color: ColorManager.grey)),
      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.darkGrey),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        // error style
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.secondryLight, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s4))),

        // focused border
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.secondry, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s4))),

        // error border
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.errorLight, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s4))),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.errorLight, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s4))),
      ));
}
