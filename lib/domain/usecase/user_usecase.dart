import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
const String userType = "user";
class UserUseCase extends BaseUseCase<String,List<User>> {
  Repository _repository;
  UserUseCase(this._repository);
  
  @override
  Future<Either<Failure, List<User>>> execute(String input) {
    return _repository.getAllUser();
  }
  
  Future<Either<Failure, bool>> activeToggle(int id) {
    return _repository.activeToggle(userType,id.toString());
  }
}