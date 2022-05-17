import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void showAlert(
    BuildContext context, Color color, final Function(Color) onchanged) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Center(child: Text(AppStrings.pickColor)),
      content: ColorPicker(
        showLabel: false,
        pickerColor: color,
        onColorChanged: onchanged,
      ),
      actions: [
        ElevatedButton(
          child: const Text(AppStrings.goIt),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
