import 'package:cma_admin/domain/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName, String password) = _LoginObject;
}

@freezed
class AddUserObject with _$AddUserObject {
  factory AddUserObject(
    PickerFile? image,
    String name,
    String role,
    String password,
    String username,
  ) = _AddUserObject;
}

@freezed
class AddCategoryObject with _$AddCategoryObject {
  factory AddCategoryObject(
    String color,
    PickerFile? image,
    String label,
  ) = _AddCategoryObject;
}

@freezed
class AddSupplementObject with _$AddSupplementObject {
  factory AddSupplementObject(
    String color,
    PickerFile? image,
    String price,
    String title,
  ) = _AddSupplementObject;
}

@freezed
class AddProductObject with _$AddProductObject {
  factory AddProductObject(
    String categoryId,
    String color,
    PickerFile? image,
    String price,
    String title,
  ) = _AddProductObject;
}

//update
@freezed
class UpdateSupplementObject with _$UpdateSupplementObject {
  factory UpdateSupplementObject(
    String id,
    String color,
    PickerFile? image,
    String price,
    String title,
  ) = _UpdateSupplementObject;
}

@freezed
class UpdateCategoryObject with _$UpdateCategoryObject {
  factory UpdateCategoryObject(
    String id,
    String color,
    PickerFile? image,
    String label,
  ) = _UpdateCategoryObject;
}

@freezed
class UpdateProductObject with _$UpdateProductObject {
  factory UpdateProductObject(
    String id,
    String categoryId,
    String color,
    PickerFile? image,
    String price,
    String title,
  ) = _UpdateProductObject;
}

@freezed
class AddSupplementsToProductObject with _$AddSupplementsToProductObject {
  factory AddSupplementsToProductObject(List<int> selectedSupplements) =
      _AddSupplementsToProductObject;
}

@freezed
class OrdersViewObject with _$OrdersViewObject {
  factory OrdersViewObject(
    PickerDateRange dateRange,
  ) = _OrdersViewObject; 
}
