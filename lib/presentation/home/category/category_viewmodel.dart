
import 'dart:async';

import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/category_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class CategoryViewModel extends BaseViewModel with CategoryViewModelInput,CategoryViewModelOutput{
  StreamController _categoriesStreamController = BehaviorSubject<List<Category>>(); 
  
  CategoryUseCase _useCase;
  CategoryViewModel(this._useCase);
  
  @override
  void start() {
    _getAllCategory();
  }

  _getAllCategory() async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(EMPTY)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE,failure.message));
      }, 
      (categories) {
        inputCategories.add(categories);
        inputState.add(ContentState());
      });
  }
  
  //input
  @override
  activeToggle(BuildContext context,Category category,List<Category> categories) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.activeToggle(category.id)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message));
      }, 
      (isActive) {
        category.active = isActive;
        inputCategories.add(categories);
        inputState.add(ContentState());
        Navigator.of(context).pop();
      });
  }

  @override
  delete(BuildContext context, Category category, List<Category> categories) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.deleteCategory(category.id)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message));
      }, 
      (isDeleted) {
        if (isDeleted) {
          categories.remove(category);
          inputCategories.add(categories);
          inputState.add(ContentState());
          Navigator.of(context).pop();
        } else {
          inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,"Impossible to delete this category"));
        }
        
      });
  }
  
  @override
  reorder(BuildContext context,List<Category> categories,int oldIndex,int newIndex) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.reorder(categories[oldIndex].id,categories[newIndex].id)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message));
      }, 
      (_) {
        int oldNumber = categories[oldIndex].orderNumber;
        int newNumber = categories[newIndex].orderNumber;                   
        categories[oldIndex].orderNumber = newNumber;
        categories[newIndex].orderNumber = oldNumber;
        inputCategories.add(categories);
        inputState.add(ContentState());
        Navigator.of(context).pop();
      });
  }

  @override
  Sink get inputCategories => _categoriesStreamController.sink;

  @override
  Stream<List<Category>> get outputCategories => _categoriesStreamController.stream.map((categories) => sortCategories(categories));

  List<Category> sortCategories(List<Category> categories){
    categories.sort((a, b) => a.orderNumber.compareTo(b.orderNumber));
    return categories;
  }

  @override
  void dispose() {
    _categoriesStreamController.close();
    super.dispose();
  }
  
}

abstract class CategoryViewModelInput {
  reorder(BuildContext context,List<Category> categories,int oldIndex,int newIndex);
  activeToggle(BuildContext context,Category category,List<Category> categories);
  delete(BuildContext context,Category category,List<Category> categories);
  Sink get inputCategories;
}

abstract class CategoryViewModelOutput {
  Stream<List<Category>> get outputCategories;
}