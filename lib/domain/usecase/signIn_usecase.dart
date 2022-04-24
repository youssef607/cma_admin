import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase implements BaseUseCase<SignInUseCaseInput, SignInData> {
  Repository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, SignInData>> execute(SignInUseCaseInput input) async {
    return await _repository.signIn(input.userName, input.password);
  }
}

class SignInUseCaseInput {
  String userName;
  String password;

  SignInUseCaseInput(this.userName, this.password);
}
