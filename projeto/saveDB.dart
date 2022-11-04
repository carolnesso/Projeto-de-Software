import 'dart:io';
import 'dataBase.dart';

abstract class SaveDB {
  static writeDB() async {
    String db = '';
    DataBase.usersDb.forEach((element) {
      db = db +
          'Usuário ${element.id}:\n' +
          ' Login: ${element.login}\n' +
          ' Senha: ${element.password}\n' +
          ' Chave de recuperação: ${element.recorveryKey}\n' +
          ' Inicio da bolsa de pesquisa: ${element.researchGrantBegin}\n' +
          ' Final da bolsa de pesquisa: ${element.researchGrantDeadline}\n\n';
    });

    DataBase.activeProjects.forEach((element) {
      String studentListString = '';
      String activitiesListString = '';
      element.studentsPresents.forEach((element) {
        studentListString = studentListString + '${element.id}, ';
      });

      element.projectActivities.forEach((element) {
        activitiesListString = activitiesListString + '${element.id}, ';
      });
      db = db +
          'Projeto ${element.id}:\n' +
          ' Título: ${element.title}\n' +
          ' Descrição: ${element.description}\n' +
          ' ID do Orientador: ${element.advisor.id}\n' +
          ' Data de Início: ${element.beginDate}\n' +
          ' Status do projeto: ${element.status}\n' +
          ' Data de conclusão: ${element.endDate ?? ''}\n' +
          ' ID dos estudantes do projeto: ${studentListString}\n' +
          ' ID das atividades do projeto: ${activitiesListString}\n\n';
    });

    DataBase.activeActivities.forEach((element) {
      String activitiesListString = '';
      element.studentsPresents.forEach((element) {
        activitiesListString = activitiesListString + '${element.id}, ';
      });
      db = db +
          'Atividade ${element.id}:\n' +
          ' Título: ${element.title}\n' +
          ' Descrição: ${element.description}\n' +
          ' Orientador: ${element.advisor}\n' +
          ' ID dos estudantes da atividade: ${activitiesListString}\n\n';
    });

    final filename = 'DB.txt';
    await File(filename).writeAsString(db);
  }
}
