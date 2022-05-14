import 'dart:async';
import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              _appPreferences.getUserRole().then((role) {
                if (role == Constant.OWNER) {
                  Navigator.pushNamedAndRemoveUntil(context,
                      Routes.homeRoute, ModalRoute.withName('/'),
                      arguments: 0);
                } else if ((role == Constant.MANAGER)) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.homeRoute, ModalRoute.withName('/'),
                      arguments: 0);
                }
              })
            }
          else
            {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.loginRoute, ModalRoute.withName('/'),
                  arguments: 0)
            }
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
