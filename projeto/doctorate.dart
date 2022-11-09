import 'student.dart';

class DoctorateDegree extends Student {
  DoctorateDegree({
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
