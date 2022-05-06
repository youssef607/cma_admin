import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double widthPourcentage;
  const ResponsiveGrid({ Key? key,required this.children,double? widthPourcentage}) 
  : widthPourcentage = widthPourcentage??0.25, 
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ResponsiveGridList(
          shrinkWrap: true,
          scroll: false,
          desiredItemWidth: MediaQuery.of(context).size.width * widthPourcentage,
          minSpacing: AppSize.s14,
          children: children,
      ),
    );
  }
}