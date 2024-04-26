import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final String id;
  final String title;
  final String icon;
  final bool locked;

  SubjectEntity({
    required this.id,
    required this.title,
    required this.icon,
    required this.locked,
  });

  @override
  List<Object?> get props => [id, title, icon, locked];
}
