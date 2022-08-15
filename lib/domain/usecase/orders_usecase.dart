import 'package:dartz/dartz.dart';

import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';

class OrdersUseCase extends BaseUseCase<OrdersUseCaseInput,OrdersInsights> {
  Repository _repository;
  OrdersUseCase(this._repository);

  @override
  Future<Either<Failure, OrdersInsights>> execute(OrdersUseCaseInput input) {
    return _repository.getOrdersInsights(input.date1,input.date2,input.pageIndex.toString());
  }

  Future<Either<Failure,void>> print(int id){
    return _repository.print(id.toString());
  } 
  
}

class OrdersUseCaseInput {
  String date1;
  String date2;
  int pageIndex;
  
  OrdersUseCaseInput(
    this.date1,
    this.date2,
    this.pageIndex,
  );
}
