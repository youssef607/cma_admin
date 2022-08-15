import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/charts/amount_chart.dart';
import 'package:cma_admin/presentation/components/charts/orders_count_chart.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/data_range_button.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/orders_statistics_grid.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:cma_admin/presentation/waiter_insights/waiter_insights_viewmodel.dart';
import 'package:flutter/material.dart';

class WaiterInsightsView extends StatefulWidget {
  final WaiterInsightsArgs args;
  const WaiterInsightsView(this.args,{ Key? key }) : super(key: key);

  @override
  State<WaiterInsightsView> createState() => _WaiterInsightsViewState();
}

class _WaiterInsightsViewState extends State<WaiterInsightsView> {
  WaiterInsightsViewModel _viewModel = instance<WaiterInsightsViewModel>();
  
   _bind() {
    _viewModel.start();
    _viewModel.getWaiterInsights(widget.args.dateRange, widget.args.waiter.id);
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
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),() { _bind();}) ?? Container();
          }),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p20),
        child: StreamBuilder<WaiterInsights>(
            stream: _viewModel.outputWaiterInsights,
            builder: (context, snapshot) {
              WaiterInsights? waiterInsights = snapshot.data;
              if (waiterInsights != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getHeaders(),
                    SizedBox(height: AppSize.s20),
                    OrdersStatisticsGrid(
                      StatusCount(
                        waiterInsights.waiter!.done,
                        waiterInsights.waiter!.inprogress,
                        waiterInsights.waiter!.canceled,
                      ),
                      waiterInsights.waiter!.amount
                    ),
                    SizedBox(height: AppSize.s20),
                    _getCharts(waiterInsights.timeInsights!),
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
          HeaderText("${widget.args.waiter.name} Insights"),
          DateRangeButton(
            dateRangeStream:_viewModel.outputDateRange,
            onSumbit: (dateRange){
              _viewModel.getWaiterInsights(dateRange,widget.args.waiter.id);
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
          Expanded(child: AmountChart(timesInsights,_viewModel.viewObject.dateRange)),
          SizedBox(width: AppSize.s20),
          Expanded(child: OrdersCountChart(timesInsights,_viewModel.viewObject.dateRange))
        ],
      ):Column(
        children: [
          AmountChart(timesInsights,_viewModel.viewObject.dateRange),
          SizedBox(height: AppSize.s20),
          OrdersCountChart(timesInsights,_viewModel.viewObject.dateRange)
        ],
      ),
    );
  }
  
}
