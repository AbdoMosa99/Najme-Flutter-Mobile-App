import 'package:dio/dio.dart';
import 'package:najme/CA/Core/Services/web_service.dart';
import 'package:najme/CA/Data/Models/subject_model.dart';

import '../../Core/Error/error_message_model.dart';
import '../../Core/Error/exceptions.dart';

abstract class SubjectsDataSource {
  Future<List<SubjectModel>> getSubjects();
}

class GetSubjectsDataSourceImpl implements SubjectsDataSource {
  GetSubjectsDataSourceImpl();

  @override
  Future<List<SubjectModel>> getSubjects() async {
    final response = await WebService().privateDio.get(
      "1/students/1/subjects/",
    );

    if (response.statusCode == 200) {
      return List<SubjectModel>.from(
        (response.data["subjects"] as List).map(
          (e) => SubjectModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
