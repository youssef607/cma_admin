import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class DashboardUseCase extends BaseUseCase<DashboardUseCaseInput,HomeData> {
  Repository _repository;
  DashboardUseCase(this._repository);

  @override
  Future<Either<Failure,HomeData>> execute(DashboardUseCaseInput input) {
    return _repository.home(input.date1,input.date2);
  }
}

class DashboardUseCaseInput{
  String date1;
  String date2;

  DashboardUseCaseInput(this.date1,this.date2);
}