
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class AddUserUseCase implements BaseUseCase<AddUserUseCaseInput, SignInData> {
  Repository _repository;

  AddUserUseCase(this._repository);

  @override
  Future<Either<Failure, SignInData>> execute(AddUserUseCaseInput input) async {
    return await _repository.addUser(AddUserRequest(
        input.image, input.name, input.password, input.role, input.username));
  }
}

class AddUserUseCaseInput {
  PickerFile? image;
  String name;
  String password;
  String role;
  String username;

  AddUserUseCaseInput(
      this.image, this.name, this.password, this.role, this.username);
}
