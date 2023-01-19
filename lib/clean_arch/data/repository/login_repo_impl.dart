import 'package:dartz/dartz.dart';
import 'package:najme/clean_arch/data/data_source/remote_data_source.dart';
import 'package:najme/clean_arch/data/mapper/login_mapper.dart';
import 'package:najme/clean_arch/data/network/error_handler.dart';
import 'package:najme/clean_arch/data/network/failure.dart';
import 'package:najme/clean_arch/data/network/network_info.dart';
import 'package:najme/clean_arch/data/network/requests/login_request.dart';
import 'package:najme/clean_arch/domain/models/login_model.dart';
import 'package:najme/clean_arch/domain/repository/login_repo.dart';

class LoginRepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  LoginRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == APIInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data
          return Right(response.toDomain());
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(APIInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
