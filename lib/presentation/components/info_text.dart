import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String text;
  final String value;
  final Color? color;
  const InfoText({ Key? key,required this.text,required this.value, this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(text+ " :", style: getSemiBoldStyle(color: ColorManager.black,fontSize:isMobile(context)?FontSize.s13:FontSize.s16)),
      SizedBox(
        width: AppSize.s10,
      ),
      Text(value,style: getMediumStyle(color: color ?? ColorManager.lightGrey,fontSize:isMobile(context)?FontSize.s12:FontSize.s14)),
    ]);
  }
}