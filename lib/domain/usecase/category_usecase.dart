<<<<<<< HEAD

=======
>>>>>>> origin/add-product
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

<<<<<<< HEAD
const String category = "category";

class CategoryUseCase extends BaseUseCase<String,List<Category>> {
  Repository _repository;
=======
class CategoryUseCase extends BaseUseCase<String, List<Category>> {
  Repository _repository;

>>>>>>> origin/add-product
  CategoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<Category>>> execute(String input) {
<<<<<<< HEAD
    return _repository.getAllCategory();
  }

  Future<Either<Failure, bool>> activeToggle(int id) {
    return _repository.activeToggle(category,id.toString());
  }
  
}
=======
    return _repository.getCategory();
  }
}
>>>>>>> origin/add-product
