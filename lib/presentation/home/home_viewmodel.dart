import 'dart:async';

import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInput,HomeViewModelOutput{
  StreamController _currentIndexStreamController = BehaviorSubject<int>();
  AppPreferences _appPreferences;
  HomeViewModel(this._appPreferences);

  @override
  void start() {
  }

  @override
  void dispose() {
    _currentIndexStreamController.close();
    super.dispose();
  }

  @override
  onTap(BuildContext context,int index) {
    inputCurrentIndex.add(index);
    if (isMobile(context)) {
      Navigator.of(context).pop();
    }
    if (index==6) {
      logout(context);
    }
  }

  logout(BuildContext context) {
    _appPreferences.logout();
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginRoute, ModalRoute.withName('/'),
        arguments: 0);
  }

  @override
  Sink get inputCurrentIndex => _currentIndexStreamController.sink;


  @override
  Stream<int> get outputCurrentIndex => _currentIndexStreamController.stream.map((currentIndex) => currentIndex);

}

abstract class HomeViewModelInput {
  onTap(BuildContext context,int index);
  Sink get inputCurrentIndex;
}


abstract class HomeViewModelOutput {
  Stream<int> get outputCurrentIndex;
}