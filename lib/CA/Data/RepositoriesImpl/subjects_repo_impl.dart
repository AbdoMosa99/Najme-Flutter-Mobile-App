import 'package:dartz/dartz.dart';
import 'package:najme/CA/Data/DataSource/subjects_data_source.dart';
import 'package:najme/CA/Data/Models/subject_model.dart';
import 'package:najme/CA/Domain/Repositories/subjects_repo.dart';

import '../../Core/Error/exceptions.dart';
import '../../Core/Error/failure.dart';

class SubjectsRepositoryImpl extends SubjectsRepository {
  final SubjectsDataSource subjectsDataSource;

  SubjectsRepositoryImpl(this.subjectsDataSource);

  @override
  Future<Either<Failure, List<SubjectModel>>> getSubjects() async {
    final result = await subjectsDataSource.getSubjects();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }
}
