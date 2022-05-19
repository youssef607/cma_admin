import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final Color color;
  final double opacity;
  const ActionButton(
      {Key? key, required this.onTap, required this.title, required this.color,double? opacity})
      : opacity = opacity ?? 0.1, 
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
          height: isMobile(context)?AppSize.s30:AppSize.s40,
          padding: EdgeInsets.all(isMobile(context)?AppPadding.p8:AppPadding.p12),
          decoration: BoxDecoration(
              color: color.withOpacity(opacity),
              borderRadius: BorderRadius.circular(AppSize.s4)),
          child: Text(title, style: getMediumStyle(color: color,fontSize: isMobile(context)?FontSize.s10:FontSize.s13))),
    );
  }
}
