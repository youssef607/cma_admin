import 'dart:async';

import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/products_insights_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/subjects.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';



class ProductsInsightsViewModel extends BaseViewModel with ProductsInsightsViewModelInput,ProductsInsightsViewModelOutput{
  StreamController _productsCountStreamController = BehaviorSubject<List<ProductCount>>();
  StreamController _dateRangeStreamController = BehaviorSubject<PickerDateRange>();
  ProductsInsightsUseCase _useCase;
  ProductsInsightsViewModel(this._useCase);

  @override
  void start() {
  
  }

  getProductsQuntityConsumed(PickerDateRange dateRange,int categoryId) async{
    inputDateRange.add(dateRange);
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(ProductsInsightsUseCaseInput(dateToStringFormat(dateRange.startDate)
        ,dateToStringFormat(dateRange.endDate),categoryId))).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, 
      (productsCount) {
        inputProductsCount.add(productsCount);
        inputState.add(ContentState());
      });
  }

  @override
  void dispose() {
    _productsCountStreamController.close();
    _dateRangeStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputProductsCount => _productsCountStreamController.sink;

  @override
  Sink get inputDateRange => _dateRangeStreamController.sink;

  @override
  Stream<List<ProductCount>> get outputProductsCount => 
    _productsCountStreamController.stream.map((productsCount) => productsCount);

  @override
  Stream<PickerDateRange> get outputDateRange => 
    _dateRangeStreamController.stream.map((dateRange) => dateRange);
  
}

abstract class ProductsInsightsViewModelInput{
  Sink get inputProductsCount;
  Sink get inputDateRange;
}

abstract class ProductsInsightsViewModelOutput {
  Stream<List<ProductCount>> get outputProductsCount;
  Stream<PickerDateRange> get outputDateRange;
}