import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateSupplementUseCase
    implements BaseUseCase<UpdateSupplementUseCaseInput, Supplement> {
  Repository _repository;

  UpdateSupplementUseCase(this._repository);

  @override
  Future<Either<Failure, Supplement>> execute(
      UpdateSupplementUseCaseInput input) async {
    return await _repository.updateSupplement(UpdateSupplementRequest(
        input.id, input.color, input.image, input.price, input.title));
  }
}

class UpdateSupplementUseCaseInput {
  String id;
  String color;
  PickerFile? image;
  String price;
  String title;

  UpdateSupplementUseCaseInput(
      this.id, this.color, this.image, this.price, this.title);
}
