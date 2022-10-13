import 'dart:io';
import 'user.dart';
import 'dataBase.dart';

class Menu {
  User? section;
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
          DataBase.usersDb.forEach((element) {
            if (element.login == login && element.password == password) {
              print(element.id);
              section = element;
            }
          });

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
          print("Pronto! Novo usuário criado com sucesso!");
          User newUser = User(
            id: id!,
            login: login!,
            password: password!,
            recoveryKey: recoveryKey!,
          );
          DataBase.usersDb.add(newUser);
          //if my class wasn't abstract, i will set db as was written bellow
          // DataBase newDb = DataBase();
          // newDb.setUsersDb = newUser;
          continue;
        }
        //recover password
        if (input == "3") {
          print("Digite sua chave de recuperação:");
          String? recoveryKey = stdin.readLineSync();
          DataBase.usersDb.forEach((element) {
            if (element.recorveryKey == recoveryKey) {}
          });
        }

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
          continue;
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
