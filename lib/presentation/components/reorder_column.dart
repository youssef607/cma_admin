import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ReorderColumn extends StatelessWidget {
  final Function up;
  final Function down;
  final int index;
  final int length;
  const ReorderColumn({Key? key,required this.up,required this.down,required this.index,required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        index == 0
            ? Container()
            : IconButton(
                padding: EdgeInsets.all(AppPadding.p2),
                onPressed: () {
                  up.call();
                },
                icon: Icon(IconManger.arrow_up,size: AppSize.s20)),
        index == length-1  
            ? Container()
            : IconButton(
                padding: EdgeInsets.all(AppPadding.p2),
                onPressed: () {
                  down.call();
                },
                icon: Icon(IconManger.arrow_down,size: AppSize.s20))
      ],
    );
  }
}
