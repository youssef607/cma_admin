import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/circle_image.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/data_range_button.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/components/orders_statistics_grid.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:cma_admin/presentation/all_waiters_insights/all_waiters_insights_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AllWaitersInsightsView extends StatefulWidget {
  const AllWaitersInsightsView({ Key? key }) : super(key: key);

  @override
  State<AllWaitersInsightsView> createState() => _AllWaitersInsightsViewState();
}

class _AllWaitersInsightsViewState extends State<AllWaitersInsightsView> {
  AllWaitersInsightsViewModel _viewModel = instance<AllWaitersInsightsViewModel>();
  List<String> columns = [
    "Image",
    "Waiter",
    "Amount",
    "In Progress",
    "Canceled",
    "Done",
    "Actions"
  ];
  _bind(){
    _viewModel.getWaiters(PickerDateRange(DateTime.now(),DateTime.now()));
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
    return Scaffold(
      appBar: customAppBar(),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentScreenWidget(),(){_bind();})
              ??_getContentScreenWidget();
        }
      ),
    );
  }


  Widget _getContentScreenWidget(){
    return SingleChildScrollView(
      controller: ScrollController(),
      child: StreamBuilder<AllWaitersInsights>(
        stream: _viewModel.outputWaitersInsights,
        builder: (context, snapshot) {
          AllWaitersInsights? waitersInsights = snapshot.data;
          if (waitersInsights!=null) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical:AppPadding.p30),
              child: Column(
                children: [
                  _getHeader(),
                  SizedBox(height: AppSize.s20),
                  OrdersStatisticsGrid(waitersInsights.statusCount!,waitersInsights.totalAmount),
                  SizedBox(height: AppSize.s20),
                  _getChartsSection(waitersInsights.waiters),
                ],
              ),
            );
          } else {
            return Container();
          }
        }
      ),
    );
  }

  Widget _getHeader(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:AppPadding.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderText("Waiters Insights"),
          DateRangeButton(
            dateRangeStream: _viewModel.outputDateRange, 
            onSumbit:(dateRange)=> _viewModel.getWaiters(dateRange)) 
        ],
      ),
    );
  }

  Widget _getChartsSection(List<Waiter>? waiters) {
    return waiters!.isEmpty
      ?NotfoundWidget(AppStrings.noDataAvailable)
      :CustomDataTable(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
        columns: columns.map((c) => DataColumn(label: Text(c))).toList(),
        rows: waiters.map((waiter) => DataRow(cells: [
          DataCell(CircleImage(waiter.image)),
          DataCell(Text(waiter.name)),
          DataCell(Text("${waiter.amount} ${AppStrings.dh}")),
          DataCell(Text(waiter.inprogress.toString())),
          DataCell(Text(waiter.canceled.toString())),
          DataCell(Text(waiter.done.toString())),
          DataCell(ActionButton(color: ColorManager.orange, onTap: (){
            Navigator.of(context).pushNamed(Routes.waiterInsightsRoute,arguments: WaiterInsightsArgs(waiter, _viewModel.viewObject.dateRange));
          }, title: "Insights")),
        ])).toList(),
      );
  }
}