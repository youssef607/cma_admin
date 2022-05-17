import 'package:cma_admin/data/data_source/remote_data_source.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/data/network/error_handler.dart';
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, SignInData>> signIn(
      String userName, String password) async {
    try {
      final response = await _remoteDataSource.signIn(userName, password);

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getAllCategory() async {
    try {
      final response = await _remoteDataSource.getAllCategory();

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final response = await _remoteDataSource.getAllProduct();

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Supplement>>> getAllSupplement() async {
    try {
      final response = await _remoteDataSource.getAllSupplement();

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllUser() async {
    try {
      final response = await _remoteDataSource.getAllUser();

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
  
  @override
  Future<Either<Failure, bool>> activeToggle(String type, String id) async {
    try {
      final response = await _remoteDataSource.activeToggle(type, id);

      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, HomeData>> home(String date1, String date2) async {
    try {
      final response = await _remoteDataSource.home(date1, date2);
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
      String id) async {
    try {
      final response = await _remoteDataSource.getProductsByCategory(id);
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Supplement>>> getSupplementsByProduct(String id) async {
    try {
      final response = await _remoteDataSource.getSupplemensByProduct(id);
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, Product>> addSupplementsToProduct(String productId,String suppsId) async {
    try {
      final response = await _remoteDataSource.addSupplementsToProduct(productId, suppsId);
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Supplement>>> getSupplementsForAdd(String id) async {
    try {
      final response = await _remoteDataSource.getSupplementsForAdd(id);
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, Category>> addCategory(AddCategoryRequest addCategoryRequest)async {
    try {
      final response = await _remoteDataSource.addCategory(addCategoryRequest);

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, Product>> addProduct(AddProductRequest addProductRequest) async{
    try {
      final response = await _remoteDataSource.addProduct(addProductRequest);

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, Supplement>> addSupplement(AddSupplementRequest addSupplementRequest) async{
    try {
      final response = await _remoteDataSource.addSupplement(addSupplementRequest);

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, SignInData>> addUser(AddUserRequest addUserRequest) async{
    try {
      final response = await _remoteDataSource.addUser(addUserRequest);

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteSupplementFromProduct(String productId, String suppId) async{
    try {
      final response = await _remoteDataSource.deleteSupplementsToProduct(productId, suppId);

      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
