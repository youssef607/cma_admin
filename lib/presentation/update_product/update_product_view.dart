import 'dart:typed_data';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/components/color_picker_dialogue.dart';
import 'package:cma_admin/presentation/components/color_picker_label.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/dotted_border.dart';
import 'package:cma_admin/presentation/components/imagePickedByUser.dart';
import 'package:cma_admin/presentation/components/image_picker.dart';
import 'package:cma_admin/presentation/components/requiredlabel.dart';
import 'package:cma_admin/presentation/components/title_form.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/update_product/update_product_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UpdateProductView extends StatefulWidget {
  final Product product;
  const UpdateProductView(this.product, {Key? key}) : super(key: key);

  @override
  _UpdateProductViewViewState createState() => _UpdateProductViewViewState();
}

class _UpdateProductViewViewState extends State<UpdateProductView> {
  UpdateProductViewModel _viewModel = instance<UpdateProductViewModel>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();

    _titleTextEditingController.addListener(() {
      _viewModel.setTitle(_titleTextEditingController.text);
    });
    _titleTextEditingController.text = widget.product.title;

    _priceTextEditingController.addListener(() {
      _viewModel.setPrice(_priceTextEditingController.text);
    });
    _priceTextEditingController.text = widget.product.price.toString();

    _viewModel.setId(widget.product.id.toString());
    _viewModel.setColor(widget.product.color);
    _viewModel.setCategoryId(widget.product.category!.id.toString());

    _viewModel.isUpdateProductSuccessfullyStreamController.stream
        .listen((isSuccessUpdateProduct) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.updateProduct();
                }) ??
                _getContentWidget(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
        width: AppSize.s500,
        padding: EdgeInsets.symmetric(vertical: AppPadding.p4),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            _startFilePicker();
                          },
                          child: PickImageWidget(
                            getMediaWidget: _getMediaWidget(),
                          )),
                      SizedBox(height: AppSize.s12),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredLabel(
                                text: AppStrings.title, requiredText: "*"),
                            StreamBuilder<String?>(
                              stream: _viewModel.outputErrorTitle,
                              builder: (context, snapshot) {
                                return TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _titleTextEditingController,
                                    decoration: InputDecoration(
                                        hintText: AppStrings.label,
                                        errorText: snapshot.data));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s12),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredLabel(
                                text: AppStrings.price, requiredText: "*"),
                            StreamBuilder<String?>(
                              stream: _viewModel.outputErrorPrice,
                              builder: (context, snapshot) {
                                return TextFormField(
                                    controller: _priceTextEditingController,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      _viewModel.setPrice(value);
                                    },
                                    decoration: InputDecoration(
                                        hintText: AppStrings.price,
                                        errorText: snapshot.data));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s12),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredLabel(
                                text: AppStrings.addCategory,
                                requiredText: "*"),
                            StreamBuilder<List<Category>?>(
                              stream: _viewModel.outputCategories,
                              builder: (context, snapshot) {
                                List<Category>? categories = snapshot.data;

                                return categories != null
                                    ? DropdownSearch<Category>(
                                        mode: Mode.MENU,
                                        selectedItem: widget.product.category,
                                        items: categories
                                            .map((category) => category)
                                            .toList(),
                                        itemAsString: (Category? category) =>
                                            category!.label,
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          hintText: AppStrings.addCategory,
                                        ),
                                        onChanged: (category) {
                                          _viewModel.setCategoryId(
                                              category!.id.toString());
                                        },
                                      )
                                    : DropdownSearch<Category>();
                              },
                              // return Text(categories![0].label);
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s12),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredLabel(text: AppStrings.color),
                            StreamBuilder<Color?>(
                              stream: _viewModel.outputPickerColor,
                              builder: (context, snapshot) {
                                Color color =
                                    snapshot.data ?? widget.product.color;
                                return InkWell(
                                  child: ColorPickerForm(
                                    color: color,
                                  ),
                                  onTap: () {
                                    showAlert(context, color, (value) {
                                      _viewModel.setColor(value);
                                      color = value;
                                    });
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s28),
                      Padding(
                          padding: EdgeInsets.only(
                              left: AppPadding.p28, right: AppPadding.p28),
                          child: StreamBuilder<bool>(
                            stream: _viewModel.outputIsAllInputsValid,
                            builder: (context, snapshot) {
                              return SizedBox(
                                width: double.infinity,
                                height: AppSize.s40,
                                child: ElevatedButton(
                                    onPressed: (snapshot.data ?? false)
                                        ? () {
                                            _viewModel.updateProduct();
                                          }
                                        : null,
                                    child: Text(AppStrings.update)),
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _getMediaWidget() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Container(
        child: StreamBuilder<PickerFile?>(
          stream: _viewModel.outputProfilePicture,
          builder: (context, snapshot) {
            PickerFile? pickerFile = snapshot.data;
            return pickerFile != null
                ? ImagePickedByUser(pickerFile.byte)
                : ImagePicker(widget.product.image);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  _startFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    Uint8List byte = result!.files.first.bytes!;
    String extension = result.files.first.extension!;
    _viewModel.setProfilePicture(PickerFile(byte, extension));
  }
}
