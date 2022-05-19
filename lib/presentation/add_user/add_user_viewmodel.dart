import 'dart:async';

import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/add_user_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/material.dart';

class AddUserViewModel extends BaseViewModel
    with AddUserViewModelInput, AddUserViewModelOutput {
  StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  StreamController _roleStreamController = StreamController<String>.broadcast();

  StreamController _nameStreamController = StreamController<String>.broadcast();

  AppPreferences _appPreferences = instance<AppPreferences>();

  StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  StreamController _profilePictureStreamController =
      StreamController<PickerFile?>.broadcast();

  StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  AddUserUseCase _addUserUseCase;

  var adduserViewObject = AddUserObject(null, "", "", "", "");

  AddUserViewModel(this._addUserUseCase);

  List<String>? rolechecked;

  //  -- inputs
  @override
  void start() {
    inputState.add(ContentState());
    RoleChecked();
  }

  @override
  register(BuildContext context) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _addUserUseCase.execute(AddUserUseCaseInput(
      adduserViewObject.image,
      adduserViewObject.name,
      adduserViewObject.password,
      adduserViewObject.role,
      adduserViewObject.username,
    )))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.POPUP_ERROR_STATE, failure.message))
                }, (data) {
      inputState.add(ContentState());
      isUserLoggedInSuccessfullyStreamController.add(true);
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _isAllInputsValidStreamController.close();
    _userNameStreamController.close();
    _roleStreamController.close();
    _nameStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  setName(String name) {
    inputName.add(name);
    if (_isNameValid(name)) {
      adduserViewObject = adduserViewObject.copyWith(name: name);
    } else {
      adduserViewObject = adduserViewObject.copyWith(name: "");
    }
    _validate();
  }

  @override
  setRole(String role) {
    inputRole.add(role);
    if (_isRoleValid(role)) {
      adduserViewObject = adduserViewObject.copyWith(role: role);
    } else {
      adduserViewObject = adduserViewObject.copyWith(role: "");
    }
    _validate();
  }

  @override
  setPassword(String password) {
    inputUPassword.add(password);
    if (_isPasswordValid(password)) {
      adduserViewObject = adduserViewObject.copyWith(password: password);
    } else {
      adduserViewObject = adduserViewObject.copyWith(password: "");
    }
    _validate();
  }

  @override
  setProfilePicture(PickerFile? file) {
    inputProfilePicture.add(file);
    adduserViewObject = adduserViewObject.copyWith(image: file);
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if (_isUserNameValid(userName)) {
      adduserViewObject = adduserViewObject.copyWith(username: userName);
    } else {
      adduserViewObject = adduserViewObject.copyWith(username: "");
    }
    _validate();
  }

  @override
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputRole => _roleStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputUPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  // -- outputs

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _validateAllInputs());

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<String?> get outputErrorUserName => outputIsUserNameValid
      .map((isUserNameValid) => isUserNameValid ? null : "Invalid username");

  @override
  Stream<bool> get outputIsNameValid =>
      _nameStreamController.stream.map((name) => _isNameValid(name));

  @override
  Stream<String?> get outputErrorName => outputIsNameValid
      .map((isNameValid) => isNameValid ? null : "Invalid Name");

  @override
  Stream<bool> get outputIsRoleValid =>
      _roleStreamController.stream.map((role) => _isRoleValid(role));

  @override
  Stream<String?> get outputRole => outputIsRoleValid
      .map((isRoleValid) => isRoleValid ? null : "Invalid Role");

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword => outputIsPasswordValid
      .map((isPasswordValid) => isPasswordValid ? null : "Invalid Password");

  @override
  Stream<PickerFile?> get outputProfilePicture =>
      _profilePictureStreamController.stream.map((file) => file);

  // -- private methods
  bool _isUserNameValid(String userName) {
    return userName.length >= 6;
  }

  bool _isRoleValid(String Role) {
    return Role.length > 0;
  }

  bool _isNameValid(String name) {
    return name.length > 6;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool _validateAllInputs() {
    return adduserViewObject.name.isNotEmpty &&
        adduserViewObject.password.isNotEmpty &&
        adduserViewObject.role.isNotEmpty &&
        adduserViewObject.username.isNotEmpty;
  }

  _validate() {
    inputAllInputsValid.add(null);
  }

  RoleChecked() {
    _appPreferences.getUserRole().then((role) {
      if (role == Constant.OWNER) {
        rolechecked = [
          Constant.MANAGER,
          Constant.OWNER,
          Constant.WAITER,
          Constant.BARMAN
        ];
      } else if (role == Constant.MANAGER) {
        rolechecked = [
          Constant.WAITER,
          Constant.BARMAN,
        ];
      }
    });

    return rolechecked;
  }
}

abstract class AddUserViewModelInput {
  register(BuildContext context);

  setUserName(String userName);

  setRole(String role);

  setName(String name);

  setPassword(String password);

  setProfilePicture(PickerFile file);

  Sink get inputUserName;

  Sink get inputRole;

  Sink get inputName;

  Sink get inputUPassword;

  Sink get inputProfilePicture;

  Sink get inputAllInputsValid;
}

abstract class AddUserViewModelOutput {
  Stream<bool> get outputIsUserNameValid;

  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsRoleValid;

  Stream<String?> get outputRole;

  Stream<bool> get outputIsNameValid;

  Stream<String?> get outputErrorName;

  Stream<bool> get outputIsPasswordValid;

  Stream<String?> get outputErrorPassword;

  Stream<PickerFile?> get outputProfilePicture;

  Stream<bool> get outputIsAllInputsValid;
}
