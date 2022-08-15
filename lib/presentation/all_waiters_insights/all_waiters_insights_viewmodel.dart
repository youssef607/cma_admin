
import 'dart:async';

import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/subjects.dart';

import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/all_waiters_insights_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AllWaitersInsightsViewModel extends BaseViewModel with AllWaitersInsightsViewModelInput,AllWaitersInsightsViewModelOutput {
  StreamController _waitersInsightsStreamController = BehaviorSubject<AllWaitersInsights>();
  StreamController _dateRangeStreamController = BehaviorSubject<PickerDateRange>();
  OrdersViewObject viewObject = OrdersViewObject(PickerDateRange(DateTime.now(),DateTime.now()));
  AllWaitersInsightsUseCase _useCase;
  AllWaitersInsightsViewModel(this._useCase);

  @override
  void start() {
  }

  getWaiters(PickerDateRange dateRange) async{
    inputDateRange.add(dateRange);
    viewObject = viewObject.copyWith(dateRange: dateRange);
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(AllWaitersInsightsUseCaseInput(dateToStringFormat(dateRange.startDate)
        ,dateToStringFormat(dateRange.endDate)))).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, 
      (waitersInsights) {
        inputWaitersInsights.add(waitersInsights);
        inputState.add(ContentState());
      });
  }


  @override
  void dispose() {
    _waitersInsightsStreamController.close();
    _dateRangeStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputWaitersInsights => _waitersInsightsStreamController.sink;


  @override
  Sink get inputDateRange => _dateRangeStreamController.sink;

  @override
  Stream<AllWaitersInsights> get outputWaitersInsights => _waitersInsightsStreamController.stream.map((waiters) => waiters);
  
  @override
  Stream<PickerDateRange> get outputDateRange => _dateRangeStreamController.stream.map((dateRange) => dateRange);
  
}

abstract class AllWaitersInsightsViewModelInput {
  Sink get inputWaitersInsights;
  Sink get inputDateRange;
}

abstract class AllWaitersInsightsViewModelOutput {
  Stream<AllWaitersInsights> get outputWaitersInsights;
  Stream<PickerDateRange> get outputDateRange;
}
