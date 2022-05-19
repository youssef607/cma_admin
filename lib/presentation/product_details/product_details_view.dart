import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/details_image.dart';
import 'package:cma_admin/presentation/components/info_text.dart';
import 'package:cma_admin/presentation/components/info_color.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/product_details/product_details_viewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/bordered_container.dart';
import 'package:cma_admin/presentation/components/color_column.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/image_column.dart';
import 'package:cma_admin/presentation/components/popup_menu_column.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;
  const ProductDetailsView(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  ProductDetailsViewModel _viewModel = instance<ProductDetailsViewModel>();

  List<String> columns = [
    "N°",
    "image",
    "Title",
    "Price",
    "CreatedAt",
    "Color",
    "Status",
    "Actions"
  ];

  _bind() {
    _viewModel.start();
    _viewModel.getSupplements(widget.product.id);
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p30, vertical: AppPadding.p30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _getProductInfo(),
            SizedBox(height: AppSize.s30),
            _getSupplements()
          ],
        ),
      ),
    );
  }

  Widget _getProductInfo() {
    Product product = widget.product;
    return Stack(
      children: [
        BorderedContainer(
          margin: EdgeInsets.symmetric(vertical: AppMargin.m14),
          padding: EdgeInsets.all(
              isMobile(context) ? AppPadding.p16 : AppPadding.p35),
          child: Row(
            children: [
              DetailsImage(product.image),
              SizedBox(width: isMobile(context) ? AppSize.s10 : AppSize.s30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoText(text: AppStrings.num, value: product.id.toString()),
                  SizedBox(height: AppSize.s16),
                  InfoText(text: AppStrings.label, value: product.title),
                  SizedBox(height: AppSize.s16),
                  InfoText(
                      text: AppStrings.createdAt, value: product.createdAt),
                  SizedBox(height: AppSize.s16),
                  InfoText(
                      text: AppStrings.price,
                      value: "${product.price} ${AppStrings.dh}"),
                  SizedBox(height: AppSize.s16),
                  InfoText(
                      text: AppStrings.status,
                      value: product.active
                          ? AppStrings.active
                          : AppStrings.notActive,
                      color: product.active
                          ? ColorManager.green
                          : ColorManager.red),
                  SizedBox(height: AppSize.s16),
                  InfoColor(color: product.color),
                  SizedBox(height: AppSize.s26),
                  _getActionButton(product)
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: AppSize.s50,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
                color: ColorManager.white,
                child: Text(AppStrings.productInfo,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s20)))),
      ],
    );
  }

  Widget _getActionButton(Product product) {
    return Row(
      children: [
        ActionButton(
            color: ColorManager.gold, title: AppStrings.update, onTap: () {}),
        SizedBox(width: AppSize.s20),
        ActionButton(
            color: ColorManager.primary,
            title: AppStrings.delete,
            onTap: () {
              _viewModel.deleteProduct(context, product.id);
            }),
        SizedBox(width: AppSize.s20),
        ActionButton(
            color: product.active ? ColorManager.red : ColorManager.green,
            title: product.active ? AppStrings.deactivate : AppStrings.activate,
            onTap: () {
              _viewModel.activeToggle(context, product);
            })
      ],
    );
  }

  Widget _getSupplements() {
    return StreamBuilder<List<Supplement>>(
        stream: _viewModel.outputSupplements,
        builder: (context, snapshot) {
          List<Supplement>? supplements = snapshot.data;
          if (supplements != null) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getSupplementsHeader(),
                  SizedBox(height: AppSize.s12),
                  supplements.isEmpty
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
                                    DataCell(Text(
                                        "${supplement.price} ${AppStrings.dh}")),
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
                                    DataCell(PopUpMenuColumn(
                                      update: () {},
                                      delete: () {
                                        _viewModel.deleteSupplement(context,
                                            widget.product.id, supplement.id);
                                      },
                                    )),
                                  ]))
                              .toList()),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _getSupplementsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(AppStrings.supplements,
            style: getBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s20)),
        ActionButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.addSupplemntsToProductRoute,
                      arguments: widget.product.id)
                  .then((_) => _bind());
            },
            title: AppStrings.addSupplement,
            color: ColorManager.primary)
      ],
    );
  }
}
