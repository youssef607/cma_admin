import 'dart:async';

import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/addproduct_usecase.dart';
import 'package:cma_admin/domain/usecase/category_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rxdart/rxdart.dart';

class AddProductViewModel extends BaseViewModel
    with AddProductViewModelInput, AddProductViewModelOutput {
  final _categorieStreamController = BehaviorSubject<List<Category>>();
  StreamController _colorStreamController = StreamController<Color>.broadcast();
  StreamController _priceStreamController =
      StreamController<String>.broadcast();

  StreamController _titleStreamController =
      StreamController<String>.broadcast();

  StreamController _categoryIdStreamController =
      StreamController<String>.broadcast();

  StreamController _profilePictureStreamController =
      StreamController<PickerFile?>.broadcast();

  StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  AddProductUseCase _addProductUseCase;
  CategoryUseCase _categoryUseCase;

  var addroductViewObject = AddProductObject("", "", null, "", "");

  AddProductViewModel(this._addProductUseCase, this._categoryUseCase);

  //  -- inputs
  @override
  void start() {
    inputState.add(ContentState());
    loadCategory();
  }

  @override
  addProduct() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _addProductUseCase.execute(AddProductUseCaseInput(
      addroductViewObject.categoryId,
      addroductViewObject.color.toString(),
      addroductViewObject.image,
      addroductViewObject.price,
      addroductViewObject.title,
    )))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.POPUP_ERROR_STATE, failure.message))
                }, (data) {
      inputState.add(ContentState());
      isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  loadCategory() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _categoryUseCase.execute(EMPTY)).fold(
      (failure) {
        inputState.add(ErrorState(
            StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      },
      (categories) async {
        inputState.add(ContentState());
        inputCategories.add(categories);
      },
    );
  }

  @override
  void dispose() {
    _isAllInputsValidStreamController.close();
    _profilePictureStreamController.close();
    _colorStreamController.close();
    _titleStreamController.close();
    _priceStreamController.close();
    _categoryIdStreamController.close();
    _isAllInputsValidStreamController.close();
    _categorieStreamController.close();
    super.dispose();
  }

  @override
  setColor(Color color) {
    inputPickerColor.add(color);
    addroductViewObject = addroductViewObject.copyWith(
        color: colorToHex(color, includeHashSign: false));
  }

  @override
  setTitle(String title) {
    inputTitle.add(title);
    if (_isTitleValid(title)) {
      addroductViewObject = addroductViewObject.copyWith(title: title);
    } else {
      addroductViewObject = addroductViewObject.copyWith(title: "");
    }
    _validate();
  }

  @override
  setPrice(String price) {
    inputPrice.add(price);
    if (_isPriceValid(price)) {
      addroductViewObject = addroductViewObject.copyWith(price: price);
    } else {
      addroductViewObject = addroductViewObject.copyWith(price: price);
    }
    _validate();
  }

  @override
  setCategoryId(String id) {
    inputCategoryId.add(id);
    if (_isCategoryIdValid(id)) {
      addroductViewObject = addroductViewObject.copyWith(categoryId: id);
    } else {
      addroductViewObject = addroductViewObject.copyWith(categoryId: id);
    }
    _validate();
  }

  @override
  setProfilePicture(PickerFile file) {
    inputProfilePicture.add(file);
    addroductViewObject = addroductViewObject.copyWith(image: file);
    _validate();
  }

  @override
  Sink get inputPickerColor => _colorStreamController.sink;

  @override
  Sink get inputCategoryId => _categoryIdStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputTitle => _titleStreamController.sink;

  @override
  Sink get inputPrice => _priceStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputCategories => _categorieStreamController.sink;

  // -- outputs

  @override
  Stream<Color> get outputPickerColor =>
      _colorStreamController.stream.map((color) => color);

  @override
  Stream<String> get outputCategoryId =>
      _categoryIdStreamController.stream.map((categoryId) => categoryId);

  @override
  Stream<bool> get outputIsTitleValid =>
      _titleStreamController.stream.map((title) => _isTitleValid(title));

  @override
  Stream<String?> get outputErrorTitle => outputIsTitleValid
      .map((isTitleValid) => isTitleValid ? null : "invalid Title");

  @override
  Stream<bool> get outputIsPriceValid =>
      _priceStreamController.stream.map((price) => _isPriceValid(price));

  @override
  Stream<String?> get outputErrorPrice => outputIsPriceValid
      .map((isPriceValid) => isPriceValid ? null : "invalid Price");

  @override
  Stream<PickerFile?> get outputProfilePicture =>
      _profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _validateAllInputs());

  @override
  Stream<List<Category>> get outputCategories =>
      _categorieStreamController.stream.map((categories) => categories);

  // -- private methods
  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  bool _isPriceValid(String price) {
    return double.tryParse(price) != null;
  }

  bool _isCategoryIdValid(String price) {
    return price.isNotEmpty;
  }

  bool _validateAllInputs() {
    return addroductViewObject.title.isNotEmpty &&
        addroductViewObject.categoryId.toString().isNotEmpty &&
        addroductViewObject.price.toString().isNotEmpty &&
        addroductViewObject.image!.byte.isNotEmpty;
  }

  _validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class AddProductViewModelInput {
  addProduct();

  setColor(Color color);

  setProfilePicture(PickerFile file);

  setCategoryId(String id);

  setPrice(String price);

  setTitle(String title);

  Sink get inputPickerColor;

  Sink get inputProfilePicture;

  Sink get inputPrice;

  Sink get inputCategoryId;

  Sink get inputTitle;

  Sink get inputAllInputsValid;

  Sink get inputCategories;
}

abstract class AddProductViewModelOutput {
  Stream<Color> get outputPickerColor;

  Stream<PickerFile?> get outputProfilePicture;

  Stream<String?> get outputCategoryId;

  Stream<bool> get outputIsPriceValid;

  Stream<String?> get outputErrorPrice;

  Stream<bool> get outputIsTitleValid;

  Stream<String?> get outputErrorTitle;

  Stream<bool> get outputIsAllInputsValid;

  Stream<List<Category>> get outputCategories;
}
