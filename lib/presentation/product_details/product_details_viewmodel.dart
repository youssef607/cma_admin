import 'dart:async';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/product_details_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class ProductDetailsViewModel extends BaseViewModel
    with ProductDetailsViewModelOutput, ProductDetailsViewModelInput {
  StreamController _supplementsStreamController =
      BehaviorSubject<List<Supplement>>();

  ProductDetailsUseCase _useCase;
  ProductDetailsViewModel(this._useCase);

  @override
  void start() {}

  getSupplements(int id) async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(id.toString())).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (supplements) {
      inputSupplements.add(supplements);
      inputState.add(ContentState());
    });
  }

  @override
  activeToggle(BuildContext context, Product product) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.activeToggle(product.id)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (isActive) {
      product.active = isActive;
      inputState.add(ContentState());
      Navigator.of(context).pop();
    });
  }

  @override
  deleteSupplement(BuildContext context, int productId, int suppId) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.deleteSupplementFromProduct(productId, suppId)).fold(
    (failure) {
      inputState.add( ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (res) {
      getSupplements(productId);
      inputState.add(ContentState());
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _supplementsStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputSupplements => _supplementsStreamController.sink;

  @override
  Stream<List<Supplement>> get outputSupplements =>
      _supplementsStreamController.stream.map((supplements) => supplements);
}

abstract class ProductDetailsViewModelInput {
  activeToggle(BuildContext context, Product product);
  deleteSupplement(BuildContext context, int productId, int suppId);
  Sink get inputSupplements;
}

abstract class ProductDetailsViewModelOutput {
  Stream<List<Supplement>> get outputSupplements;
}
