import 'package:ant_icons/ant_icons.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/bordered_container.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/data_statistique_item.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/components/order_status_item.dart';
import 'package:cma_admin/presentation/components/orders_statistics_grid.dart';
import 'package:cma_admin/presentation/components/popup_menu_column.dart';
import 'package:cma_admin/presentation/components/responsive_grid.dart';
import 'package:cma_admin/presentation/home/dashboard/components/hours_chart.dart';
import 'package:cma_admin/presentation/home/dashboard/components/waiters_chart.dart';
import 'package:cma_admin/presentation/home/dashboard/components/quantity_chart.dart';
import 'package:cma_admin/presentation/components/order_details_widget.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_viewmodel.dart';
import 'package:cma_admin/presentation/home/home_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardViewModel _viewModel = instance<DashboardViewModel>();
  HomeViewModel _homeViewModel = instance<HomeViewModel>();

  List<String> columns = [
    "N°",
    "CreatedAt",
    "Items Count",
    "Amount",
    "Status",
    "Actions"
  ];

  _bind() {
    _viewModel.start();
    _viewModel.getHomeData();
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
          return snapshot.data
                  ?.getScreenWidget(context, _getcontentScreenWidget(), () {
                _bind();
              }) ??
              _getcontentScreenWidget();
        });
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
                  OrdersStatisticsGrid(homeData.statusCount!, homeData.totalAmount),
                  _getChartsSection(homeData),
                  SizedBox(height: AppSize.s18),
                  _getOrdersAndWaitersSection(homeData),
                  SizedBox(height: AppSize.s30)
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
          Text(dateToStringFormat2(DateTime.now()),style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s15)),
        ],
      ),
    );
  }


  Widget _getChartsSection(HomeData homeData) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
        child: isDesktop(context)
        ?SizedBox(
          height: AppSize.s400,
          child: Row(
            children: [
              Expanded(flex:3,child: HoursChart(homeData.hoursStatistics!, viewInsights: ()=>_homeViewModel.inputCurrentIndex.add(1))),
              SizedBox(width: AppSize.s20),
              Expanded(flex:2,child: QuantityChart(homeData.categoryCounts!,homeData.productCounts!)),
            ],
          ),
         )
        :Column(
          children: [
            HoursChart(homeData.hoursStatistics!, viewInsights: ()=>_homeViewModel.inputCurrentIndex.add(1)),
            SizedBox(height: AppSize.s20),
            QuantityChart(homeData.categoryCounts!,homeData.productCounts!),
          ],
        ));
  }

  Widget _getOrdersAndWaitersSection(HomeData homeData){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:AppPadding.p30),
      child: isDesktop(context)
        ?Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex:3,child: _getOrdersDataTable(homeData.lastOrders!)),
            SizedBox(width: AppSize.s20),
            Expanded(flex:2,child: WaitersChart(homeData.waiters!)),
           ],
        )
        :Column(
          children: [
            WaitersChart(homeData.waiters!),
            SizedBox(height: AppSize.s20),
            _getOrdersDataTable(homeData.lastOrders!),
          ],
        )  
    );
  }

  Widget _getOrdersHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.latestOrders,style: getSemiBoldStyle( color: ColorManager.black, fontSize: FontSize.s16)),
        TextButton(onPressed: (){
          _homeViewModel.inputCurrentIndex.add(1);
        }, 
        child: Text(AppStrings.viewAll))
      ],
    );
  }

  Widget _getOrdersDataTable(List<OrderModel> lastOrders) {
    return BorderedContainer(
      padding: EdgeInsets.all(AppPadding.p14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getOrdersHeader(),
          SizedBox(height: AppSize.s14),
          lastOrders.isEmpty?NotfoundWidget(AppStrings.noDataAvailable):CustomDataTable(
              card: false,
              padding: EdgeInsets.zero,
              columns: columns.map((column) => DataColumn(label: Text(column))).toList(),
              rows: lastOrders.map((order) => DataRow(cells: [
                        DataCell(Text(order.id.toString())),
                        DataCell(Text(dateFormat(order.createdAt))),
                        DataCell(Text(order.itemsNumber.toString())),
                        DataCell(Text("${order.totalAmount.toString()} ${AppStrings.dh}")),
                        DataCell(OrderStatusItem(status: order.status)),
                        DataCell(PopUpMenuColumn(view:(){showDetails(order);}))
                      ])).toList()),
        ],
      ),
    );
  }

  showDetails(OrderModel order) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: DetailsOrderWidget(order, print: () {
            _viewModel.print(order.id);
          }));
        });
  }
}
