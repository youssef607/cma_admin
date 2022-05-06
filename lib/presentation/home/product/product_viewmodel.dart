
import 'dart:async';

import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/product_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class ProductViewModel extends BaseViewModel with ProductViewModelInput,ProductViewModelOutput{
  StreamController _productsStreamController = BehaviorSubject<List<Product>>(); 
  
  ProductUseCase _useCase;
  ProductViewModel(this._useCase);
  
  @override
  void start() {
    _getAllProduct();
  }

  _getAllProduct() async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(EMPTY)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE,failure.message));
      }, 
      (products) {
        inputProducts.add(products);
        inputState.add(ContentState());
      });
  }
  
  @override
  activeToggle(Product product,List<Product> products) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.activeToggle(product.id)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message));
      }, 
      (isActive) {
        product.active = isActive;
        inputProducts.add(products);
        inputState.add(ContentState());
      });
  }

  @override
  Sink get inputProducts => _productsStreamController.sink;

  @override
  Stream<List<Product>> get outputProducts => _productsStreamController.stream.map((products) => products);
  
  @override
  void dispose() {
    _productsStreamController.close();
    super.dispose();
  }
}

abstract class ProductViewModelInput {
  activeToggle(Product product,List<Product> products);
  Sink get inputProducts;
}

abstract class ProductViewModelOutput {
  Stream<List<Product>> get outputProducts;
}