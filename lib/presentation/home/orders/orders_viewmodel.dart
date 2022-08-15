
import 'dart:async';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/orders_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:cma_admin/presentation/home/orders/orders_dt_source.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class OrdersViewModel extends BaseViewModel with OrdersViewModelInput,OrdersViewModelOutput {
  StreamController _ordersStreamController = BehaviorSubject<OrdersInsights>();
  StreamController _dateRangeStreamController = BehaviorSubject<PickerDateRange>();
  OrdersViewObject ordersViewObject = OrdersViewObject(
    PickerDateRange(DateTime.now(),DateTime.now()));
  OrdersUseCase _useCase;
  OrdersViewModel(this._useCase);

  @override
  void start() {
    getOrders(ordersViewObject.dateRange);
  }

  getOrders(PickerDateRange dateRange)async{
    setDateRange(dateRange);
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(OrdersUseCaseInput(dateToStringFormat(dateRange.startDate),dateToStringFormat(dateRange.endDate),0))).fold(
      (failure){
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, 
      (ordersStatistics){
        inputOrders.add(ordersStatistics);
        inputState.add(ContentState());
      });
  }

  Future<void> onLoading(OrdersInsights ordersInsights,int index)async{
    PickerDateRange dateRange = ordersViewObject.dateRange;
    (await _useCase.execute(OrdersUseCaseInput(dateToStringFormat(dateRange.startDate),dateToStringFormat(dateRange.endDate),index))).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE,failure.message));
      }, 
      (newOrdersStatistics) {
        inputState.add(ContentState());
        for (var order in newOrdersStatistics.orders!) {
          ordersInsights.orders!.add(order);
        }
        inputOrders.add(ordersInsights);
      }
    );
  }

  @override
  setDateRange(PickerDateRange dateRange) {
    inputDateRange.add(dateRange);
    ordersViewObject = ordersViewObject.copyWith(dateRange: dateRange);
  }

  @override
  print(int id) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.print(id)).fold(
      (failure){
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
      }, 
      (success){
        inputState.add(SuccessState(AppStrings.successPrint));
      });
  }
  
  @override
  void dispose() {
    _ordersStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputOrders => _ordersStreamController.sink;
  
  @override
  Sink get inputDateRange => _dateRangeStreamController.sink;

  @override
  Stream<OrdersInsights> get outputOrders => _ordersStreamController.stream.map((orders) => orders);
  
  @override
  Stream<OrdersDataTableSource> outputOrdersDTSource(BuildContext context) {
    return _ordersStreamController.stream.map((orders) => OrdersDataTableSource(orders,context,(id)=>print(id)));
  }

  @override
  Stream<PickerDateRange> get outputDateRange => 
      _dateRangeStreamController.stream.map((dateRange) => dateRange);


}

abstract class OrdersViewModelInput {
  setDateRange(PickerDateRange dateRange);
  print(int id);
  Sink get inputOrders;
  Sink get inputDateRange;
}

abstract class OrdersViewModelOutput {
  Stream<OrdersInsights> get outputOrders;
  Stream<OrdersDataTableSource>  outputOrdersDTSource(BuildContext context);
  Stream<PickerDateRange> get outputDateRange;
}