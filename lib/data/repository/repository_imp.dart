import 'package:cma_admin/data/data_source/remote_data_source.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/data/network/error_handler.dart';
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/network/network_info.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  // NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, SignInData>> signIn(
      String userName, String password) async {
    // if (await _networkInfo.isConnected) {
    try {
      // its safe to call API
      final response = await _remoteDataSource.signIn(userName, password);

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
  // else {
  //   return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  // }
}
