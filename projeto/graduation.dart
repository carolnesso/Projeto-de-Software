import 'student.dart';

class Graduation extends Student {
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
        );
}
