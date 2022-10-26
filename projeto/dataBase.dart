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

  static List<Project> activeProjcts = <Project>[
    // Project(
    //   title: "Projeto de desenvolvimento mobile",
    //   id: currenteProjectID,
    //   description: "Aprender a desenvolver mobile com Flutter",
    //   advisor: "00",
    //   beginDate: DateTime.now(),
    //   status: "Iniciado",
    // ),
  ];

  static List<Activity> activeActivities = <Activity>[
    // Activity(
    //   title: "Oficina de Dart",
    //   id: currrentActivitiesID,
    //   description:
    //       "Básica introdução ao dart para futura aprofundamento em Flutter",
    //   advisor: "00",
    //   beginDate: DateTime.now(),
    // ),
  ];
}
