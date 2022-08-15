import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:cma_admin/presentation/signIn/signIn_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  AppPreferences _appPreferences = instance<AppPreferences>();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SignInViewModel _viewModel = instance<SignInViewModel>();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _userNameController.addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController.addListener(() => _viewModel.setPassword(_passwordController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream.listen((data) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        SignInData dataa = data;
        _appPreferences.setUserToken(dataa.token.toString());
        _appPreferences.setIsUserLoggedIn();
        _appPreferences.setUserRole(dataa.user!.role);
        _appPreferences.setCurrentUserId(dataa.user!.id);
        resetModules();
        if (dataa.user?.role == Constant.OWNER||dataa.user?.role == Constant.MANAGER) {
          Navigator.pushNamedAndRemoveUntil(context,Routes.homeRoute, ModalRoute.withName('/'),arguments:0);
        } 
        else{
          _viewModel.inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, AppStrings.accessError));
        }
      });
    });
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
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Center(
      child: Container(
        height: AppSize.s400,
        width: AppSize.s400,
        child: Card(
          shadowColor: ColorManager.grey2,
          elevation: AppSize.s2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20,vertical: AppPadding.p40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.welcomeAdmin,
                  style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s20)),
                SizedBox(height: AppSize.s8),
                Text(
                  AppStrings.loginInYour,
                  style: getRegularStyle(
                      color: ColorManager.lightGrey,
                      fontSize: FontSize.s14),
                ),
                SizedBox(height: AppSize.s20),
                StreamBuilder<bool>(
                  stream: _viewModel.outputIsUserNameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameController,
                      decoration: InputDecoration(
                          hintText: AppStrings.username,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStrings.usernameError),
                    );
                  },
                ),
                SizedBox(height: AppSize.s20),  
                StreamBuilder<bool>(
                  stream: _viewModel.outputIsPasswordValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: AppStrings.password,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStrings.passwordError),
                    );
                  },
                ),
                SizedBox(height: AppSize.s40),  
                StreamBuilder<bool>(
                  stream: _viewModel.outputIsAllInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.login();
                                }
                              : null,
                          child: Text(AppStrings.login)),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
