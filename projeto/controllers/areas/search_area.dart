import 'dart:io';

import '../../database/dataBase.dart';

abstract class SearchArea {
  static searchArea() {
    print("Em qual área deseja consultar?");
    print("1 - Consultar usuários;");
    print("2 - Consultar projetos;");
    print("3 - Consultar atividades;");
    String? input = stdin.readLineSync();

    if (input == "1") {
      searchUser();
    }

    if (input == "2") {
      searchProject();
    }

    if (input == "3") {
      searchActivity();
    }
  }

  static searchUser() {
    print("Insira o ID do usuário desejado:\n");
    String? userID = stdin.readLineSync();
    DataBase.usersDb.forEach(
      (element) {
        if (userID == element.id) {
          print("Nome: " + element.name);
          print("Login: " + element.login);
          print("ID: " + element.id);
        }
      },
    );

    print("Projetos participantes:\n");
    DataBase.activeProjects.forEach(
      (project) {
        if (project.studentsPresents
            .contains((element) => element.id == userID)) {
          print(project.title);
        }
      },
    );

    print("Atividades atreladas:\n");
    DataBase.activeActivities.forEach(
      (activity) {
        if (activity.studentsPresents
            .contains((element) => element.id == userID)) {
          print(activity.title);
        }
      },
    );
  }

  static searchProject() {
    print("Digite o ID do projeto desejado:\n");
    int projectID = int.parse(stdin.readLineSync()!);

    DataBase.activeProjects.forEach(
      (element) {
        if (projectID == element.id) {
          print("Título: " + element.title);
          print("Descrição: " + element.description);
          print("Status: " + element.status.toString());
          print("Data de início: " + element.beginDate.toString());
          print("Data de fim: "+element.endDate.toString());
          print("Valor da bolsa: " + element.paymentValue.toString());
        }
      },
    );
  }

  static searchActivity() {
    print("Digite o ID da atividade desejada:\n");
    int projectID = int.parse(stdin.readLineSync()!);

    DataBase.activeActivities.forEach(
          (element) {
        if (projectID == element.id) {
          print("Título: " + element.title);
          print("Descrição: " + element.description);
          print("Data de início: " + element.beginDate.toString());
          print("Data de fim: " + element.endDate.toString());
        }
      },
    );
  }
}
