import 'dart:async';

import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/categories_insights_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/subjects.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';



class CategoriesInsightsViewModel extends BaseViewModel with CategoriesInsightsViewModelInput,CategoriesInsightsViewModelOutput{
  StreamController _categoriesCountStreamController = BehaviorSubject<List<CategoryCount>>();
  StreamController _dateRangeStreamController = BehaviorSubject<PickerDateRange>();
  
  OrdersViewObject viewObject = OrdersViewObject(PickerDateRange(DateTime.now(),DateTime.now()));

  CategoriesInsightsUseCase _useCase;
  CategoriesInsightsViewModel(this._useCase);
  
  @override
  void start() {
  
  }

  getCategoriesQuntityConsumed(PickerDateRange dateRange) async{
    inputDateRange.add(dateRange);
    viewObject = viewObject.copyWith(dateRange: dateRange);
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(CategoriesInsightsUseCaseInput(
      dateToStringFormat(dateRange.startDate)
      ,dateToStringFormat(dateRange.endDate)))).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, 
      (categoriesCount) {
        inputCategoriesCount.add(categoriesCount);
        inputState.add(ContentState());
      });
  }

  @override
  void dispose() {
    _categoriesCountStreamController.close();
    _dateRangeStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputCategoriesCount => _categoriesCountStreamController.sink;

  @override
  Sink get inputDateRange => _dateRangeStreamController.sink;

  @override
  Stream<List<CategoryCount>> get outputCategoriesCount => 
    _categoriesCountStreamController.stream.map((categoriesCount) => categoriesCount);

  @override
  Stream<PickerDateRange> get outputDateRange => 
    _dateRangeStreamController.stream.map((dateRange) => dateRange);
  
}

abstract class CategoriesInsightsViewModelInput{
  Sink get inputCategoriesCount;
  Sink get inputDateRange;
}

abstract class CategoriesInsightsViewModelOutput {
  Stream<List<CategoryCount>> get outputCategoriesCount;
  Stream<PickerDateRange> get outputDateRange;
}