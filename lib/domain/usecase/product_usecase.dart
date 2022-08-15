
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

const String productType = "product";

class ProductUseCase extends BaseUseCase<String,List<Product>> {
  Repository _repository;
  ProductUseCase(this._repository);
  
  @override
  Future<Either<Failure, List<Product>>> execute(String input) {
    return _repository.getAllProduct();
  }

  Future<Either<Failure, bool>> activeToggle(int id) {
    return _repository.activeToggle(productType,id.toString());
  }

  Future<Either<Failure,bool>> delete(int id){
    return _repository.delete(productType,id.toString());
  }

  Future<Either<Failure,void>> reorder(int id1,int id2){
    return _repository.reorder(productType,id1.toString(),id2.toString());
  } 
}