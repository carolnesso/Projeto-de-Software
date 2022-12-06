import 'dart:io';

import 'areas/activities_area.dart';
import 'areas/project_area.dart';
import '../database/save_db.dart';
import '../singleton.dart';
import '../database/dataBase.dart';
import 'areas/search_area.dart';
import 'areas/user_area.dart';

class Menu {
  bool isRunning = true;

  Menu() {
    _run();
  }

  void _run() {
    while (isRunning) {
      while (section == null) {
        print(
            "Bem vindo ao gerenciador de projetos de extenção da UFAL.\nO que deseja fazer hoje?");
        print("\n");
        print("1 - Logar");
        print("2 - Criar um novo usuário;");
        print("3 - Mudar/Recuperar a senha;");
        print("0 - SAIR");

        String? input = stdin.readLineSync();

        if (input == "1") {
          print("Digite seu login (CPF/email):");
          String? login = stdin.readLineSync();
          print("Digite sua senha:");
          String? password = stdin.readLineSync();
          DataBase.usersDb.forEach(
            (element) {
              if (element.login == login && element.password == password) {
                print("Usuário com o ID: " + element.id + " está logado.\n");
                section = element;
              }
            },
          );
          continue;
        }

        if (input == "2") {
          UserArea.createNewUser();
        }

        if (input == "3") {
          print("Digite sua chave de recuperação:");
          String? recoveryKey = stdin.readLineSync();
          DataBase.usersDb.forEach(
            (element) {
              if (element.recoveryKey == recoveryKey) {
                print("Digite sua nova senha:\n");
                String newPassword = stdin.readLineSync()!;
                element.setPassword = newPassword;
              }
            },
          );
          SaveDB.writeDB();
          continue;
        }

        if (input == "0") {
          isRunning = false;
          break;
        }
      }

      while (section != null) {
        print("1 - Área projetos");
        print("2 - Área atividades");
        print("3 - Área do usuário");
        print("4 - Gerar relatório de projeto");
        print("5 - Consultas");
        print("6 - Realizar fazer e desfazer");
        print("7 - Passar dia ");
        print("\n");
        print("0 - LogOut");
        String? input = stdin.readLineSync();

        if (input == "1") {
          ProjectArea.projectArea();
        }

        if (input == "2") {
          ActivitiesArea.activitiesArea();
        }

        if (input == "3") {
          UserArea.userArea();
        }

        if (input == "4") {
          return;
        }

        if(input == "5") {
          SearchArea.searchArea();
        }

        if(input == "6") {
          return;
        }

        if(input == "7") {
          currenteDay++;
          print("Dias passados:" + currenteDay.toString());
        }

        if (input == "0") {
          section = null;
        }
      }
    }
  }
}