import 'activity.dart';
import 'professor.dart';
import 'project.dart';
import 'user.dart';

abstract class DataBase {
  static List<IUser> usersDb = <IUser>[
    Professor(
      id: "00",
      login: "11",
      password: "22",
      recoveryKey: "hannahbanana",
    ),
  ];

  static List<Project> activeProjects = <Project>[];

  static List<Activity> activeActivities = <Activity>[];
}
