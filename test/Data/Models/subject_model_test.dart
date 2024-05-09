import 'dart:convert';

import 'package:najme/CA/Data/Models/subject_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../Fixtures/fixtures_reader.dart';

void main() {
  final testSubjectModel = SubjectModel(
    id: "id",
    title: "title",
    icon: "icon",
    locked: true,
  );

  test('should return a valid model', () {
    //arrange
    final Map<String, dynamic> map = json.decode(fixture("subject.json"));
    //act
    final result = SubjectModel.fromJson(map);
    //assert
    expect(result, testSubjectModel);
  });
}
