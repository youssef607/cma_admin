import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';

class PickImageWidget extends StatelessWidget {
  final Widget getMediaWidget;
  const PickImageWidget({Key? key, required this.getMediaWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(AppSize.s4),
      dashPattern: [5, 5],
      color: ColorManager.grey,
      strokeWidth: AppSize.s2,
      child: Container(
        child: getMediaWidget,
        height: AppSize.s200,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
}
