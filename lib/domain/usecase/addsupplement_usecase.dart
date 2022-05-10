import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class AddSupplementUseCase
    implements BaseUseCase<AddSupplementUseCaseInput, Supplement> {
  Repository _repository;

  AddSupplementUseCase(this._repository);

  @override
  Future<Either<Failure, Supplement>> execute(
      AddSupplementUseCaseInput input) async {
    return await _repository.addSupplement(AddSupplementRequest(
        input.image, input.title, input.color, input.price));
  }
}

class AddSupplementUseCaseInput {
  String color;

  PickerFile? image;
  String price;
  String title;

  AddSupplementUseCaseInput(this.color, this.image, this.title, this.price);
}
