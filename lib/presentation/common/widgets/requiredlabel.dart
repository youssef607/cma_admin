import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';

class RequiredLabel extends StatelessWidget {
  final String text;
  const RequiredLabel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: AppPadding.p4, left: AppPadding.p4),
      child: RichText(
          text: TextSpan(
              style: TextStyle(color: ColorManager.black),
              text: text,
              children: [
            TextSpan(text: '*', style: TextStyle(color: ColorManager.red))
          ])),
    );
  }
}
