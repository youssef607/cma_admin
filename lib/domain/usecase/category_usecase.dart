import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class CategoryUseCase extends BaseUseCase<String, List<Category>> {
  Repository _repository;

  CategoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<Category>>> execute(String input) {
    return _repository.getCategory();
  }
}
