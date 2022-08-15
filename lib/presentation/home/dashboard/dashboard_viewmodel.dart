import 'dart:async';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/dashboard_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:rxdart/rxdart.dart';

class DashboardViewModel extends BaseViewModel with DashboardViewModelInput, DashboardViewModelOutput {
  StreamController _homeDataStreamController = BehaviorSubject<HomeData>();

  DashboardUseCase _useCase;
  DashboardViewModel(this._useCase);

  @override
  void start() {}

  getHomeData() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(EMPTY)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, 
      (homeData) {
        inputHomeData.add(homeData);
        inputState.add(ContentState());
      }
    );
  }

  @override
  print(int id) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.print(id.toString())).fold(
      (failure){
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
      }, 
      (success){
        inputState.add(SuccessState(AppStrings.successPrint));
      });
  }

  @override
  Sink get inputHomeData => _homeDataStreamController.sink;


  @override
  Stream<HomeData> get outputHomeData => _homeDataStreamController.stream.map((homeData) => homeData);


  @override
  void dispose() {
    _homeDataStreamController.close();
    super.dispose();
  }
}

abstract class DashboardViewModelInput {
  print(int id);
  Sink get inputHomeData;
}

abstract class DashboardViewModelOutput {
  Stream<HomeData> get outputHomeData;
}

