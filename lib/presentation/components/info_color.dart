import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/components/color_column.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class InfoColor extends StatelessWidget {
  final Color color;
  const InfoColor({ Key? key,required this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(AppStrings.color+" :",
        style: getSemiBoldStyle(color: ColorManager.black, 
               fontSize:isMobile(context)?FontSize.s13:FontSize.s16)),
      SizedBox(
        width: AppSize.s10,
      ),
      ColorColumn(color),
    ]);
  }
}