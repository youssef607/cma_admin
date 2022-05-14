
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:cma_admin/domain/usecase/product_usecase.dart';
import 'package:dartz/dartz.dart';

class ProductDetailsUseCase extends BaseUseCase<String,List<Supplement>> {
  Repository _repository;
  ProductDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Supplement>>> execute(String input) {
    return _repository.getSupplementsByProduct(input);
  }
  
  Future<Either<Failure, bool>> activeToggle(int id) {
    return _repository.activeToggle(product, id.toString());
  }
  
}