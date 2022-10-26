import 'dart:core';
import 'activity.dart';
import 'professional.dart';
import 'student.dart';
import 'user.dart';

class Project {
  String title;
  int id;
  String description;
  String advisor;
  DateTime beginDate;
  DateTime? endDate;
  String status;
  List<Activity> projectActivities = <Activity>[];
  List<IUser> studentsPresents = <IUser>[];
  List<Professional> professionalsPresents = <Professional>[];

  Project({
    required this.title,
    required this.id,
    required this.description,
    required this.advisor,
    required this.beginDate,
    required this.status,
  });
}
