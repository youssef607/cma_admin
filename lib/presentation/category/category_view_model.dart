import 'dart:async';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/addcategory_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';

class AddCategoryViewModel extends BaseViewModel
    with AddCategoryViewModelInput, AddCategoryViewModelOutput {
  StreamController _colorStreamController =
      StreamController<String>.broadcast();

  StreamController _profilePictureStreamController =
      StreamController<PickerFile?>.broadcast();

  StreamController _labelStreamController =
      StreamController<String>.broadcast();

  StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isAddCategorySuccessfullyStreamController =
      StreamController<bool>();

  AddCategoryUseCase _addCategoryUseCase;

  var addCategoryViewObject = AddCategoryObject("", null, "");

  AddCategoryViewModel(this._addCategoryUseCase);

  //  -- inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  register() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _addCategoryUseCase.execute(AddCategoryUseCaseInput(
      addCategoryViewObject.color,
      addCategoryViewObject.image,
      addCategoryViewObject.label,
    )))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.POPUP_ERROR_STATE, failure.message))
                }, (data) {
      inputState.add(ContentState());
      isAddCategorySuccessfullyStreamController.add(true);
    });
  }

  @override
  void dispose() {
    _isAllInputsValidStreamController.close();
    _profilePictureStreamController.close();
    _colorStreamController.close();
    _labelStreamController.close();
    isAddCategorySuccessfullyStreamController.close();

    super.dispose();
  }

  @override
  setColor(String color) {
    inputColor.add(color);
    if (_isColorValid(color)) {
      addCategoryViewObject = addCategoryViewObject.copyWith(color: color);
    } else {
      addCategoryViewObject = addCategoryViewObject.copyWith(color: "");
    }
    _validate();
  }

  @override
  setLabel(String label) {
    inputLabel.add(label);
    if (_isLabelValid(label)) {
      addCategoryViewObject = addCategoryViewObject.copyWith(label: label);
    } else {
      addCategoryViewObject = addCategoryViewObject.copyWith(label: "");
    }
    _validate();
  }

  @override
  setProfilePicture(PickerFile file) {
    inputProfilePicture.add(file);
    addCategoryViewObject = addCategoryViewObject.copyWith(image: file);
    _validate();
  }

  @override
  Sink get inputColor => _colorStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputLabel => _labelStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  // -- outputs

  @override
  Stream<bool> get outputIsColorValid =>
      _colorStreamController.stream.map((color) => _isColorValid(color));

  @override
  Stream<String?> get outputErrorColor => outputIsColorValid
      .map((isColorValid) => isColorValid ? null : "invalid color");

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
  bool _isColorValid(String color) {
    return color.length >= 0;
  }

  bool _isLabelValid(String label) {
    return label.length > 0;
  }

  bool _validateAllInputs() {
    return addCategoryViewObject.color.isNotEmpty &&
        addCategoryViewObject.label.isNotEmpty;
  }

  _validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class AddCategoryViewModelInput {
  register();

  setColor(String color);

  setProfilePicture(PickerFile file);

  setLabel(String label);

  Sink get inputColor;

  Sink get inputProfilePicture;

  Sink get inputLabel;

  Sink get inputAllInputsValid;
}

abstract class AddCategoryViewModelOutput {
  Stream<bool> get outputIsColorValid;

  Stream<String?> get outputErrorColor;

  Stream<PickerFile?> get outputProfilePicture;

  Stream<bool> get outputIsLabelValid;

  Stream<String?> get outputErrorLabel;

  Stream<bool> get outputIsAllInputsValid;
}
