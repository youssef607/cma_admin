import 'dart:typed_data';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/add_product/add_product_viewmodel.dart';
import 'package:cma_admin/presentation/components/color_picker_dialogue.dart';
import 'package:cma_admin/presentation/components/color_picker_label.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/requiredlabel.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddProductView extends StatefulWidget {
  final Category? category;
  const AddProductView(this.category, {Key? key}) : super(key: key);

  @override
  _AddProductViewViewState createState() => _AddProductViewViewState();
}

class _AddProductViewViewState extends State<AddProductView> {
  AddProductViewModel _viewModel = instance<AddProductViewModel>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleTextEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();

    widget.category != null
        ? _viewModel.setCategoryId(widget.category!.id.toString())
        : _viewModel.loadCategory();
    _titleTextEditingController.addListener(() {
      _viewModel.setTitle(_titleTextEditingController.text);
    });

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isSuccessAddProduct) {
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
                  _viewModel.addProduct(context);
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
        padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.p20),
                        child: Container(
                            child: Text(
                          AppStrings.createProduct,
                          style: getBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s24),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: GestureDetector(
                          onTap: () {
                            _startFilePicker();
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(AppSize.s4),
                            dashPattern: [5, 5],
                            color: ColorManager.grey,
                            strokeWidth: AppSize.s2,
                            child: Container(
                              child: _getMediaWidget(),
                              height: AppSize.s200,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                          ),
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
                                    keyboardType: TextInputType.number,
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
                      widget.category == null
                          ? Padding(
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
                                      List<Category>? categories =
                                          snapshot.data;

                                      return categories != null
                                          ? DropdownSearch<Category>(
                                              mode: Mode.MENU,
                                              items: categories
                                                  .map((category) => category)
                                                  .toList(),
                                              itemAsString:
                                                  (Category? category) =>
                                                      category!.label,
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                hintText:
                                                    AppStrings.addCategory,
                                              ),
                                              onChanged: (category) {
                                                _viewModel.setCategoryId(
                                                    category!.id.toString());
                                              },
                                            )
                                          : DropdownSearch<Category>();
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      widget.category == null
                          ? SizedBox(height: AppSize.s12)
                          : Container(),
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
                                    snapshot.data ?? ColorManager.grey;
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
                                            _viewModel.addProduct(context);
                                          }
                                        : null,
                                    child: Text(AppStrings.create)),
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
                ? _imagePickedByUser(pickerFile.byte)
                : Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Image.asset(
                            ImageAssets.gallery,
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: Text(AppStrings.browsImage),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  Widget _imagePickedByUser(Uint8List? image) {
    if (image != null) {
      return Image.memory(
        image,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
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
