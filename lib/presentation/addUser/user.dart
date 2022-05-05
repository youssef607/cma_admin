import 'dart:io';

import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/addUser/user_view_model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  _AddUserViewState createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  AddUserViewModel _viewModel = instance<AddUserViewModel>();
  AppPreferences _appPreferences = instance<AppPreferences>();
  ImagePicker picker = instance<ImagePicker>();
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
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        iconTheme: IconThemeData(color: ColorManager.primary),
        backgroundColor: ColorManager.white,
      ),
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
    return Container(
        padding: EdgeInsets.only(top: AppPadding.p30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Image(image: AssetImage(ImageAssets.signInImage)),
                // SizedBox(height: AppSize.s28),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding.p12,
                      left: AppPadding.p28,
                      right: AppPadding.p28),
                  child: GestureDetector(
                    onTap: () {
                      _imageFormGallery();
                    },
                    child: Container(
                      child: _getMediaWidget(),
                      width: AppSize.s200,
                      height: AppSize.s200,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorManager.lightGrey)),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s12),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _nameTextEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.name,
                              labelText: AppStrings.name,
                              errorText: snapshot.data));
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: AppPadding.p20,
                        left: AppPadding.p28,
                        right: AppPadding.p28,
                        bottom: AppPadding.p12),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: StreamBuilder<String?>(
                              stream: _viewModel.outputErrorPassword,
                              builder: (context, snapshot) {
                                return TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: _passwordEditingController,
                                    decoration: InputDecoration(
                                        hintText: AppStrings.password,
                                        labelText: AppStrings.password,
                                        errorText: snapshot.data));
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s12),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<String?>(
                    stream: _viewModel.outputRole,
                    builder: (context, snapshot) {
                      return DropdownSearch(
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: _viewModel.rolechecked,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: AppStrings.role,
                          hintText: AppStrings.role,
                        ),
                        onChanged: (value) {
                          _viewModel.setRole(value.toString());
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: AppSize.s12),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding.p12,
                      left: AppPadding.p28,
                      right: AppPadding.p28),
                  child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorUserName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _userNameTextEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.username,
                              labelText: AppStrings.username,
                              errorText: snapshot.data));
                    },
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
        ));
  }

  Widget _getMediaWidget() {
    return Container(
      child: StreamBuilder<File?>(
        stream: _viewModel.outputProfilePicture,
        builder: (context, snapshot) {
          return _imagePickedByUser(snapshot.data);
        },
      ),
      // Flexible(child: SvgPicture.asset(ImageAssets.signInImage)),
    );
  }

  Widget _imagePickedByUser(File? image) {
    if (image != null && image.path.isNotEmpty) {
      return Image.file(
        image,
        fit: BoxFit.contain,
      );
    } else {
      return Center(
        child: Text("Pecked"),
      );
    }
  }

  _imageFormGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    _viewModel.setProfilePicture(File(image?.path ?? ""));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
