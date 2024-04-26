import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../Error/failure.dart';

abstract class BaseUseCase<Type, Parameters> {
  Future<Either<Failure, Type>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}
