import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';



class OrderStatusItem extends StatelessWidget {
  final OrderStatus status;
  const OrderStatusItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatusObjectView statusObjectView = status.getObject(); 
    return Container(
      width: AppSize.s100,
      height: AppSize.s30,
      decoration: BoxDecoration(
        color: statusObjectView.color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: Center(
        child: Text(statusObjectView.status,
            style:getBoldStyle(color: statusObjectView.color,fontSize: FontSize.s11)),
      ),
    );
  }
  
}

extension OrderStatusExtension on OrderStatus{
  StatusObjectView getObject(){
    switch (this) {
      case OrderStatus.INPROGRESS :
        return StatusObjectView(ColorManager.orange,"Pending");
      case OrderStatus.PRE_CANCELED:
        return StatusObjectView(ColorManager.blue,"Pre Canceled");
      case OrderStatus.CANCELED:
        return StatusObjectView(ColorManager.red,"Canceled");
      case OrderStatus.DONE:
        return StatusObjectView(ColorManager.green,"Completed");
      default:
        return StatusObjectView(ColorManager.orange,"Pending");
    }
  }
}

class StatusObjectView {
  Color color;
  String status;

  StatusObjectView(
    this.color,
    this.status,
  );
}
