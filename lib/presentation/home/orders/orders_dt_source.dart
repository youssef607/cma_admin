import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/components/order_status_item.dart';
import 'package:cma_admin/presentation/components/popup_menu_column.dart';
import 'package:cma_admin/presentation/components/order_details_widget.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class OrdersDataTableSource extends DataTableSource {
  OrdersInsights ordersInsights;
  BuildContext context;
  Function(int) print;
  OrdersDataTableSource(this.ordersInsights,this.context,this.print);
  
  @override
  DataRow? getRow(int index) {
    List<OrderModel> orders = ordersInsights.orders!;
    if (index<orders.length) {
      return DataRow(
          onSelectChanged: (value){},
          cells: [
            DataCell(Text(orders[index].id.toString())),
            DataCell(Text(orders[index].waiter!.name.toString())),
            DataCell(Text(dateFormat(orders[index].createdAt))),
            DataCell(Text(orders[index].itemsNumber.toString())),
            DataCell(Text("${orders[index].totalAmount.toString()} ${AppStrings.dh}")),
            DataCell(OrderStatusItem(status: orders[index].status)),
            DataCell(PopUpMenuColumn(view:(){
              showDetails(context, orders[index]);
            }))
          ]);
    } else {
      return null;
    }
  }

  showDetails(BuildContext context,OrderModel order) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: DetailsOrderWidget(order, print: () {
              print.call(order.id);
            }));
        });
  }  


  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => ordersInsights.totalCount;

  @override
  int get selectedRowCount => 0;
  
}