import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/products_insights/products_insights_viewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/color_column.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/data_range_button.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProductsInsightsView extends StatefulWidget {
  final ProductsInsightsArgs args;
  const ProductsInsightsView(this.args,{ Key? key }) : super(key: key);

  @override
  State<ProductsInsightsView> createState() => _ProductsInsightsViewState();
}

class _ProductsInsightsViewState extends State<ProductsInsightsView> {
  ProductsInsightsViewModel _viewModel = instance<ProductsInsightsViewModel>();
  List<String> columns = [
    "Id",
    "Label",
    "Color",
    "Quantity"
  ];
  _bind(){
    _viewModel.getProductsQuntityConsumed(
      widget.args.dateRange,
      widget.args.categoryCount.id);
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
    return Center(
      child: StreamBuilder<List<ProductCount>>(
        stream: _viewModel.outputProductsCount,
        builder: (context, snapshot) {
          List<ProductCount>? productsCount = snapshot.data;
          if (productsCount!=null) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical:AppPadding.p30),
              child: Column(
                children: [
                  _getHeader(),
                  SizedBox(height: AppSize.s20),
                  SizedBox(height: AppSize.s20),
                  _getDataTable(productsCount),
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
          HeaderText("Products Insights"),
          DateRangeButton(
            dateRangeStream: _viewModel.outputDateRange, 
            onSumbit:(dateRange)=> _viewModel.getProductsQuntityConsumed(dateRange,widget.args.categoryCount.id)) 
        ],
      ),
    );
  }

  Widget _getDataTable(List<ProductCount> productsCount) {
    return productsCount.isEmpty
      ?NotfoundWidget(AppStrings.noDataAvailable)
      :CustomDataTable(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
        columns: columns.map((c) => DataColumn(label: Text(c))).toList(),
        rows: productsCount.map((productCount) => DataRow(cells: [
          DataCell(Text(productCount.id.toString())),
          DataCell(Text(productCount.title)),
          DataCell(ColorColumn(productCount.color)),
          DataCell(Text(productCount.quantity.toString())),
        ])).toList(),
      );
  }
}