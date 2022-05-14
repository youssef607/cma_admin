import 'package:cma_admin/data/data_source/remote_data_source.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/data/network/error_handler.dart';
import 'package:cma_admin/data/network/failure.dart';
<<<<<<< HEAD
=======
import 'package:cma_admin/data/request/request.dart';
>>>>>>> origin/add-product
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
<<<<<<< HEAD
  Future<Either<Failure, List<Category>>> getAllCategory() async {
    try {
      final response = await _remoteDataSource.getAllCategory();
=======
  Future<Either<Failure, SignInData>> addUser(
      AddUserRequest addUserRequest) async {
    try {
      final response = await _remoteDataSource.addUser(addUserRequest);
>>>>>>> origin/add-product

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
<<<<<<< HEAD
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final response = await _remoteDataSource.getAllProduct();
=======
  Future<Either<Failure, Category>> addCategory(
      AddCategoryRequest addCategoryRequest) async {
    try {
      final response = await _remoteDataSource.addCategory(addCategoryRequest);
>>>>>>> origin/add-product

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
<<<<<<< HEAD
  Future<Either<Failure, List<Supplement>>> getAllSupplement() async {
    try {
      final response = await _remoteDataSource.getAllSupplement();
=======
  Future<Either<Failure, Supplement>> addSupplement(
      AddSupplementRequest addSupplementRequest) async {
    try {
      final response =
          await _remoteDataSource.AddSupplement(addSupplementRequest);
>>>>>>> origin/add-product

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
<<<<<<< HEAD
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
=======
  Future<Either<Failure, Product>> addProduct(
      AddProductRequest addProductRequest) async {
    try {
      final response = await _remoteDataSource.addProduct(addProductRequest);

>>>>>>> origin/add-product
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
<<<<<<< HEAD
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
=======
  Future<Either<Failure, List<Category>>> getCategory() async {
    try {
      // its safe to call API
      final response = await _remoteDataSource.getCategory();

>>>>>>> origin/add-product
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
