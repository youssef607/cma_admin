import 'dart:html';
import 'dart:math';

import 'package:ant_icons/ant_icons.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/excel.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/data_statistique_item.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/order_status.dart';
import 'package:cma_admin/presentation/components/popup_menu_column.dart';
import 'package:cma_admin/presentation/components/responsive_grid.dart';
import 'package:cma_admin/presentation/home/components/list_waiters.dart';
import 'package:cma_admin/presentation/home/dashboard/components/custom_line_chart.dart';
import 'package:cma_admin/presentation/home/dashboard/components/custom_pie_chart.dart';
import 'package:cma_admin/presentation/home/dashboard/components/data_range_button.dart';
import 'package:cma_admin/presentation/home/dashboard/components/details_widget.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardViewModel _viewModel = instance<DashboardViewModel>();

  List<String> columns = [
    "Status",
    "N°",
    "CreatedAt",
    "Items Count",
    "Amount",
    "Actions"
  ];
  int touchedIndex = -1;
  _bind() {
    _viewModel.start();
    _viewModel.getHomeData(PickerDateRange(
        DateTime.now().subtract(const Duration(days: 7)), DateTime.now()));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      height: double.infinity,
      child: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getcontentScreenWidget(), () {_bind();})??Container();
          }),
    );
  }

  Widget _getcontentScreenWidget() {
    return StreamBuilder<HomeData>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          HomeData? homeData = snapshot.data;
          if (homeData != null) {
            return SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.s14),
                  _getHeaders(),
                  SizedBox(height: AppSize.s14),
                  _getStatiqueGrid(homeData.statique),
                  SizedBox(height: AppSize.s14),
                  _getChartsSection(homeData),
                  SizedBox(height: AppSize.s18),
                  _getSection(homeData.orders!),
                  SizedBox(height: AppSize.s14),
                  _getOrdersDataTable(homeData.orders!)
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _getHeaders() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderText(AppStrings.dashboard),
          DateRangeButton(_viewModel),
        ],
      ),
    );
  }

  Widget _getSection(List<OrderModel> orders) {
    return StreamBuilder<DateRange>(
      stream: _viewModel.outpuDateRange,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.allOrders,style:getBoldStyle(color: ColorManager.black, fontSize: FontSize.s17)),
              ActionButton(
                title: AppStrings.exportExcel,
                onTap: () {
                  exportOrdersToExcel(orders,"${snapshot.data!.startDate}<->${snapshot.data!.endDate}");
                },
                color: ColorManager.gold),
            ],
          ),
        );
      }
    );
  }

  Widget _getChartsSection(HomeData homeData) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: ResponsiveGrid(
          widthPourcentage: isMobile(context) ? 0.5 : 0.32,
          children: [
            SizedBox(
              height: AppSize.s300,
              child: CustomLineChart(homeData.orders!, _viewModel),
            ),
            SizedBox(
              height: AppSize.s300,
              child: CustomPieChart(homeData.categoryCounts!),
            ),
          ],
        ));
  }

  Widget _getOrdersDataTable(List<OrderModel> orders) {
    return CustomDataTable(
        columns: columns.map((column) => DataColumn(label: Text(column))).toList(),
        rows: orders.map((order) => DataRow(cells: [
                  DataCell(OrderStatus(status: order.status.toString())),
                  DataCell(Text(order.id.toString())),
                  DataCell(Text(dateFormat(order.createdAt))),
                  DataCell(Text(order.itemsNumber.toString())),
                  DataCell(Text("${order.totalOrderPrice.toString()} ${AppStrings.dh}")),
                  DataCell(PopUpMenuColumn(
                      view: () {
                        showDetails(order);
                      }))
                ]))
            .toList());
  }

  Widget _getStatiqueGrid(Statique? statistic) {
    if (statistic != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: ResponsiveGrid(
            widthPourcentage: isMobile(context)
                ? 0.5
                : isTab(context)
                    ? 0.3
                    : 0.19,
            children: [
              DataStatistiqueItem(
                label: AppStrings.inProgressOrders,
                count: statistic.numOfInProgressOrders.toString(),
                color: ColorManager.orange,
                icon: IconManger.inprogress,
              ),
              DataStatistiqueItem(
                label: AppStrings.completedOrders,
                count: statistic.numOfDoneOrders.toString(),
                color: ColorManager.green,
                icon: IconManger.done,
              ),
              DataStatistiqueItem(
                label: AppStrings.totalOrders,
                count: statistic.numOfOrders.toString(),
                color: ColorManager.red,
                icon: IconManger.total,
              ),
              DataStatistiqueItem(
                label: AppStrings.amount,
                count: "${statistic.amount} ${AppStrings.dh}",
                color: ColorManager.blue,
                icon: AntIcons.euro,
              ),
            ]),
      );
    } else {
      return Container();
    }
  }

  showDetails(OrderModel order) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: DetailsOrderWidget(order));
        });
  }
}
