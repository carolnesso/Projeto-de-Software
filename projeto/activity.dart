import 'dart:core';
import 'professional.dart';
import 'professor.dart';
import 'user.dart';

class Activity {
  String title;
  int id;
  String description;
  Professor advisor;
  DateTime beginDate;
  DateTime? endDate;

  List<IUser> studentsPresents = <IUser>[];
  List<Professional> professionalsPresents = <Professional>[];

  Activity({
    required this.title,
    required this.id,
    required this.description,
    required this.advisor,
    required this.beginDate,
  });
}
