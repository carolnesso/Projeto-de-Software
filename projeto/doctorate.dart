import 'student.dart';

class Doctorate_degree extends Student {
  String type = "Doctorate degree student";
  Doctorate_degree({
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
          researchGrantBegin: researchGrantBegin,
          researchGrantDeadline: researchGrantDeadline,
        ) {}
}
