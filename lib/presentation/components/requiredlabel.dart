import 'package:flutter/cupertino.dart';

import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';

class RequiredLabel extends StatelessWidget {
  final String text;
  final String requiredText;
  const RequiredLabel({
    Key? key,
    required this.text,
    this.requiredText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p8),
      child: RichText(
          text: TextSpan(
              style: TextStyle(color: ColorManager.black),
              text: text,
              children: [
            TextSpan(
                text: requiredText, style: TextStyle(color: ColorManager.red)),
          ])),
    );
  }
}
