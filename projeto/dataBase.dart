import 'activitie.dart';
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

  static List<Project> activeProjcts = <Project>[
    Project(
        title: "Projeto de desenvolvimento mobile",
        id: currenteProjectID,
        description: "Aprender a desenvolver mobile com Flutter",
        coordinator: "18211785",
        beginDate: DateTime.now()),
  ];
  static List<Activitie> activeActvs = <Activitie>[
    Activitie(),
  ];
}
