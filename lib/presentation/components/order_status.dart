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
    return Container(
      height: AppSize.s35,
      width: AppSize.s35,
      decoration: BoxDecoration(
        color: status == DONE
            ? ColorManager.green.withOpacity(0.8)
            : ColorManager.orange.withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
      child: Center(
        child: Icon(status == DONE ? IconManger.done : IconManger.inprogress,
            color: ColorManager.white,size: AppSize.s18,),
      ),
    );
  }
}
