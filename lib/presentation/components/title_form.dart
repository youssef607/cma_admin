import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class TitleForm extends StatelessWidget {
  final String title;
  const TitleForm({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s24),
      ),
    );
  }
}
