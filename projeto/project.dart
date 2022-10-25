import 'dart:core';
import 'activitie.dart';
import 'professional.dart';
import 'student.dart';
import 'user.dart';

class Project {
  String title;
  int id;
  String description;
  String coordinator;
  DateTime beginDate;
  DateTime? endDate;
  List<Activitie> projectActvs = <Activitie>[
    // Activitie(),
  ];
  List<IUser> studentsPresents = <IUser>[
    // Student(),
  ];
  List<Professional> professionalsPresents = <Professional>[
    // Professional(id: id, login: login, password: password, recoveryKey: recoveryKey),
  ];

  Project({
    required this.title,
    required this.id,
    required this.description,
    required this.coordinator,
    required this.beginDate,
  });
}
