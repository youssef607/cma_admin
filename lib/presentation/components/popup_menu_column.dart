import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class PopUpMenuColumn extends StatelessWidget {
  final Function update;
  final Function view;
  const PopUpMenuColumn({Key? key,required this.update,required this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(onSelected: (value) {
      if (value == 1) {
        update.call();
      } else {
        view.call();
      }
    }, itemBuilder: (context) {
      return [
        PopupMenuItem(value: 1, child: Text(AppStrings.update)),
        PopupMenuItem(value: 2, child: Text(AppStrings.view)),
      ];
    });
  }
}
