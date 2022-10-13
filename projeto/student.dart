import 'user.dart';

class Student extends User {
  late String type;
  Student({
    required String id,
    required String login,
    required String password,
    required String recoveryKey,
    required researchGrantBegin,
    required researchGrantDeadline,
  }) : super(
          id: id,
          login: login,
          password: password,
          recoveryKey: recoveryKey,
        ) {
    this.type = type;
  }
}
