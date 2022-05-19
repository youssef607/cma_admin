import 'dart:async';

import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/add_supps_to_product_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AddSupplementsToProductViewModel extends BaseViewModel
    with
        AddSupplementsToProductViewModelInput,
        AddSupplementsToProductViewModelOutput {
  StreamController _supplementsStreamController =
      BehaviorSubject<List<Supplement>>();
  StreamController _selectedSupplementsStreamController =
      BehaviorSubject<List<int>>();

  var astpObject = AddSupplementsToProductObject([]);

  AddSupplementsToProductUseCase _useCase;
  AddSupplementsToProductViewModel(this._useCase);

  @override
  void start() {}

  @override
  void dispose() {
    _supplementsStreamController.close();
    _selectedSupplementsStreamController.close();
    super.dispose();
  }

  getSupplements(int id) async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(id)).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (supplements) {
      inputState.add(ContentState());
      inputSupplements.add(supplements);
    });
  }

  // input
  @override
  save(BuildContext context, int productId) async {
    if (astpObject.selectedSupplements.isNotEmpty) {
      inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
      (await _useCase.addSupplementsToProduct(productId, astpObject.selectedSupplements)).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
      }, 
      (supplements) {
        inputState.add(ContentState());
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  select(Supplement supplement, List<int> selectedSupplemnts) {
    if (isSelected(supplement, selectedSupplemnts)) {
      selectedSupplemnts.remove(supplement.id);
    } else {
      selectedSupplemnts.add(supplement.id);
    }
    inputSelectedSupplements.add(selectedSupplemnts);
    astpObject = astpObject.copyWith(selectedSupplements: selectedSupplemnts);
  }

  @override
  Sink get inputSelectedSupplements =>
      _selectedSupplementsStreamController.sink;

  @override
  Sink get inputSupplements => _supplementsStreamController.sink;

  @override
  Stream<List<int>> get outputSelectedSupplements =>
      _selectedSupplementsStreamController.stream
          .map((selectedSupplements) => selectedSupplements);

  @override
  Stream<List<Supplement>> get outputSupplements =>
      _supplementsStreamController.stream.map((supplements) => supplements);

  // private functions
  bool isSelected(Supplement supplement, List<int> selectedSupplemnts) {
    return selectedSupplemnts
            .where((suppId) => suppId == supplement.id)
            .length !=
        0;
  }
}

abstract class AddSupplementsToProductViewModelInput {
  save(BuildContext context, int productId);
  select(Supplement supplement, List<int> selectedSupplemnts);
  Sink get inputSupplements;
  Sink get inputSelectedSupplements;
}

abstract class AddSupplementsToProductViewModelOutput {
  Stream<List<Supplement>> get outputSupplements;
  Stream<List<int>> get outputSelectedSupplements;
}
