import 'dart:io';
import 'doctorate.dart';
import 'graduation.dart';
import 'master.dart';
import 'professor.dart';
import 'project.dart';
import 'saveDB.dart';
import 'singleton.dart';
import 'student.dart';
import 'user.dart';
import 'dataBase.dart';

class Menu {
  IUser? section;
  bool isRunning = true;
  Menu() {
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
          print("Digite seu CPF:");
          String? login = stdin.readLineSync();
          print("Digite sua senha:");
          String? password = stdin.readLineSync();
          DataBase.usersDb.forEach(
            (element) {
              if (element.login == login && element.password == password) {
                print(element.id + "\n");
                section = element;
              }
            },
          );

          continue;
        }

        //create a new user
        if (input == "2") {
          print(
              "Você selecionou criar um usuário\nPor favor, insira os dados pedidos a seguir:");
          print("Insira seu número de matrícula:");
          String? id = stdin.readLineSync();
          print("Digite seu email/CPF:");
          String? login = stdin.readLineSync();
          print("Digite uma senha desejada:");
          String? password = stdin.readLineSync();
          print(
              "Digite uma palavra ou sequência numérica, que você terá que guardar para depois, para poder usar para recuperar ou mudar sua senha:");
          String? recoveryKey = stdin.readLineSync();
          print("Por fim, selecione qual o tipo do usuário?");
          print("1 - Professor;");
          print("2 - Aluno de graduação;");
          print("3 - Aluno de mestrado;");
          print("4 - Aluno de doutorado;");
          String? type = stdin.readLineSync();
          late IUser newUser;
          // professor
          if (type == "1") {
            newUser = Professor(
              id: id!,
              login: login!,
              password: password!,
              recoveryKey: recoveryKey!,
            );
          }
          // graduation student
          if (type == "2") {
            newUser = Graduation(
              id: id!,
              login: login!,
              password: password!,
              recoveryKey: recoveryKey!,
            );
          }

          //
          if (type == "3") {
            newUser = MastersDegree(
              id: id!,
              login: login!,
              password: password!,
              recoveryKey: recoveryKey!,
            );
          }

          if (type == "4") {
            newUser = DoctorateDegree(
              id: id!,
              login: login!,
              password: password!,
              recoveryKey: recoveryKey!,
            );
          }
          print("Pronto! Novo usuário criado com sucesso!");

          DataBase.usersDb.add(newUser);
          //if my class wasn't abstract, i will set db as was written bellow
          // DataBase newDb = DataBase();
          // newDb.setUsersDb = newUser;
          SaveDB.saveDB();
          continue;
        }
        //recover password
        if (input == "3") {
          print("Digite sua chave de recuperação:");
          String? recoveryKey = stdin.readLineSync();
          DataBase.usersDb.forEach(
            (element) {
              if (element.recorveryKey == recoveryKey) {
                print("Digite sua nova senha:\n");
                String newPassword = stdin.readLineSync()!;
                element.setPassword = newPassword;
              }
            },
          );
          SaveDB.saveDB();
          continue;
        }

        // print(DataBase.usersDb[0].recorveryKey);

        //close
        if (input == "0") {
          isRunning = false;
          break;
        }
      }

      while (section != null) {
        print("1 - Área projetos");
        print("2 - Área atividades");
        print("3 - Área do usuário");
        print("4 - Remover um usuário");
        print("5 - Gerar relatório de projeto");
        print("6 - Consultas");
        print("7 - Realizar fazer e desfazer");
        print("\n");
        print("0 - LogOut");
        String? input = stdin.readLineSync();

        if (input == "1") {
          print(
              "Você escolheu a área de projetos.\nO que você deseja fazer?:\n");
          print("1 - Criar um projeto;");
          print("2 - Editar um projeto;");
          print("3 - Adicionar um aluno à um projeto;");
          print("4 - Adicionar uma atividade à um projeto;");
          String? newInput = stdin.readLineSync();

          // create a new project;
          if (newInput == "1") {
            print(
                "Você escolheu criar projeto. Digite as seguintes informações pedidas:");
            print("Insira o nome do projeto:\n");
            String title = stdin.readLineSync()!;
            print("Insira uma descrição para o projeto:");
            String description = stdin.readLineSync()!;
            print("Insira o ID do professor coordenador");
            String coordinator = stdin.readLineSync()!;
            late Project newProject;
            newProject = Project(
              title: title,
              id: currenteProjectID,
              description: description,
              coordinator: coordinator,
              beginDate: DateTime.now(),
            );
            currenteProjectID++;

            DataBase.activeProjcts.add(newProject);
            SaveDB.saveDB();
            continue;
          }

          // edit a existent project;
          if (newInput == "2") {
            continue;
          }

          // add students a select project;
          if (newInput == "3") {
            print(
                "Você escolheu adicionar um aluno à um projeto, por favor insira a ID do projeto e o ID do aluno que deseja adicionar:\n");
            int idProject = int.parse(stdin.readLineSync()!);
            String idStudent = stdin.readLineSync()!;
            DataBase.activeProjcts.forEach((element) {
              print(element.id);
              if (element.id == idProject) {
                IUser? student = DataBase.usersDb
                    .firstWhere((element) => element.id == idStudent);
                element.studentsPresents.add(student);
              }
            });
            SaveDB.saveDB();
          }

          // add an activities a select projects;
          if (newInput == "4") {
            continue;
          }
        }

        if (input == "2") {
          continue;
        }

        if (input == "0") {
          section = null;
        }
      }
    }
  }
}
