import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText(this.text,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: getBoldStyle(color: ColorManager.black, fontSize:isMobile(context)?FontSize.s18:FontSize.s28));
  }
}