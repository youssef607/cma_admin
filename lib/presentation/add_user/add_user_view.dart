import 'dart:typed_data';

import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/add_user/add_user_viewmodel.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/field_label.dart';
import 'package:cma_admin/presentation/components/image_picker_widget.dart';
import 'package:cma_admin/presentation/components/requiredlabel.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
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
  final _formKey = GlobalKey<FormState>();

  TextEditingController _userNameTextEditingController = TextEditingController();
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
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _appPreferences.setIsUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
      });
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
                  _viewModel.register(context);
                }) ??
                _getContentWidget(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:AppPadding.p40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //title
                Text(
                  AppStrings.createUser,
                  style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s24),
                ),
                SizedBox(height: AppSize.s30),
                // form
                _getForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _getForm() {
    return Card(
      shadowColor: ColorManager.grey2,
      elevation: AppSize.s2,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal:AppPadding.p20,vertical: AppPadding.p30),
          width: isMobile(context)?AppSize.s400:AppSize.s600,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                ImagePickerWidget(
                  setImage: (image)=>_viewModel.setProfilePicture(image), 
                  imageStream: _viewModel.outputProfilePicture),
                SizedBox(height: AppSize.s30),
                // name field
                FieldLabel(AppStrings.name,isRequired: true),
                StreamBuilder<String?>(
                  stream: _viewModel.outputErrorName,
                  builder: (context, snapshot) {
                    return TextFormField(
                        keyboardType: TextInputType.text,
                        controller:
                            _nameTextEditingController,
                        decoration: InputDecoration(
                            hintText: AppStrings.name,
                            errorText: snapshot.data));
                  },
                ),
                SizedBox(height: AppSize.s30),
                // role field
                FieldLabel(AppStrings.role,isRequired: true),
                StreamBuilder<String?>(
                  stream: _viewModel.outputRole,
                  builder: (context, snapshot) {
                    return DropdownSearch(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: _viewModel.rolechecked,
                      dropdownSearchDecoration: InputDecoration(hintText: AppStrings.role),
                      onChanged: (value) {
                        _viewModel.setRole(value.toString());
                      },
                    );
                  },
                ),
                SizedBox(height: AppSize.s30),
                // username field
                FieldLabel(AppStrings.username,isRequired: true),
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
                SizedBox(height: AppSize.s30),
                // password field
                FieldLabel(AppStrings.password,isRequired: true),
                StreamBuilder<String?>(
                  stream: _viewModel.outputErrorPassword,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordEditingController,
                      decoration: InputDecoration(
                        labelText: AppStrings.password,
                        errorText: snapshot.data,
                      ),
                    );
                  },
                ),
                SizedBox(height: AppSize.s40),
                StreamBuilder<bool>(
                  stream: _viewModel.outputIsAllInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)? () {_viewModel.register(context);}: null,
                          child: Text(AppStrings.create)),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

}
