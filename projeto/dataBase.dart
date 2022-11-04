import 'activity.dart';
import 'project.dart';
import 'singleton.dart';
import 'student.dart';
import 'user.dart';

abstract class DataBase {
  static List<IUser> usersDb = <IUser>[
    Student(
      id: "00",
      login: "11",
      password: "22",
      recoveryKey: "hannahbanana",
    ),
  ];

  static List<Project> activeProjects = <Project>[];

  static List<Activity> activeActivities = <Activity>[];
}
