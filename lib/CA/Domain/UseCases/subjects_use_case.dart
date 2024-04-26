import 'package:dartz/dartz.dart';
import 'package:najme/CA/Core/Error/failure.dart';
import 'package:najme/CA/Core/UseCase/base_usecase.dart';
import 'package:najme/CA/Data/Models/subject_model.dart';
import 'package:najme/CA/Domain/Repositories/subjects_repo.dart';

class GetSubjectsUseCase extends BaseUseCase<List<SubjectModel>, NoParameters> {
  SubjectsRepository subjectsRepository;

  GetSubjectsUseCase(this.subjectsRepository);

  @override
  Future<Either<Failure, List<SubjectModel>>> call(
      NoParameters parameters) async {
    return await subjectsRepository.getSubjects();
  }
}
