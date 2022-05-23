import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateProductUseCase
    implements BaseUseCase<UpdateProductUseCaseInput, Product> {
  Repository _repository;

  UpdateProductUseCase(this._repository);

  @override
  Future<Either<Failure, Product>> execute(
      UpdateProductUseCaseInput input) async {
    return await _repository.updateProduct(UpdateProductRequest(input.id,
        input.categoryId, input.color, input.image, input.price, input.title));
  }
}

class UpdateProductUseCaseInput {
  String id;
  String categoryId;
  String color;
  PickerFile? image;
  String price;
  String title;

  UpdateProductUseCaseInput(
      this.id, this.categoryId, this.color, this.image, this.price, this.title);
}
