import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/excel.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/color_column.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/data_statistique_item.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/image_column.dart';
import 'package:cma_admin/presentation/components/popup_menu_column.dart';
import 'package:cma_admin/presentation/components/responsive_grid.dart';
import 'package:cma_admin/presentation/home/supplement/supplement_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SupplementView extends StatefulWidget {
  const SupplementView({Key? key}) : super(key: key);

  @override
  State<SupplementView> createState() => _SupplementViewState();
}

class _SupplementViewState extends State<SupplementView> {
  SupplementViewModel _viewModel = instance<SupplementViewModel>();
  List<String> columns = [
    "Id",
    "image",
    "Title",
    "Price (DH)",
    "CreatedAt",
    "Color",
    "Active",
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
          return snapshot.data
                  ?.getScreenWidget(context, _getcontentScreenWidget(), () {
                _bind();
              }) ??
              Container();
        });
  }

  Widget _getcontentScreenWidget() {
    return StreamBuilder<List<Supplement>>(
        stream: _viewModel.outputSupplements,
        builder: (context, snapshot) {
          List<Supplement>? supplements = snapshot.data;
          if (supplements != null) {
            return _getDataTable(supplements);
          } else {
            return Container();
          }
        });
  }

  Widget _getDataTable(List<Supplement> supplements) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          SizedBox(height: AppSize.s20),
          _getHeaders(supplements),
          SizedBox(height: AppSize.s20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: _getStatiqueGrid(supplements),
          ),
          SizedBox(height: AppSize.s20),
          CustomDataTable(
              columns: columns
                  .map((column) => DataColumn(label: Text(column)))
                  .toList(),
              rows: supplements
                  .map((supplement) => DataRow(cells: [
                        DataCell(Text(supplement.id.toString())),
                        DataCell(ImageColumn(supplement.image)),
                        DataCell(Text(supplement.title)),
                        DataCell(Text(supplement.price.toString())),
                        DataCell(Text(supplement.createdAt)),
                        DataCell(ColorColumn(supplement.color)),
                        DataCell(Switch(
                            value: supplement.active,
                            onChanged: (value) {
                              _viewModel.activeToggle(
                                  context, supplement, supplements);
                            })),
                        DataCell(PopUpMenuColumn(delete: () {
                          _viewModel.delete(context, supplement, supplements);
                        }, update: () {
                          Navigator.of(context)
                              .pushNamed(Routes.updateSupplementRoute,
                                  arguments: supplement)
                              .then((value) => _bind());
                        }))
                      ]))
                  .toList())
        ],
      ),
    );
  }

  Widget _getHeaders(List<Supplement> supplements) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderText(AppStrings.supplements),
          Row(
            children: [
              ActionButton(
                  title: AppStrings.addSupplement,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Routes.addSupplementRoute)
                        .then((_) => _bind());
                  },
                  color: ColorManager.primary),
              SizedBox(width: AppSize.s10),
              ActionButton(
                  title: AppStrings.exportExcel,
                  onTap: () {
                    exportSupplementsToExcel(supplements);
                  },
                  color: ColorManager.gold),
            ],
          )
        ],
      ),
    );
  }

  Widget _getStatiqueGrid(List<Supplement> supplements) {
    int isActiveCount = supplements
        .where((Supplement) => Supplement.active == true)
        .toList()
        .length;
    int isNotActiveCount = supplements
        .where((Supplement) => Supplement.active == false)
        .toList()
        .length;
    return ResponsiveGrid(
        widthPourcentage: isMobile(context) ? 0.3 : 0.25,
        children: [
          DataStatististicsItem(
              label: AppStrings.active,
              count: isActiveCount.toString(),
              color: ColorManager.green,
              icon: IconManger.active),
          DataStatististicsItem(
              label: AppStrings.notActive,
              count: isNotActiveCount.toString(),
              color: ColorManager.red,
              icon: IconManger.notActive),
          DataStatististicsItem(
              label: AppStrings.total,
              count: supplements.length.toString(),
              color: ColorManager.orange,
              icon: IconManger.total),
        ]);
  }
}
