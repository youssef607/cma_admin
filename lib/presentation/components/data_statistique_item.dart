import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class DataStatistiqueItem extends StatelessWidget {
  final String count;
  final String label;
  final Color color;
  final IconData icon;
  const DataStatistiqueItem(
      {Key? key,
      required this.count,
      required this.label,
      required this.color,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s100,
      padding: EdgeInsets.symmetric(horizontal:isMobile(context)?AppPadding.p10:AppPadding.p14),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(AppSize.s2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: getRegularStyle(
                      color: ColorManager.white.withOpacity(0.7), fontSize: isMobile(context)?AppSize.s14:FontSize.s14)),
              SizedBox(height: AppSize.s4),
              Text(count.toString(),
                  style: getBoldStyle(
                      color: ColorManager.white, fontSize: isMobile(context)?FontSize.s24:FontSize.s35)),
            ],
          ),
          Icon(icon, color: ColorManager.white, size: isMobile(context)?AppSize.s30:AppSize.s40),
        ],
      ),
    );
  }
}
