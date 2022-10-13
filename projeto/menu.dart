import 'dart:io';
import 'user.dart';
import 'dataBase.dart';

void main(List<String> args) {
  print(
      "Bem vindo ao gerenciador de projetos de extenção da UFAL.\nO que deseja fazer hoje?");
  print("\n");
  print("1 - Criar um novo usuário;");
  print("2 - Área projetos");
  print("3 - Área atividades");
  print("4 - Área do usuário");
  print("5 - Remover um usuário");
  print("6 - Gerar relatório de projeto");
  print("7 - Consultas");
  print("8 - Realizar fazer e desfazer");
  print("\n");
  print("0 - SAIR");

  String? input = stdin.readLineSync();
  while (input != 0) {
    if (input == "1") {
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

      DataBase newDb = DataBase();
      newDb.setUsersDb = newUser;
    }
  }
}
