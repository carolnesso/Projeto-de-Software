import 'dart:io';

import '../../models/activity.dart';
import '../../models/professor.dart';
import '../../models/user.dart';
import '../../database/dataBase.dart';
import '../../database/save_db.dart';
import '../../singleton.dart';

abstract class ActivitiesArea {
  static activitiesArea() {
    print("Você escolheu a área de atividades.\nO que você deseja fazer?:\n");
    print("1 - Criar uma atividade;");
    print("2 - Editar uma ativiade;");
    print("3 - Adicionar um aluno à uma atividade;");
    String? newInput = stdin.readLineSync();

    if (newInput == "1") {
      print(
          "Você escolheu criar atividade. Digite as seguintes informações pedidas:");
      print("Insira o nome da atividade:");
      String title = stdin.readLineSync()!;
      print("Insira uma descrição para a atividade:");
      String description = stdin.readLineSync()!;
      print("Insira o ID do professor orientador");
      String advisor = stdin.readLineSync()!;
      Professor? professor;
      DataBase.usersDb.forEach(
        (element) {
          if (element.id == advisor) {
            if (element.runtimeType == Professor) {
              professor = element as Professor;
            }
          }
        },
      );

      if (professor == null) {
        print(
            "O usuário não é um professor ou não foi encontrado.\nTente novamente.\n");
        return;
      }
      late Activity newActivity;
      newActivity = Activity(
        title: title,
        id: currenteActivitiesID,
        description: description,
        advisor: professor!,
        beginDate: DateTime.now(),
      );
      print("Seu ID de atividade é: " +
          currenteActivitiesID.toString() +
          "\nNecessário salvá-lo para futuras alteracões e/ou consultas.\n");
      currenteActivitiesID = currenteActivitiesID + 1;

      DataBase.activeActivities.add(newActivity);
      SaveDB.writeDB();
      return;
    }

    // TODO: criar edicão de atividade existente
    if (newInput == "2") {
      return;
    }

    if (newInput == "3") {
      print(
          "Você escolheu adicionar um aluno à uma atividade, por favor insira a ID da atividade e o ID do aluno que deseja adicionar:\n");
      int idActivity = int.parse(stdin.readLineSync()!);
      String idStudent = stdin.readLineSync()!;
      DataBase.activeActivities.forEach(
        (element) {
          print(element.id);
          if (element.id == idActivity) {
            IUser? student = DataBase.usersDb
                .firstWhere((element) => element.id == idStudent);
            element.studentsPresents.add(student);
          }
        },
      );
      DataBase.activeProjects.forEach(
        (element) {
          element.projectActivities.forEach(
            (activity) {
              if (activity.id == idActivity) {
                element.updateStatus();
              }
            },
          );
        },
      );
      SaveDB.writeDB();
    }
  }
}
