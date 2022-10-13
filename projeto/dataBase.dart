import 'user.dart';

class DataBase {
  List<User> _usersDb = List.generate(
      0,
      (index) => User(
            id: "",
            login: "",
            password: "",
            recoveryKey: "",
          ),
      growable: true);

  get usersDb => this._usersDb;

  set setUsersDb(User newUser) {
    this._usersDb.add(newUser);
  }
}
