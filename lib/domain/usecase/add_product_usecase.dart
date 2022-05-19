import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class AddProductUseCase
    implements BaseUseCase<AddProductUseCaseInput, Product> {
  Repository _repository;

  AddProductUseCase(this._repository);

  @override
  Future<Either<Failure, Product>> execute(AddProductUseCaseInput input) async {
    return await _repository.addProduct(AddProductRequest(
        input.categoryId, input.color, input.image, input.price, input.title));
  }
}

class AddProductUseCaseInput {
  String categoryId;
  String color;
  PickerFile? image;
  String price;
  String title;

  AddProductUseCaseInput(
      this.categoryId, this.color, this.image, this.price, this.title);
}
