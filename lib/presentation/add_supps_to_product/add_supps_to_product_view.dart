import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/add_supps_to_product/add_supps_to_product_viewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/color_column.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/image_column.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class AddSupplementsToProductView extends StatefulWidget {
  final int productId;
  const AddSupplementsToProductView(this.productId, {Key? key})
      : super(key: key);

  @override
  State<AddSupplementsToProductView> createState() =>
      _AddSupplementsToProductViewState();
}

class _AddSupplementsToProductViewState
    extends State<AddSupplementsToProductView> {
  final _viewModel = instance<AddSupplementsToProductViewModel>();
  List<String> columns = [
    "Id",
    "image",
    "Title",
    "Price",
    "Created At",
    "Color",
    "Active",
    "Select"
  ];

  _bind() {
    _viewModel.start();
    _viewModel.getSupplements(widget.productId);
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
      appBar: customAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppPadding.p10, horizontal: AppPadding.p16),
            child: ElevatedButton(
              onPressed:() {
                _viewModel.save(context, widget.productId);
              },
              child: Text(AppStrings.save,
                  style: getSemiBoldStyle(color: ColorManager.primary)),
              style: ElevatedButton.styleFrom(
                primary: ColorManager.white,
              ),
            ),
          )
        ],
      ),
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data
                    ?.getScreenWidget(context, _getcontentScreenWidget(), () {
                  _bind();
                }) ??
                Container();
          }),
    );
  }

  Widget _getcontentScreenWidget() {
    return StreamBuilder<List<int>>(
        stream: _viewModel.outputSelectedSupplements,
        builder: (context, snapshot) {
          List<int> selectedSupplements = snapshot.data ?? [];
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppPadding.p50),
                child: Center(
                  child: Text(AppStrings.addSupplementsToProduct,
                      style: getBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s20)),
                ),
              ),
              _getSupplemntsWidget(selectedSupplements),
            ],
          );
        });
  }

  Widget _getSupplemntsWidget(List<int> selectedSupplemnts) {
    return StreamBuilder<List<Supplement>>(
        stream: _viewModel.outputSupplements,
        builder: (context, snapshot) {
          List<Supplement>? supplements = snapshot.data;
          if (supplements != null) {
            return supplements.isEmpty
                ? NotfoundWidget(AppStrings.noSupplementFound)
                : CustomDataTable(
                    padding: EdgeInsets.zero,
                    columns: columns
                        .map((column) => DataColumn(label: Text(column)))
                        .toList(),
                    rows: supplements
                        .map((supplement) => DataRow(cells: [
                              DataCell(Text(supplement.id.toString())),
                              DataCell(ImageColumn(supplement.image)),
                              DataCell(Text(supplement.title)),
                              DataCell(
                                  Text("${supplement.price} ${AppStrings.dh}")),
                              DataCell(Text(supplement.createdAt)),
                              DataCell(ColorColumn(supplement.color)),
                              DataCell(Text(
                                  supplement.active
                                      ? AppStrings.active
                                      : AppStrings.notActive,
                                  style: getSemiBoldStyle(
                                      color: supplement.active
                                          ? ColorManager.green
                                          : ColorManager.red,
                                      fontSize: FontSize.s12))),
                              DataCell(Checkbox(
                                onChanged: (bool? isSelected) {
                                  _viewModel.select(
                                      supplement, selectedSupplemnts);
                                },
                                value: _viewModel.isSelected(
                                    supplement, selectedSupplemnts),
                              )),
                            ]))
                        .toList());
          } else {
            return Container();
          }
        });
  }
}
