import 'dart:io';

import '../../models/activity.dart';
import '../../models/professional.dart';
import '../../models/professor.dart';
import '../../models/project.dart';
import '../../models/user.dart';
import '../../database/dataBase.dart';
import '../../database/save_db.dart';
import '../../singleton.dart';

abstract class ProjectArea {
  static projectArea() {
    print("Você escolheu a área de projetos.\nO que você deseja fazer?:\n");
    print("1 - Criar um projeto;");
    print("2 - Editar um projeto;");
    print("3 - Adicionar um aluno à um projeto;");
    print("4 - Adicionar uma atividade à um projeto;");
    print("5 - Adicionar um profissional ao projeto");
    String? newInput = stdin.readLineSync();

    if (newInput == "1") {
      print(
          "Você escolheu criar projeto. Digite as seguintes informações pedidas:");
      print("Insira o nome do projeto:\n");
      String title = stdin.readLineSync()!;
      print("Insira uma descrição para o projeto:");
      String description = stdin.readLineSync()!;
      print("Insira o valor da bolsa:");
      double? value = double.parse(stdin.readLineSync()!);
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
      late Project newProject;
      newProject = Project(
        title: title,
        id: currenteProjectID,
        description: description,
        paymentValue: value,
        advisor: professor!,
        beginDate: DateTime.now(),
        status: ProjectStatus.INITIATED,
      );
      print("Seu ID de projeto é: " +
          currenteProjectID.toString() +
          "\nNecessário salvá-lo para futuras alterações e/ou consultas.\n");
      currenteProjectID = currenteProjectID + 1;

      DataBase.activeProjects.add(newProject);
      SaveDB.writeDB();
      return;
    }

    if (newInput == "2") {
      try {
        print("Insira a ID do projeto que deseja editar");
        int idProject = int.parse(stdin.readLineSync()!);
        DataBase.activeProjects.forEach(
          (element) {
            if (element.id == idProject) {
              print("O que você deseja alterar?\n");
              print("1 - Alterar o nome");
              print("2 - Alterar descrição");
              print("3 - Alterar coordenador do projeto");
              print("4 - Remover um aluno do projeto");
              print("5 - Marcar projeto como concluído");
              print("6 - Excluir projeto");
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
                    "Você escolheu remover um usuário do projeto.\nPor favor, insira o ID do usuário.\n");
                String? userID = stdin.readLineSync();
                element.studentsPresents.removeWhere((e) => e.id == userID);
                IUser user = DataBase.usersDb
                    .firstWhere((student) => student.id == userID);
                user.setPaymentValue = user.paymentValue - element.paymentValue;
                SaveDB.writeDB();
              }
              if (newInput == "5") {
                if (element.status == ProjectStatus.CONCLUDED) {
                  print(
                      "O projeto em questão já foi concluído.\nPor favor, verifique o ID inserido e tente novamente.\n");
                } else {
                  element.status = ProjectStatus.CONCLUDED;
                  element.endDate = DateTime.now();
                }
                SaveDB.writeDB();
              }

              if (newInput == "6") {
                print("Digite o ID do projeto a ser deletado:\n");
                int idProject = int.parse(stdin.readLineSync()!);
                DataBase.activeProjects
                    .removeWhere((element) => element.id == idProject);
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
            "Você escolheu adicionar um aluno à um projeto, por favor insira a ID do projeto e o ID do aluno que deseja adicionar:\n");
        int idProject = int.parse(stdin.readLineSync()!);
        String idStudent = stdin.readLineSync()!;
        DataBase.activeProjects.forEach(
          (element) {
            if (element.id == idProject) {
              IUser? student = DataBase.usersDb
                  .firstWhere((element) => element.id == idStudent);
              element.studentsPresents.add(student);
              student.setPaymentValue =
                  student.paymentValue + element.paymentValue;
              element.updateStatus();
            }
          },
        );
        SaveDB.writeDB();
      } on FormatException catch (_) {
        print("Operação cancelada! Valor inválido.");
      }
    }

    if (newInput == "4") {
      try {
        print(
            "Você escolheu adicionar uma atividade à um projeto, por favor insira a ID do projeto e o ID da atividade que deseja adicionar:\n");
        int idProject = int.parse(stdin.readLineSync()!);
        int idActivity = int.parse(stdin.readLineSync()!);
        DataBase.activeProjects.forEach(
          (element) {
            if (element.id == idProject) {
              Activity? activity = DataBase.activeActivities
                  .firstWhere((element) => element.id == idActivity);
              element.projectActivities.add(activity);
              element.updateStatus();
            }
          },
        );
        SaveDB.writeDB();
      } on FormatException catch (_) {
        print("Operação cancelada! Valor inválido.");
      }
    }
    if (newInput == "5") {
      try {
        print(
            "Você escolheu adicionar um profissional à um projeto, por favor insira a ID do projeto e o ID do profissional que deseja adicionar:\n");
        int idProject = int.parse(stdin.readLineSync()!);
        String idProfessional = stdin.readLineSync()!;
        IUser? professional;
        DataBase.activeProjects.forEach(
          (element) {
            if (element.id == idProject) {
              DataBase.usersDb.forEach(
                (element) {
                  if (element.id == idProfessional &&
                      element.runtimeType == Professional) {
                    professional = element;
                  }
                },
              );
              if (professional == null) {
                print(
                    "O usuário não é um professor ou não foi encontrado.\nTente novamente.\n");
              } else {
                element.professionalsPresents.add(professional as Professional);
                element.updateStatus();
              }
            }
          },
        );
        SaveDB.writeDB();
      } on FormatException catch (_) {
        print("Operação cancelada! Valor inválido.");
      }
    }
  }
}
