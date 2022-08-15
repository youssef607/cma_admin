
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:cma_admin/domain/usecase/category_usecase.dart';
import 'package:cma_admin/domain/usecase/product_usecase.dart';
import 'package:dartz/dartz.dart';

class CategoryDetailsUseCase extends BaseUseCase<String,List<Product>> {
  Repository _repository;
  CategoryDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Product>>> execute(String input) {
    return _repository.getProductsByCategory(input);
  }
  
  Future<Either<Failure, bool>> activeToggle(int id) {
    return _repository.activeToggle(categoryType, id.toString());
  }
  
  Future<Either<Failure,bool>> deleteCategory(int id){
    return _repository.delete(categoryType,id.toString());
  }

  Future<Either<Failure,void>> reorder(int id1,int id2){
    return _repository.reorder(productType,id1.toString(),id2.toString());
  }
}