
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class AddSupplementsToProductUseCase extends BaseUseCase<int,List<Supplement>> {
  Repository _repository;
  AddSupplementsToProductUseCase(this._repository);
  
  @override
  Future<Either<Failure, List<Supplement>>> execute(int input) {
    return _repository.getSupplementsForAdd(input.toString());
  }
  
  Future<Either<Failure,Product>> addSupplementsToProduct(int productId,List<int> suppsId){
    return _repository.addSupplementsToProduct(productId.toString(), getSuppsId(suppsId));
  }

  String getSuppsId(List<int> suppsId){
    String suppsIdString = "";
    for (var i = 0; i < suppsId.length; i++) {
      if (i==0) {
        suppsIdString += "${suppsId[i]}";
      } else {
        suppsIdString += ",${suppsId[i]}";
      }
    }
    return suppsIdString;
  }
}
