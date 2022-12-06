import 'dart:io';

import '../../models/activity.dart';
import '../../models/professor.dart';
import '../../database/dataBase.dart';
import '../../database/save_db.dart';
import '../../models/user.dart';
import '../../singleton.dart';

abstract class ActivitiesArea {
  static activitiesArea() {
    print("Você escolheu a área de atividades.\nO que você deseja fazer?:\n");
    print("1 - Criar uma atividade;");
    print("2 - Editar uma atividade;");
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
          "\nNecessário salvá-lo para futuras alterações e/ou consultas.\n");
      currenteActivitiesID = currenteActivitiesID + 1;

      DataBase.activeActivities.add(newActivity);
      SaveDB.writeDB();
      return;
    }

    if (newInput == "2") {
      try {
        print("Insira a ID da atividade que deseja editar");
        int idActivity = int.parse(stdin.readLineSync()!);
        DataBase.activeActivities.forEach(
          (element) {
            if (element.id == idActivity) {
              print("O que você deseja alterar?\n");
              print("1 - Alterar o nome");
              print("2 - Alterar descrição");
              print("3 - Alterar coordenador da atividade");
              print("4 - Remover um aluno da atividade");
              print("5 - Marcar atividade como concluída");
              print("6 - Excluir atividade.");
              String? newInput = stdin.readLineSync();
        
              if (newInput == "1") {
                print("Digite o novo título do projeto");
                String? newTile = stdin.readLineSync();
                element.title = newTile!;
                SaveDB.writeDB();
              }
              if (newInput == "2") {
                print("Digite a nova descrição");
                String? newDescription = stdin.readLineSync();
                element.description = newDescription!;
                SaveDB.writeDB();
              }
              if (newInput == "3") {
                print("Digite o ID do novo professor orientador");
                String? advisor = stdin.readLineSync();
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
                } else {
                  element.advisor = professor!;
                }
                SaveDB.writeDB();
              }
              if (newInput == "4") {
                print(
                    "Você escolheu remover um usuário da atividade.\nPor favor, insira o ID do usuário.\n");
                String? userID = stdin.readLineSync();
                element.studentsPresents.removeWhere((e) => e.id == userID);
                SaveDB.writeDB();
              }
              if (newInput == "5") {
                element.endDate =
                    DateTime.parse('2022-12-' + currenteDay.toString());
                SaveDB.writeDB();
              }
        
              if (newInput == "6") {
                print("Digite o ID do projeto a ser deletado:\n");
                int idActivity = int.parse(stdin.readLineSync()!);
                DataBase.activeProjects
                    .removeWhere((element) => element.id == idActivity);
              }
            }
          },
        );
      } on FormatException catch (_) {
        print("Operação cancelada! Valor inválido.");
      }
    }

    if (newInput == "3") {
      try {
        print(
            "Você escolheu adicionar um aluno à uma atividade, por favor insira a ID da atividade e o ID do aluno que deseja adicionar:\n");
        int idActivity = int.parse(stdin.readLineSync()!);
        String idStudent = stdin.readLineSync()!;
        DataBase.activeActivities.forEach(
          (element) {
            if (element.id == idActivity) {
              IUser? student = DataBase.usersDb
                  .firstWhere((element) => element.id == idStudent);
              element.studentsPresents.add(student);
            }
          },
        );
        SaveDB.writeDB();
        print("Aluno adicionado com sucesso!");
      } on FormatException catch (_) {
        print("Operação cancelada! Valor inválido.");
      }
    }
  }
}
