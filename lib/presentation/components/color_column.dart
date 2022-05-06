import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ColorColumn extends StatelessWidget {
  final Color color;
  const ColorColumn(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSize.s20,
        width: AppSize.s20,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(AppSize.s4)));
  }
}
