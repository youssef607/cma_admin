import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
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
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream.listen((data) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        SignInData dataa = data;

        _appPreferences.setUserToken(dataa.token.toString());
        _appPreferences.setIsUserLoggedIn();
        _appPreferences.setUserRole(dataa.user!.role);
        _appPreferences.setCurrentUserId(dataa.user!.id);

        resetModules();
        if (dataa.user?.role == Constant.BARMAN) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeRoute, ModalRoute.withName('/'),
              arguments: 0);
        } else if ((dataa.user?.role == Constant.WAITER)) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeRoute, ModalRoute.withName('/'),
              arguments: 0);
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
      // backgroundColor: ColorManager.white,
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
    return Container(
        child: Row(
      children: [
        !isMobile(context)
            ? Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage(
                    ImageAssets.resImage,
                  ),
                  fit: BoxFit.fitWidth,
                ))
            : SizedBox(height: AppSize.s28),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isMobile(context)
                    ? Image(
                        image: AssetImage(ImageAssets.signInImage),
                        fit: BoxFit.fitHeight,
                      )
                    : Container(),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: !isMobile(context)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: AppSize.s35,
                                      child: Text(
                                        AppStrings.welcomeAdmin,
                                        style: getBoldStyle(
                                            color: ColorManager.black,
                                            fontSize: FontSize.s24),
                                      )),
                                  Container(
                                      height: AppSize.s80,
                                      child: Text(
                                        AppStrings.loginInYour,
                                        style: getLightStyle(
                                            color: ColorManager.lightGrey,
                                            fontSize: FontSize.s14),
                                      )),
                                ],
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppPadding.p10,
                          horizontal: AppPadding.p28,
                        ),
                        child: Text(
                          AppStrings.emailHint,
                          style: getMediumStyle(color: ColorManager.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: StreamBuilder<bool>(
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppPadding.p10,
                          horizontal: AppPadding.p28,
                        ),
                        child: Text(
                          AppStrings.password,
                          style: getMediumStyle(color: ColorManager.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: StreamBuilder<bool>(
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
                      ),
                      SizedBox(height: AppSize.s28),
                      Padding(
                          padding: EdgeInsets.only(
                              left: AppPadding.p28, right: AppPadding.p28),
                          child: StreamBuilder<bool>(
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
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppPadding.p8,
                          left: AppPadding.p28,
                          right: AppPadding.p28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
