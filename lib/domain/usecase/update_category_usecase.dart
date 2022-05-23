import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateCategoryUseCase
    implements BaseUseCase<UpdateCategoryUseCaseInput, Category> {
  Repository _repository;

  UpdateCategoryUseCase(this._repository);

  @override
  Future<Either<Failure, Category>> execute(
      UpdateCategoryUseCaseInput input) async {
    return await _repository.UpdateCategory(
        UpdateCategoryRequest(input.id, input.image, input.label, input.color));
  }
}

class UpdateCategoryUseCaseInput {
  String id;
  String color;
  PickerFile? image;
  String label;

  UpdateCategoryUseCaseInput(this.id, this.color, this.image, this.label);
}
