import 'package:cma_admin/presentation/components/bordered_container.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class PopUpMenuColumn extends StatelessWidget {
  final Function? update;
  final Function? view;
  final Function? delete;
  const PopUpMenuColumn(
      {Key? key,
      this.update,
      this.view,
      this.delete})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      padding: EdgeInsets.zero,
      child: PopupMenuButton(
        icon: Icon(Icons.more_horiz),
        onSelected: (value) {
        if (value == 1) {
          update?.call();
        } else if (value == 2) {
          view?.call();
        } else if (value == 3) {
          delete?.call();
        }
      }, itemBuilder: (context) {
        return [
          if(update!=null)PopupMenuItem(value: 1, child: Text(AppStrings.update),textStyle: getItemStyle()),
          if(view!=null)PopupMenuItem(value: 2, child: Text(AppStrings.view),textStyle: getItemStyle()),
          if(delete!=null)PopupMenuItem(value: 3, child: Text(AppStrings.delete),textStyle: getItemStyle(color: ColorManager.error)),
        ];
      }),
    );
  }

  TextStyle getItemStyle({Color? color}){
    return getMediumStyle(color: color??ColorManager.black,fontSize: FontSize.s14);
  }
}
