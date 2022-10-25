import 'student.dart';

class Graduation extends Student {
  String type = "Graduation student";
  Graduation({
    required String id,
    required String login,
    required String password,
    required String recoveryKey,
  }) : super(
          id: id,
          login: login,
          password: password,
          recoveryKey: recoveryKey,
        ) {}
}
