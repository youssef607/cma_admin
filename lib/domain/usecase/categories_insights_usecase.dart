
import 'package:dartz/dartz.dart';

import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';

class CategoriesInsightsUseCase extends BaseUseCase<CategoriesInsightsUseCaseInput,List<CategoryCount>> {
  Repository _repository;
  CategoriesInsightsUseCase(this._repository);
  

  @override
  Future<Either<Failure, List<CategoryCount>>> execute(CategoriesInsightsUseCaseInput input) {
    return _repository.getCategoriesQuantityConsumed(input.date1, input.date2);
  }
  
}

class CategoriesInsightsUseCaseInput {
  String date1;

  String date2;

  CategoriesInsightsUseCaseInput(
    this.date1,
    this.date2,
  );

}
