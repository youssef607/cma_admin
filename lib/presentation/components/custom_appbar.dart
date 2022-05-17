import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({List<Widget>? actions}) {
  return AppBar(
    backgroundColor: ColorManager.primary,
    title: Row(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: AppMargin.m8),
            child: Icon(
              IconManger.appIcon,
              color: ColorManager.white,
              size: AppSize.s30,
            )),
        SizedBox(width: AppPadding.p20),    
        Text(AppStrings.appName,
            style: getBoldStyle(
                color: ColorManager.white, fontSize: FontSize.s20)),
      ],
    ),
    actions: actions??[],
  );
}
