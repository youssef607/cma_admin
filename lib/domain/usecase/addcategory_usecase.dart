import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class AddCategoryUseCase
    implements BaseUseCase<AddCategoryUseCaseInput, Category> {
  Repository _repository;

  AddCategoryUseCase(this._repository);

  @override
  Future<Either<Failure, Category>> execute(
      AddCategoryUseCaseInput input) async {
    return await _repository
        .addCategory(AddCategoryRequest(input.image, input.label, input.color));
  }
}

class AddCategoryUseCaseInput {
  String color;
  PickerFile? image;
  String label;

  AddCategoryUseCaseInput(this.color, this.image, this.label);
}
