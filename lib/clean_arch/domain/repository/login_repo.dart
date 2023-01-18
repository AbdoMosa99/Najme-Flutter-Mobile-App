import 'package:najme/clean_arch/data/network/failure.dart';
import 'package:najme/clean_arch/data/network/requests/login_request.dart';
import 'package:najme/clean_arch/domain/models/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
