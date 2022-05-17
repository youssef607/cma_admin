import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void showAlert(
    BuildContext context, Color color, final Function(Color) onchanged) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),
            content: Builder(
              builder: (context) {
                return Container(
                  height: AppSize.s250,
                  child: Column(
                    children: [
                      ColorPicker(
                        enableAlpha: false,
                        colorPickerWidth: AppSize.s200,
                        pickerColor: color,
                        onColorChanged: onchanged,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: SizedBox(
                                width: double.infinity,
                                height: AppSize.s40,
                                child:
                                    Center(child: Text(AppStrings.pickColor)))),
                      ),
                    ],
                  ),
                );
              },
            ),
          ));
}
