import '../../Domain/Entities/subject_entity.dart';

class SubjectModel extends SubjectEntity {
  SubjectModel({
    required super.id,
    required super.title,
    required super.icon,
    required super.locked,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        id: json['id'],
        title: json['title'],
        icon: json['icon'],
        locked: json['locked'],
      );
}
