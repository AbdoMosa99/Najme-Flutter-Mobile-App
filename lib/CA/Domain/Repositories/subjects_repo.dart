import 'package:dartz/dartz.dart';
import 'package:najme/CA/Data/Models/subject_model.dart';

import '../../Core/Error/failure.dart';

abstract class SubjectsRepository{
  Future<Either<Failure, List<SubjectModel>>> getSubjects();
}