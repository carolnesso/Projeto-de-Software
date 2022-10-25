import 'dart:io';

import 'dataBase.dart';

abstract class SaveDB {
  static saveDB() async {
    String db = '';
    DataBase.usersDb.forEach((element) {
      db = db +
          '${element.id}:\n ${element.login}\n ${element.password}\n ${element.recorveryKey}\n ${element.researchGrantBegin}\n ${element.researchGrantDeadline}\n\n';
    });

    DataBase.activeProjcts.forEach((element) {
      String studentListString = '';
      element.studentsPresents.forEach((element) {
        studentListString = studentListString + '${element.id}, ';
      });
      db = db +
          '${element.id}:\n ${element.title}\n ${element.description}\n ${element.coordinator}\n ${element.beginDate}\n ${element.endDate ?? ''}\n ${studentListString}\n\n';
    });

    final filename = 'DB.txt';
    await File(filename).writeAsString(db);
  }
}
