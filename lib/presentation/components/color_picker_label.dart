import 'package:cma_admin/presentation/components/color_picker_dialogue.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ColorPickerForm extends StatelessWidget {
  final Color color;
  final Function(Color) setColor;
  const ColorPickerForm({Key? key, required this.color,required this.setColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showAlert(context, color, (value) {
          setColor(value);
        });
      },
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: color, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s4)),
          ),
          width: double.infinity,
          height: AppSize.s45,
          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p4),
              child: Icon(
                Icons.water_drop,
                color: color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p10),
              child: Text(color.value.toRadixString(16)),
            ),
            Flexible(fit: FlexFit.tight, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(right: AppPadding.p4),
              child: Image.asset(
                ImageAssets.color_picker,
                fit: BoxFit.cover,
                color: color,
              ),
            ),
          ])),
    );
  }
}
