import 'dart:io';
import '../../models/doctorate.dart';
import '../../models/graduation.dart';
import '../../models/master.dart';
import '../../models/professional.dart';
import '../../models/professor.dart';
import '../../models/user.dart';
import '../../database/dataBase.dart';
import '../../database/save_db.dart';
import '../../singleton.dart';

abstract class UserArea{

  static createNewUser() {
    print(
        "Você selecionou criar um usuário\nPor favor, insira os dados pedidos a seguir:");
    print("Insira seu número de matrícula:");
    String? id = stdin.readLineSync();
    print("Insira seu nome de usuário:");
    String? name = stdin.readLineSync();
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
    print("5 - Profissional;");
    String? type = stdin.readLineSync();
    late IUser newUser;
    if (type == "1") {
      newUser = Professor(
        id: id!,
        name: name!,
        login: login!,
        password: password!,
        recoveryKey: recoveryKey!,
      );
    }
    if (type == "2") {
      newUser = Graduation(
        id: id!,
        name: name!,
        login: login!,
        password: password!,
        recoveryKey: recoveryKey!,
      );
    }
    if (type == "3") {
      newUser = MastersDegree(
        id: id!,
        name: name!,
        login: login!,
        password: password!,
        recoveryKey: recoveryKey!,
      );
    }
    if (type == "4") {
      newUser = DoctorateDegree(
        id: id!,
        name: name!,
        login: login!,
        password: password!,
        recoveryKey: recoveryKey!,
      );
    }
    if (type == "5") {
      newUser = Professional(
          id: id!,
          name: name!,
          login: login!,
          password: password!,
          recoveryKey: recoveryKey!);
    }
    print("Pronto! Novo usuário criado com sucesso!");
    DataBase.usersDb.add(newUser);
    SaveDB.writeDB();
    return;
  }

  static userArea() {
    print("Você escolheu a área de usuários.\nO que você deseja fazer?\n");
    print("1 - Editar usuário");
    print("2 - Excluir usuário");
    String? input = stdin.readLineSync();
    if (input == "1") {
      print("O que você deseja alterar?");
      print("1 - Alterar nome de usuário");
      print("2 - Alterar forma de login");
      print("3 - Alterar senha de acesso");
      print("4 - Alterar a chave de recuperação");
      String? newInput = stdin.readLineSync();

      if (newInput == "1") {
        print("Digite o nome desejado:\n");
        String? newName = stdin.readLineSync();
        section!.setName = newName ?? 'Sem nome';
        print("Seu nome foi salvo!\n");
        SaveDB.writeDB();
      }

      if (newInput == "2") {
        print("Digite seu novo login:\n");
        String? newLogin = stdin.readLineSync();
        section!.setLogin = newLogin!;
        print("Pronto, seu novo login foi salvo!\n");
        SaveDB.writeDB();
      }

      if (newInput == "3") {
        print("Digite sua nova senha:\n");
        String? newPassword = stdin.readLineSync();
        section!.setPassword = newPassword!;
        print("Pronto, sua nova senha foi salva!\n");
        SaveDB.writeDB();
      }

      if (newInput == "4") {
        print("Digite a sua nova chave de recuperação:\n");
        String? newRecoveryKey = stdin.readLineSync();
        section!.setRecoveryKey = newRecoveryKey!;
        print("Pronto, sua nova chave de recuperação está salva!\n");
        SaveDB.writeDB();
      }
    }

    if (input == "2") {
      if (!(section! is Professor)) {
        print("Essa ação só pode ser acessada por um Professor!\n");
        return;
      }
      print("Digite o ID do usuário que deseja excluir:\n");
      String? userID = stdin.readLineSync();
      print(userID);
      print(DataBase.usersDb.length);
      DataBase.usersDb.removeWhere((element) => element.id == userID);
      print(DataBase.usersDb.length);
      print("O usuário foi removido com sucesso!");
      SaveDB.writeDB();
    }
  }
}