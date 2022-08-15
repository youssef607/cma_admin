import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class DashboardUseCase extends BaseUseCase<String,HomeData> {
  Repository _repository;
  DashboardUseCase(this._repository);

  @override
  Future<Either<Failure,HomeData>> execute(String input) {
    return _repository.home();
  }

  Future<Either<Failure,void>> print(String id){
    return _repository.print(id);
  }
}
