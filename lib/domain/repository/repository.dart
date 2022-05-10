import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, SignInData>> signIn(String userName, String password);
  Future<Either<Failure, SignInData>> addUser(AddUserRequest addUserRequest);
  Future<Either<Failure, Category>> addCategory(
      AddCategoryRequest addCategoryRequest);
  Future<Either<Failure, Supplement>> addSupplement(
      AddSupplementRequest addSupplementRequest);
}
