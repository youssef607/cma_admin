
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

const String supplementType = "supplement";
class SupplementUseCase extends BaseUseCase<String,List<Supplement>> {
  Repository _repository;
  SupplementUseCase(this._repository);
  
  @override
  Future<Either<Failure, List<Supplement>>> execute(String input) {
    return _repository.getAllSupplement();
  }

  Future<Either<Failure, bool>> activeToggle(int id) {
    return _repository.activeToggle(supplementType,id.toString());
  }

  Future<Either<Failure,bool>> delete(int id){
    return _repository.delete(supplementType,id.toString());
  }
  
}