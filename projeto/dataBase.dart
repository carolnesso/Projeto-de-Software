import 'project.dart';
import 'student.dart';
import 'user.dart';

abstract class DataBase {
  static List<IUser> usersDb = <IUser>[
    Student(
      id: "18211736",
      login: "01739793439",
      password: "batata",
      recoveryKey: "hannahbanana",
    ),
  ];

  static List<Project> activeProjcts = <Project>[];
}
