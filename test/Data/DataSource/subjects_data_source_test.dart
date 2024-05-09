import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:najme/CA/Core/Config/constants.dart';
import 'package:najme/CA/Core/Services/web_service.dart';
import 'package:najme/CA/Data/DataSource/subjects_data_source.dart';
import 'package:najme/CA/Data/Models/subject_model.dart';
import 'package:mockito/mockito.dart';

main() {
  test("get subjects should return posts without any exception", () async {
    late GetSubjectsDataSourceImpl getSubjectsDataSourceImpl;
    // setUp(() => );
    // arrange
    final subjects = List.generate(
      5,
      (index) => SubjectModel(
        id: index.toString(),
        title: "title",
        icon: "icon",
        locked: true,
      ),
    );
    final subjectsMap = subjects.map((e) => e.toJson());
    when(
      WebService().privateDio.get(Constants.getSubjectsApi),
    ).thenAnswer(
      (_) => Future.value(
        Response(
          requestOptions: RequestOptions(
            path: "${Constants.baseUrlStg}${Constants.getSubjectsApi}",
          ),
          data: subjectsMap,
          statusCode: 200,
        ),
      ),
    );

    //act
    // final result = await remoteDataSource.getPosts();

    //assert
    // expect(result, subjects);
  });
  test("get subjects should throw an Exception if the status code is not 200",
      () => null);
}
