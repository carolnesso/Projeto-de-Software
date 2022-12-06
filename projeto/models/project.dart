import 'dart:core';
import 'activity.dart';
import 'professional.dart';
import 'professor.dart';
import 'user.dart';

enum ProjectStatus { CREATION, INITIATED, IN_PROGRESS, CONCLUDED }

class Project {
  String title;
  int id;
  String description;
  Professor advisor;
  DateTime beginDate;
  DateTime? endDate;
  double paymentValue;

  ProjectStatus status;
  List<Activity> projectActivities = <Activity>[];
  List<IUser> studentsPresents = <IUser>[];
  List<Professional> professionalsPresents = <Professional>[];

  Project({
    required this.title,
    required this.id,
    required this.description,
    required this.paymentValue,
    required this.advisor,
    required this.beginDate,
    required this.status,
  });

  updateStatus() {
    if (this.studentsPresents.length > 0 && this.projectActivities.length > 0 && this.professionalsPresents.length > 0) {
      this.status = ProjectStatus.INITIATED;
    }

    this.projectActivities.forEach((element) {
      if (element.studentsPresents.length > 0) {
        this.status = ProjectStatus.IN_PROGRESS;
      }
    });
  }
}
