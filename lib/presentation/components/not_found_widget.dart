import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class NotfoundWidget extends StatelessWidget {
  final String text;
  const NotfoundWidget(this.text,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: EdgeInsets.only(top:AppPadding.p24),
          child: Text(text,style: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s16)),
        ));
  }
}
