
import 'package:dartz/dartz.dart';

import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';

class ProductsInsightsUseCase extends BaseUseCase<ProductsInsightsUseCaseInput,List<ProductCount>> {
  Repository _repository;
  ProductsInsightsUseCase(this._repository);
  

  @override
  Future<Either<Failure, List<ProductCount>>> execute(ProductsInsightsUseCaseInput input) {
    return _repository.getProductsQuantityConsumedByCategory(input.date1, input.date2,input.categoryId.toString());
  }
  
}

class ProductsInsightsUseCaseInput {
  String date1;
  String date2;
  int categoryId;

  ProductsInsightsUseCaseInput(
    this.date1,
    this.date2,
    this.categoryId,
  );

}
