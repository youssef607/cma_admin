import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ColorPickerForm extends StatelessWidget {
  final Color color;
  const ColorPickerForm({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s4)),
        ),
        width: double.infinity,
        height: AppSize.s45,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            Icons.water_drop,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p10),
            child: Text(color.value.toRadixString(16)),
          ),
          Flexible(fit: FlexFit.tight, child: SizedBox()),
          Image.asset(
            ImageAssets.color_picker,
            fit: BoxFit.cover,
            color: color,
          ),
        ]));
  }
}