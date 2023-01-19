import 'package:dartz/dartz.dart';
import 'package:najme/clean_arch/data/network/failure.dart';

// In for input from view model to use case ==> input
// Out for output from data to view ==> product
abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
