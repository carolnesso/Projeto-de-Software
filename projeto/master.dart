import 'student.dart';

class MastersDegree extends Student {
  MastersDegree({
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
