import 'dart:async';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/update_category_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class UpdateCategoryViewModel extends BaseViewModel
    with UpdateCategoryViewModelInput, UpdateCategoryViewModelOutput {
  StreamController _colorStreamController = StreamController<Color>.broadcast();

  StreamController _profilePictureStreamController =
      StreamController<PickerFile?>.broadcast();

  StreamController _labelStreamController =
      StreamController<String>.broadcast();

  StreamController _isAllInputsValidStreamController =
      StreamController<bool>.broadcast();

  StreamController isUpdateCategorySuccessfullyStreamController =
      StreamController<bool>();

  UpdateCategoryUseCase _updateCategoryUseCase;

  var updateCategoryViewObject = UpdateCategoryObject("", "", null, "");

  UpdateCategoryViewModel(this._updateCategoryUseCase);

  //  -- inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  updateCategory(BuildContext context) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _updateCategoryUseCase.execute(UpdateCategoryUseCaseInput(
      updateCategoryViewObject.id,
      updateCategoryViewObject.color,
      updateCategoryViewObject.image,
      updateCategoryViewObject.label,
    )))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.POPUP_ERROR_STATE, failure.message))
                }, (data) {
      inputState.add(ContentState());
      isUpdateCategorySuccessfullyStreamController.add(true);
      // Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _isAllInputsValidStreamController.close();
    _profilePictureStreamController.close();
    _colorStreamController.close();
    _labelStreamController.close();
    isUpdateCategorySuccessfullyStreamController.close();

    super.dispose();
  }

  @override
  setColor(Color color) {
    inputPickerColor.add(color);
    updateCategoryViewObject = updateCategoryViewObject.copyWith(
        color: colorToHex(color, includeHashSign: false));
  }

  @override
  setLabel(String label) {
    inputLabel.add(label);
    if (_isLabelValid(label)) {
      updateCategoryViewObject =
          updateCategoryViewObject.copyWith(label: label);
    } else {
      updateCategoryViewObject = updateCategoryViewObject.copyWith(label: "");
    }
    _validate();
  }

  @override
  setProfilePicture(PickerFile file) {
    inputProfilePicture.add(file);
    updateCategoryViewObject = updateCategoryViewObject.copyWith(image: file);
    _validate();
  }

  setId(String id) {
    updateCategoryViewObject = updateCategoryViewObject.copyWith(id: id);
  }

  @override
  Sink get inputPickerColor => _colorStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputLabel => _labelStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  // -- outputs

  @override
  Stream<Color> get outputPickerColor =>
      _colorStreamController.stream.map((color) => color);

  @override
  Stream<bool> get outputIsLabelValid =>
      _labelStreamController.stream.map((label) => _isLabelValid(label));

  @override
  Stream<String?> get outputErrorLabel => outputIsLabelValid
      .map((isLabelValid) => isLabelValid ? null : "invalid Label");

  @override
  Stream<PickerFile?> get outputProfilePicture =>
      _profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _validateAllInputs());

  // -- private methods
  bool _isLabelValid(String label) {
    return label.length > 0;
  }

  bool _validateAllInputs() {
    return updateCategoryViewObject.label.isNotEmpty;
  }

  _validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class UpdateCategoryViewModelInput {
  updateCategory(BuildContext context);

  setColor(Color color);

  setProfilePicture(PickerFile file);

  setLabel(String label);

  Sink get inputPickerColor;

  Sink get inputProfilePicture;

  Sink get inputLabel;

  Sink get inputAllInputsValid;
}

abstract class UpdateCategoryViewModelOutput {
  Stream<Color> get outputPickerColor;

  Stream<PickerFile?> get outputProfilePicture;

  Stream<bool> get outputIsLabelValid;

  Stream<String?> get outputErrorLabel;

  Stream<bool> get outputIsAllInputsValid;
}
