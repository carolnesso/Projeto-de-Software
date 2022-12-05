import 'student.dart';

class MastersDegree extends Student {
  MastersDegree({
    required String id,
    required String name,
    required String login,
    required String password,
    required String recoveryKey,
  }) : super(
          id: id,
          name: name,
          login: login,
          password: password,
          recoveryKey: recoveryKey,
        );
}
