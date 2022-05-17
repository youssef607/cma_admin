import 'dart:typed_data';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/addCategory/addcategory_view_model.dart';
import 'package:cma_admin/presentation/common/widgets/color_picker_dialogue.dart';
import 'package:cma_admin/presentation/common/widgets/color_picker_label.dart';
import 'package:cma_admin/presentation/common/widgets/requiredlabel.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({Key? key}) : super(key: key);

  @override
  _AddCategoryViewState createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  AddCategoryViewModel _viewModel = instance<AddCategoryViewModel>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _labelTextEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();

    _labelTextEditingController.addListener(() {
      _viewModel.setLabel(_labelTextEditingController.text);
    });

    _viewModel.isAddCategorySuccessfullyStreamController.stream
        .listen((isSuccessAddCategory) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.addCategory();
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
        padding: EdgeInsets.symmetric(vertical: AppPadding.p30),
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
                          AppStrings.createCategory,
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
                                text: AppStrings.label, requiredText: "*"),
                            StreamBuilder<String?>(
                              stream: _viewModel.outputErrorLabel,
                              builder: (context, snapshot) {
                                return TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _labelTextEditingController,
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
                              text: AppStrings.color,
                            ),
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
                                            _viewModel.addCategory();
                                          }
                                        : null,
                                    child: Text(AppStrings.addCategory)),
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
                        child: Expanded(
                            flex: 1, child: Text(AppStrings.browsImage)),
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
