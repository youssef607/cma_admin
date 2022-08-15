
import 'dart:async';

import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/usecase/waiter_insights_usecase.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/subjects.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WaiterInsightsViewModel extends BaseViewModel with WaiterInsightsViewModelInput,WaiterInsightsViewModelOutput {
  StreamController _waitersInsightsStreamController = BehaviorSubject<WaiterInsights>();
  StreamController _dateRangeStreamController = BehaviorSubject<PickerDateRange>();
  OrdersViewObject viewObject = OrdersViewObject(PickerDateRange(DateTime.now(),DateTime.now()));
  WaiterInsightsUseCase _useCase;
  WaiterInsightsViewModel(this._useCase);

  @override
  void start() {
  }

  getWaiterInsights(PickerDateRange dateRange,int id) async{
    inputDateRange.add(dateRange);
    viewObject = viewObject.copyWith(dateRange: dateRange);
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(WaiterInsightsUseCaseInput(
        dateToStringFormat(dateRange.startDate),
        dateToStringFormat(dateRange.endDate),
        id
      ))).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, 
      (waitersInsights) {
        inputWaiterInsights.add(waitersInsights);
        inputState.add(ContentState());
      }
    );
  }


  @override
  void dispose() {
    _waitersInsightsStreamController.close();
    _dateRangeStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputWaiterInsights => _waitersInsightsStreamController.sink;


  @override
  Sink get inputDateRange => _dateRangeStreamController.sink;

  @override
  Stream<WaiterInsights> get outputWaiterInsights => _waitersInsightsStreamController.stream.map((waiters) => waiters);
  
  @override
  Stream<PickerDateRange> get outputDateRange => _dateRangeStreamController.stream.map((dateRange) => dateRange);
  
}

abstract class WaiterInsightsViewModelInput {
  Sink get inputWaiterInsights;
  Sink get inputDateRange;
}

abstract class WaiterInsightsViewModelOutput {
  Stream<WaiterInsights> get outputWaiterInsights;
  Stream<PickerDateRange> get outputDateRange;
}
