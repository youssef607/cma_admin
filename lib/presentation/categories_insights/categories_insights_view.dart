import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/categories_insights/categories_insights_viewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/color_column.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/data_range_button.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/components/popup_menu_column.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CategoriesInsightsView extends StatefulWidget {
  const CategoriesInsightsView({ Key? key }) : super(key: key);

  @override
  State<CategoriesInsightsView> createState() => _CategoriesInsightsViewState();
}

class _CategoriesInsightsViewState extends State<CategoriesInsightsView> {
  CategoriesInsightsViewModel _viewModel = instance<CategoriesInsightsViewModel>();
  List<String> columns = [
    "Id",
    "Label",
    "Color",
    "Quantity",
    "Actions"
  ];
  _bind(){
    _viewModel.getCategoriesQuntityConsumed(_viewModel.viewObject.dateRange);
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
      child: StreamBuilder<List<CategoryCount>>(
        stream: _viewModel.outputCategoriesCount,
        builder: (context, snapshot) {
          List<CategoryCount>? categoriesCount = snapshot.data;
          if (categoriesCount!=null) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical:AppPadding.p30),
              child: Column(
                children: [
                  _getHeader(),
                  SizedBox(height: AppSize.s20),
                  SizedBox(height: AppSize.s20),
                  _getDataTable(categoriesCount),
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
          HeaderText("Categories Insights"),
          DateRangeButton(
            dateRangeStream: _viewModel.outputDateRange, 
            onSumbit:(dateRange)=> _viewModel.getCategoriesQuntityConsumed(dateRange)) 
        ],
      ),
    );
  }

  Widget _getDataTable(List<CategoryCount> categoriesCount) {
    return categoriesCount.isEmpty
      ?NotfoundWidget(AppStrings.noDataAvailable)
      :CustomDataTable(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
        columns: columns.map((c) => DataColumn(label: Text(c))).toList(),
        rows: categoriesCount.map((categoryCount) => DataRow(cells: [
          DataCell(Text(categoryCount.id.toString())),
          DataCell(Text(categoryCount.label)),
          DataCell(ColorColumn(categoryCount.color)),
          DataCell(Text(categoryCount.quantity.toString())),
          DataCell(PopUpMenuColumn(
            view: (){
              Navigator.of(context).pushNamed(Routes.productsInsightsRoute,
                arguments: ProductsInsightsArgs(categoryCount, _viewModel.viewObject.dateRange));
            },
          ))
        ])).toList(),
      );
  }
}