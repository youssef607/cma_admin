import 'dart:async';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/category_details_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CategoryDetailsViewModel extends BaseViewModel
    with CategoryDetailsViewModelOutput, CategoryDetailsViewModelInput {
  StreamController _productsStreamController = BehaviorSubject<List<Product>>();

  CategoryDetailsUseCase _useCase;
  CategoryDetailsViewModel(this._useCase);

  @override
  void start() {}

  getProducts(int id) async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(id.toString())).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (products) {
      inputProducts.add(products);
      inputState.add(ContentState());
    });
  }

  @override
  activeToggle(BuildContext context,Category category) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.activeToggle(category.id)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (isActive) {
      category.active = isActive;
      inputState.add(ContentState());
      Navigator.of(context).pop();
    });
  }

  @override
  delete(BuildContext context,int id) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.deleteCategory(id)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message));
      }, 
      (isDeleted) {
        if (isDeleted) {
          Navigator.of(context).pop();
          inputState.add(ContentState());
          Navigator.of(context).pop();
        } else {
          inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,"Impossible to delete this category"));
        }
        
      });
  }

  @override
  reorder(BuildContext context,List<Product> products,int oldIndex,int newIndex) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.reorder(products[oldIndex].id,products[newIndex].id)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message));
      }, 
      (_) {
        int oldNumber = products[oldIndex].orderNumber;
        int newNumber = products[newIndex].orderNumber;                   
        products[oldIndex].orderNumber = newNumber;
        products[newIndex].orderNumber = oldNumber;
        inputProducts.add(products);
        inputState.add(ContentState());
        Navigator.of(context).pop();
      });
  }

  @override
  void dispose() {
    _productsStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputProducts => _productsStreamController.sink;

  @override
  Stream<List<Product>> get outputProducts => _productsStreamController.stream.map((products) => sortProducts(products));
  
  List<Product> sortProducts(List<Product> products){
    products.sort((a, b) => a.orderNumber.compareTo(b.orderNumber));
    return products;
  }
}

abstract class CategoryDetailsViewModelInput {
  reorder(BuildContext context,List<Product> products,int oldIndex,int newIndex);
  delete(BuildContext context,int id);
  activeToggle(BuildContext context,Category category);
  Sink get inputProducts;
}

abstract class CategoryDetailsViewModelOutput {
  Stream<List<Product>> get outputProducts;
}
