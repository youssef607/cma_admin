import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/components/bordered_container.dart';
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
    return BorderedContainer(
      height: AppSize.s100,
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppSize.s45,
            height: AppSize.s45,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),  
              borderRadius: BorderRadius.circular(AppSize.s6)),
            child: Center(
              child: Icon(icon,
                  color: color,
                  size: AppSize.s30),
            ),
          ),
          SizedBox(width: AppSize.s16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: getSemiBoldStyle(
                      color: ColorManager.lightGrey,
                      fontSize:FontSize.s13)),
              SizedBox(height: AppSize.s8),
              Text(count.toString(),
                  style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize:FontSize.s30)),
            ],
          ),
        ],
      ),
    );
  }
}
