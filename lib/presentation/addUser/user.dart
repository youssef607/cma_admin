import 'dart:io';
import 'dart:typed_data';

import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/widgets/requiredlabel.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/addUser/user_view_model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/theme_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:file_picker/file_picker.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  _AddUserViewState createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  AddUserViewModel _viewModel = instance<AddUserViewModel>();
  AppPreferences _appPreferences = instance<AppPreferences>();
  // ImagePicker picker = instance<ImagePicker>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _userNameTextEditingController =
      TextEditingController();
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
    _userNameTextEditingController.addListener(() {
      _viewModel.setUserName(_userNameTextEditingController.text);
    });

    _passwordEditingController.addListener(() {
      _viewModel.setPassword(_passwordEditingController.text);
    });

    _nameTextEditingController.addListener(() {
      _viewModel.setName(_nameTextEditingController.text);
    });

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isSuccessLoggedIn) {
      // navigate to main screen
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        _appPreferences.setIsUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.white,
      // appBar: AppBar(
      //   elevation: AppSize.s0,
      //   iconTheme: IconThemeData(color: ColorManager.primary),
      //   backgroundColor: ColorManager.white,
      // ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.register();
                }) ??
                _getContentWidget(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: AppPadding.p30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      child: Text(
                    AppStrings.createAccount,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s24),
                  )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                    child: GestureDetector(
                      onTap: () {
                        _startFilePicker();
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        child: Container(
                          child: _getMediaWidget(),
                          height: AppSize.s200,
                          width: MediaQuery.of(context).size.width * 0.5,
                          // decoration: BoxDecoration(
                          //     border: FDottedLine(color: ColorManager.lightGrey)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s12),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: AppPadding.p28, right: AppPadding.p28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RequiredLabel(text: AppStrings.name),
                              StreamBuilder<String?>(
                                stream: _viewModel.outputErrorName,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: _nameTextEditingController,
                                      decoration: InputDecoration(
                                          hintText: AppStrings.name,
                                          errorText: snapshot.data));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.s12),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: AppPadding.p28, right: AppPadding.p28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RequiredLabel(text: AppStrings.role),
                              StreamBuilder<String?>(
                                stream: _viewModel.outputRole,
                                builder: (context, snapshot) {
                                  return DropdownSearch(
                                    mode: Mode.MENU,
                                    showSelectedItems: true,
                                    items: _viewModel.rolechecked,
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: AppStrings.role,
                                    ),
                                    onChanged: (value) {
                                      _viewModel.setRole(value.toString());
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s12),
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppPadding.p12,
                        left: AppPadding.p28,
                        right: AppPadding.p28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequiredLabel(text: AppStrings.username),
                        StreamBuilder<String?>(
                          stream: _viewModel.outputErrorUserName,
                          builder: (context, snapshot) {
                            return TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _userNameTextEditingController,
                                decoration: InputDecoration(
                                    hintText: AppStrings.username,
                                    errorText: snapshot.data));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppPadding.p20,
                        left: AppPadding.p28,
                        right: AppPadding.p28,
                        bottom: AppPadding.p12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequiredLabel(text: AppStrings.password),
                        StreamBuilder<String?>(
                          stream: _viewModel.outputErrorPassword,
                          builder: (context, snapshot) {
                            return TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passwordEditingController,
                              decoration: InputDecoration(
                                hintText: AppStrings.password,
                                labelText: AppStrings.password,
                                errorText: snapshot.data,
                              ),
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
                                        _viewModel.register();
                                      }
                                    : null,
                                child: Text(AppStrings.register)),
                          );
                        },
                      )),
                ],
              ),
            ),
          )),
    );
  }

  Widget _getMediaWidget() {
    return Container(
      child: StreamBuilder<PickerFile?>(
        stream: _viewModel.outputProfilePicture,
        builder: (context, snapshot) {
          PickerFile? pickerFile = snapshot.data;
          return pickerFile != null
              ? _imagePickedByUser(pickerFile.byte)
              : Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.asset(
                          ImageAssets.gallery,
                          fit: BoxFit.cover,
                        )),
                    Expanded(flex: 1, child: Text("brows your image here")),
                  ],
                );
          ;
        },
      ),
      // Flexible(child: SvgPicture.asset(ImageAssets.signInImage)),
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
