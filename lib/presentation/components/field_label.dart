import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  final String text;
  final bool isRequired;
  const FieldLabel(this.text,{Key? key,this.isRequired = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p8),
      child: RichText(
          text: TextSpan(
              style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s15),
              text: text,
              children: [
            TextSpan(text: isRequired?"  *":EMPTY,
              style: getBoldStyle(color: ColorManager.red,fontSize: FontSize.s16),),
          ])),
    );
  }
}
