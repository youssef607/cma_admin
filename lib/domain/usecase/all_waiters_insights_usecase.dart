
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class AllWaitersInsightsUseCase extends BaseUseCase<AllWaitersInsightsUseCaseInput,AllWaitersInsights> {
  Repository _repository;
  AllWaitersInsightsUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, AllWaitersInsights>> execute(AllWaitersInsightsUseCaseInput input) {
    return _repository.getAllWaitersInsights(input.date1, input.date2);
  }
}

class AllWaitersInsightsUseCaseInput {
  String date1;
  String date2;

  AllWaitersInsightsUseCaseInput(
    this.date1,
    this.date2,
  );
}
