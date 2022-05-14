import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

const String INPROGRESS = "INPROGRESS";
const String DONE = "DONE";

class OrderStatus extends StatelessWidget {
  final String status;
  const OrderStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color =  status == DONE
            ? ColorManager.green.withOpacity(0.8)
            : ColorManager.orange.withOpacity(0.8);
    return CircleAvatar(
      radius: 18,
      backgroundColor: color.withOpacity(0.1),
      child: Center(
        child: Icon(status == DONE ? IconManger.done : IconManger.inprogress,
            color: color,size: AppSize.s18,),
      ),
    );
  }
}
