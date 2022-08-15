
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class WaiterInsightsUseCase extends BaseUseCase<WaiterInsightsUseCaseInput,WaiterInsights> {
  Repository _repository;
  WaiterInsightsUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, WaiterInsights>> execute(WaiterInsightsUseCaseInput input) {
    return _repository.getWaiterInsights(input.date1, input.date2,input.id.toString());
  }
}

class WaiterInsightsUseCaseInput {
  String date1;
  String date2;
  int id;

  WaiterInsightsUseCaseInput(
    this.date1,
    this.date2,
    this.id
  );
}
