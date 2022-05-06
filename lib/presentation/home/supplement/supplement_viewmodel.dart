
import 'dart:async';

import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/supplement_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class SupplementViewModel extends BaseViewModel with SupplementViewModelInput,SupplementViewModelOutput{
  StreamController _supplementsStreamController = BehaviorSubject<List<Supplement>>(); 
  
  SupplementUseCase _useCase;
  SupplementViewModel(this._useCase);
  
  @override
  void start() {
    _getAllSupplement();
  }

  _getAllSupplement() async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(EMPTY)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE,failure.message));
      }, 
      (supplements) {
        inputSupplements.add(supplements);
        inputState.add(ContentState());
      });
  }
  
  @override
  activeToggle(Supplement supplement,List<Supplement> supplements) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.activeToggle(supplement.id)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message));
      }, 
      (isActive) {
        supplement.active = isActive;
        inputSupplements.add(supplements);
        inputState.add(ContentState());
      });
  }  

  @override
  Sink get inputSupplements => _supplementsStreamController.sink;

  @override
  Stream<List<Supplement>> get outputSupplements => _supplementsStreamController.stream.map((supplements) => supplements);
  
  @override
  void dispose() {
    _supplementsStreamController.close();
    super.dispose();
  }
}

abstract class SupplementViewModelInput {
  activeToggle(Supplement supplement,List<Supplement> supplements);
  Sink get inputSupplements;
}

abstract class SupplementViewModelOutput {
  Stream<List<Supplement>> get outputSupplements;
}