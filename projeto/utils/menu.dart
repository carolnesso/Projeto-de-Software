import 'dart:io';
import '../models/activity.dart';
import '../models/professional.dart';
import '../models/professor.dart';
import '../models/project.dart';
import 'save_db.dart';
import 'singleton.dart';
import '../models/user.dart';
import 'dataBase.dart';
import 'user_area.dart';

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
        //TODO: Adiciona 1 a variavel current day, percorre a lista de usuarios e pega o valor de paymentValue e adicona a wallet
        print("\n");
        print("0 - LogOut");
        String? input = stdin.readLineSync();

        if (input == "1") {
          _projectArea();
        }

        if (input == "2") {
          _activitiesArea();
        }

        if (input == "3") {
          UserArea.userArea();
        }

        if (input == "0") {
          section = null;
        }
      }
    }
  }


  void _projectArea() {
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
        advisor: professor!,
        beginDate: DateTime.now(),
        status: ProjectStatus.INITIATED,
      );
      print("Seu ID de projeto é: " +
          currenteProjectID.toString() +
          "\nNecessário salvá-lo para futuras alteracões e/ou consultas.\n");
      currenteProjectID = currenteProjectID + 1;

      DataBase.activeProjects.add(newProject);
      SaveDB.writeDB();
      return;
    }

    if (newInput == "2") {
      print("Insira a ID do projeto que deseja editar");
      int idProject = int.parse(stdin.readLineSync()!);
      DataBase.activeProjects.forEach(
        (element) {
          if (element.id == idProject) {
            print("O que você deseja alterar?\n");
            print("1 - Alterar o nome");
            print("2 - Alterar descricão");
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
              String? newDesciption = stdin.readLineSync();
              element.description = newDesciption!;
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
    }

    if (newInput == "3") {
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
    }

    if (newInput == "4") {
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
    }
    if (newInput == "5") {
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
    }
  }

  void _activitiesArea() {
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
