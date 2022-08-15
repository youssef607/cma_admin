import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/charts/amount_chart.dart';
import 'package:cma_admin/presentation/components/charts/orders_count_chart.dart';
import 'package:cma_admin/presentation/components/data_range_button.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/components/orders_statistics_grid.dart';
import 'package:cma_admin/presentation/home/orders/orders_dt_source.dart';
import 'package:cma_admin/presentation/home/orders/orders_viewmodel.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  OrdersViewModel _viewModel = instance<OrdersViewModel>();
  List<String> columns = [
    "N°",
    "Waiter",
    "CreatedAt",
    "Items Count",
    "Amount",
    "Status",
    "Actions"
  ];

  _bind() {
    _viewModel.start();
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
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),() { _bind();}) ?? Container();
        });
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p20),
        child: StreamBuilder<OrdersDataTableSource>(
            stream: _viewModel.outputOrdersDTSource(context),
            builder: (context, snapshot) {
              OrdersDataTableSource? source = snapshot.data;
              if (source != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getHeaders(),
                    SizedBox(height: AppSize.s20),
                    OrdersStatisticsGrid(source.ordersInsights.statusCount!,source.ordersInsights.totalAmount),
                    SizedBox(height: AppSize.s20),
                    _getCharts(source.ordersInsights.timeInsights!),
                    SizedBox(height: AppSize.s20),
                    _getPaginatedDataTable(source)
                  ],
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  Widget _getHeaders(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          HeaderText(AppStrings.orders),
          DateRangeButton(
            dateRangeStream:_viewModel.outputDateRange,
            onSumbit: (dateRange){
              _viewModel.getOrders(dateRange);
            })
        ]
      ),
    );
  }

  Widget _getCharts(List<TimeInsights> timesInsights){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: isDesktop(context)?Row(
        children: [
          Expanded(child: AmountChart(timesInsights,_viewModel.ordersViewObject.dateRange)),
          SizedBox(width: AppSize.s20),
          Expanded(child: OrdersCountChart(timesInsights,_viewModel.ordersViewObject.dateRange))
        ],
      ):Column(
        children: [
          AmountChart(timesInsights,_viewModel.ordersViewObject.dateRange),
          SizedBox(height: AppSize.s20),
          OrdersCountChart(timesInsights,_viewModel.ordersViewObject.dateRange)
        ],
      ),
    );
  }

  Widget _getPaginatedDataTable(OrdersDataTableSource source){
    List<OrderModel> orders = source.ordersInsights.orders!;
    return orders.isEmpty?NotfoundWidget("No orders Available"):Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: PaginatedDataTable(
        onPageChanged: (index)async{
          if (index==source.ordersInsights.orders!.length) {
            await _viewModel.onLoading(source.ordersInsights, index~/10);                            
          }
        },
        dataRowHeight: AppSize.s60,
        horizontalMargin: AppMargin.m30,
        columnSpacing: 100,
        showCheckboxColumn: false,  
        columns:columns.map((c) => DataColumn(label: Text(c))).toList(),
        source: source)
    );
  }
  
}
