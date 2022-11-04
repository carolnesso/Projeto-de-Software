import 'dart:io';
import 'activity.dart';
import 'doctorate.dart';
import 'graduation.dart';
import 'master.dart';
import 'professor.dart';
import 'project.dart';
import 'saveDB.dart';
import 'singleton.dart';
import 'user.dart';
import 'dataBase.dart';

class Menu {
  IUser? section;
  bool isRunning = true;

  Menu() {
    _run();
  }

  void _run() {
    while (isRunning) {
      while (section == null) {
        // ###### start menu ######
        print(
            "Bem vindo ao gerenciador de projetos de extenção da UFAL.\nO que deseja fazer hoje?");
        print("\n");
        print("1 - Logar");
        print("2 - Criar um novo usuário;");
        print("3 - Mudar/Recuperar a senha;");
        print("0 - SAIR");

        String? input = stdin.readLineSync();

        // ###### Login area ######
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

        // ###### create a new user ######
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
          // graduation's degree student
          if (type == "2") {
            newUser = Graduation(
              id: id!,
              login: login!,
              password: password!,
              recoveryKey: recoveryKey!,
            );
          }
          // Master's Degree student
          if (type == "3") {
            newUser = MastersDegree(
              id: id!,
              login: login!,
              password: password!,
              recoveryKey: recoveryKey!,
            );
          }
          // PhD student
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
          SaveDB.writeDB();
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
          SaveDB.writeDB();
          continue;
        }

        //close
        if (input == "0") {
          isRunning = false;
          break;
        }
      }

      // ###### login user menu ######
      while (section != null) {
        print("1 - Área projetos");
        print("2 - Área atividades");
        print("3 - Área do usuário");
        print("4 - Gerar relatório de projeto");
        print("5 - Consultas");
        print("6 - Realizar fazer e desfazer");
        print("\n");
        print("0 - LogOut");
        String? input = stdin.readLineSync();

        // ###### Project area ######
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
              continue;
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
            continue;
          }

          // edit a existent project;
          // TODO: criar edicão de projeto
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
                  String? newInput = stdin.readLineSync();

                  // edit project title
                  if (newInput == "1") {
                    print("Digite o novo título do projeto");
                    String? newTile = stdin.readLineSync();
                    element.title = newTile!;
                    SaveDB.writeDB();
                  }
                  // edit project description
                  if (newInput == "2") {
                    print("Digite a nova descrição");
                    String? newDesciption = stdin.readLineSync();
                    element.description = newDesciption!;
                    SaveDB.writeDB();
                  }
                  // change advisor
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
                  // remove a user from the project
                  // TODO arrumar a parte de remover usuário do projeto
                  if (newInput == "4") {
                    // print(
                    //     "Você escolheu remover um usuário do projeto.\nPor favor, insira o ID do usuário.\n");
                    // String? userID = stdin.readLineSync();
                    // element.studentsPresents.forEach(
                    //   (users) {
                    //     if(users.id == userID){
                    //       element.studentsPresents.pop();
                    //     }
                    //   },
                    // );
                  }
                  // mark project as complete
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
                }
              },
            );
          }

          // add students a select project;
          if (newInput == "3") {
            print(
                "Você escolheu adicionar um aluno à um projeto, por favor insira a ID do projeto e o ID do aluno que deseja adicionar:\n");
            int idProject = int.parse(stdin.readLineSync()!);
            String idStudent = stdin.readLineSync()!;
            DataBase.activeProjects.forEach(
              (element) {
                // print(element.id);
                if (element.id == idProject) {
                  IUser? student = DataBase.usersDb
                      .firstWhere((element) => element.id == idStudent);
                  element.studentsPresents.add(student);
                  element.updateStatus();
                }
              },
            );
            SaveDB.writeDB();
          }

          // add an activities a select project;
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
        }

        // ###### Activities area ######
        if (input == "2") {
          print(
              "Você escolheu a área de atividades.\nO que você deseja fazer?:\n");
          print("1 - Criar uma atividade;");
          print("2 - Editar uma ativiade;");
          print("3 - Adicionar um aluno à uma atividade;");
          String? newInput = stdin.readLineSync();

          // create a new activity
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
              continue;
            }
            late Activity newActivity;
            newActivity = Activity(
              title: title,
              id: currrentActivitiesID,
              description: description,
              advisor: professor!,
              beginDate: DateTime.now(),
            );
            print("Seu ID de atividade é: " +
                currrentActivitiesID.toString() +
                "\nNecessário salvá-lo para futuras alteracões e/ou consultas.\n");
            currrentActivitiesID = currrentActivitiesID + 1;

            DataBase.activeActivities.add(newActivity);
            SaveDB.writeDB();
            continue;
          }

          // edit an existing activity
          // TODO: criar edicão de atividade existente
          if (newInput == "2") {
            continue;
          }

          // add a student to an activity
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

        // ###### User area #######
        if (input == "3") {
          print(
              "Você escolheu a área de usuários.\nO que você deseja fazer?\n");
          print("1 - Editar usuário");
          print("2 - Excluir usuário");
        }

        if (input == "0") {
          section = null;
        }
      }
    }
  }
}
