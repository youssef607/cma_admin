import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final Color? color;
  final Color? borderColor;
  const BorderedContainer({ Key? key,required this.child, 
         this.margin,this.padding, this.height, this.width,this.color,this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.symmetric(horizontal: AppPadding.p14),
      decoration: BoxDecoration(
          color: color??ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s6),
          border: Border.all(color: borderColor??ColorManager.grey100)
      ),
      child: child
    );
  }
}