
import 'dart:async';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/user_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class UserViewModel extends BaseViewModel with UserViewModelInput,UserViewModelOutput{
  StreamController _usersStreamController = BehaviorSubject<List<User>>(); 
  
  UserUseCase _useCase;
  UserViewModel(this._useCase);
  
  @override
  void start() {
    _getAllUsers();
  }

  _getAllUsers() async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(EMPTY)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE,failure.message));
      }, 
      (users) {
        inputUsers.add(users);
        inputState.add(ContentState());
      });
  }


  @override
  activeToggle(BuildContext context,User user,List<User> users) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.activeToggle(user.id)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message));
      }, 
      (isActive) {
        user.active = isActive;
        inputUsers.add(users);
        inputState.add(ContentState());
        Navigator.of(context).pop();
      });
  }

  @override
  Sink get inputUsers => _usersStreamController.sink;

  @override
  Stream<List<User>> get outputUsers => _usersStreamController.stream.map((users) => users);
  
  @override
  void dispose() {
    _usersStreamController.close();
    super.dispose();
  }
  
}

abstract class UserViewModelInput {
  activeToggle(BuildContext context,User user,List<User> users);
  Sink get inputUsers;
}

abstract class UserViewModelOutput {
  Stream<List<User>> get outputUsers;
}